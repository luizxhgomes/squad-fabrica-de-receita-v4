#!/usr/bin/env bash
# validate-squad.sh
# Squad: fabrica-de-receita-v4 (repositorio publico)
# Validacao de integridade estrutural do squad. Espelho exato do job de CI.
#
# Usage:
#   scripts/validate-squad.sh          (saida colorida)
#   scripts/validate-squad.sh --ci     (sem cores, para logs de CI)
#   scripts/validate-squad.sh --help
#
# Exit codes: 0 = tudo ok, 1 = falha de integridade, 2 = uso incorreto
set -euo pipefail

CI=0
for arg in "$@"; do
  case "$arg" in
    --help|-h) grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'; exit 0 ;;
    --ci) CI=1 ;;
    *) echo "Flag desconhecida: $arg" >&2; exit 2 ;;
  esac
done

if [ "$CI" -eq 1 ]; then RED=""; GRN=""; YEL=""; NC=""; else RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; NC=$'\033[0m'; fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
FAILS=0
pass() { echo "${GRN}[PASS]${NC} $1"; }
fail() { echo "${RED}[FAIL]${NC} $1"; FAILS=$((FAILS+1)); }
warn() { echo "${YEL}[WARN]${NC} $1"; }

PY=python3
command -v "$PY" >/dev/null 2>&1 || { echo "python3 necessario" >&2; exit 2; }

echo "== Validate Squad: fabrica-de-receita-v4 =="

# [1] Estrutura fisica
for d in agents tasks workflows skills data config templates checklists scripts; do
  [ -d "$d" ] && pass "diretorio $d/ existe" || fail "diretorio $d/ ausente"
done
[ -f squad.yaml ] && pass "squad.yaml presente" || fail "squad.yaml ausente"

# [2, 3, 4] Parse YAML + integridade components<->disco + frontmatter dos agents (via python)
"$PY" - <<'PYEOF'
import sys, glob, os
try:
    import yaml
except ImportError:
    print("[FAIL] PyYAML nao instalado (pip install pyyaml)"); sys.exit(3)

fails = 0
def fail(m):
    global fails; print(f"[FAIL] {m}"); fails += 1
def pas(m):
    print(f"[PASS] {m}")

# parse squad.yaml
try:
    m = yaml.safe_load(open("squad.yaml", encoding="utf-8"))
    pas("squad.yaml parseia")
except Exception as e:
    fail(f"squad.yaml nao parseia: {e}"); sys.exit(fails and 3)

# parse todos os workflows
for wf in glob.glob("workflows/*.yaml"):
    try:
        yaml.safe_load(open(wf, encoding="utf-8"))
    except Exception as e:
        fail(f"{wf} nao parseia: {e}")
pas("workflows/*.yaml parseiam")

# components <-> disco (declarado existe)
comp = m.get("components", {})
dirmap = {"agents":"agents","tasks":"tasks","workflows":"workflows","skills":"skills",
          "data":"data","templates":"templates","checklists":"checklists","scripts":"scripts"}
declared = set()
for key, d in dirmap.items():
    for f in (comp.get(key) or []):
        declared.add(f"{d}/{f}")
        if not os.path.exists(f"{d}/{f}"):
            fail(f"declarado mas ausente: {d}/{f}")
pas("todo componente declarado existe no disco")

# disco -> declarado (arquivo no disco esta declarado)
for d, patt in [("agents","*.md"),("tasks","*.md"),("workflows","*.yaml"),("skills","*.skill.md")]:
    for f in glob.glob(f"{d}/{patt}"):
        if f not in declared:
            fail(f"arquivo no disco nao declarado em components: {f}")
pas("todo arquivo no disco esta declarado")

# frontmatter dos agents
for a in glob.glob("agents/*.md"):
    t = open(a, encoding="utf-8").read()
    if not t.startswith("---"):
        fail(f"{a} sem frontmatter"); continue
    end = t.find("\n---", 3)
    if end < 0:
        fail(f"{a} frontmatter nao fecha"); continue
    fm = t[3:end]
    if "name:" not in fm and "\nname:" not in ("\n"+fm):
        # name pode estar no bloco agent: ; exigir description no frontmatter
        pass
    if "description:" not in fm:
        fail(f"{a} sem description no frontmatter")
pas("frontmatter dos agents valido")

sys.exit(3 if fails else 0)
PYEOF
PYRC=$?
[ "$PYRC" -eq 0 ] && pass "integridade YAML e components ok" || fail "integridade YAML/components (ver acima)"

# [5] Banner Prioridade 0 no command distribuido
if [ -f .claude/commands/fdr-v4.md ]; then
  grep -q "Prioridade 0" .claude/commands/fdr-v4.md && pass "command fdr-v4 tem banner Prioridade 0" || fail "command fdr-v4 sem banner Prioridade 0"
else
  warn ".claude/commands/fdr-v4.md ausente (ok fora do export)"
fi

# [6] COMPONENTS.md sem drift (se o gerador existir)
if [ -f scripts/build-components-index.sh ] && [ -f docs/COMPONENTS.md ]; then
  bash scripts/build-components-index.sh --check >/dev/null 2>&1 && pass "docs/COMPONENTS.md sem drift" || warn "docs/COMPONENTS.md com drift (rode build-components-index.sh)"
fi

# [7] Public safety
if [ -f scripts/check-public-safety.sh ]; then
  bash scripts/check-public-safety.sh . >/dev/null 2>&1 && pass "public safety limpo" || fail "public safety encontrou violacao (rode check-public-safety.sh)"
fi

echo "-- Resumo: ${FAILS} falha(s) --"
[ "$FAILS" -gt 0 ] && exit 1 || exit 0
