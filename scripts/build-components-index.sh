#!/usr/bin/env bash
# build-components-index.sh
# Squad: fabrica-de-receita (repositorio publico)
# Gera docs/COMPONENTS.md a partir do squad.yaml e dos arquivos-fonte. Para cada
# categoria (agents, tasks, workflows, skills, data, templates, checklists) lista
# os componentes declarados em components: com o titulo/descricao de 1 linha
# extraido do proprio arquivo. Arquivo derivado: NAO editar a mao.
#
# Extracao por categoria:
#   agents     -> agent.title (bloco agent) ou 1a linha da description
#   tasks      -> titulo (frontmatter) ou campo task ou nome do arquivo
#   workflows  -> workflow.name (ou name/id no topo do yaml)
#   skills     -> name + resumo (1a linha da description)
#   data/templates/checklists -> primeiro heading H1 do arquivo
#
# Usage:
#   scripts/build-components-index.sh            (escreve docs/COMPONENTS.md)
#   scripts/build-components-index.sh --check    (compara com o atual; exit 1 se drift)
#   scripts/build-components-index.sh --help
#
# Exit codes: 0 = ok (ou sem drift), 1 = drift/falha de geracao, 2 = uso incorreto
set -euo pipefail

RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; NC=$'\033[0m'
CHECK=0

for arg in "$@"; do
  case "$arg" in
    --help|-h) grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'; exit 0 ;;
    --check) CHECK=1 ;;
    -*) echo "Flag desconhecida: $arg" >&2; exit 2 ;;
    *) echo "Argumento inesperado: $arg" >&2; exit 2 ;;
  esac
done

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

PY=python3
command -v "$PY" >/dev/null 2>&1 || { echo "${RED}python3 necessario${NC}" >&2; exit 2; }
[ -f squad.yaml ] || { echo "${RED}squad.yaml ausente em $ROOT${NC}" >&2; exit 2; }

OUT="docs/COMPONENTS.md"
TMP="$(mktemp "${TMPDIR:-/tmp}/components-index.XXXXXX")"
trap 'rm -f "$TMP"' EXIT

# Geracao via python3 + pyyaml. argv[1] = arquivo de saida temporario.
set +e
"$PY" - "$TMP" <<'PYEOF'
import sys, os, io

OUT = sys.argv[1]

try:
    import yaml
except ImportError:
    sys.stderr.write("[FAIL] PyYAML nao instalado (pip install pyyaml)\n")
    sys.exit(3)

def load_yaml(path):
    with io.open(path, encoding="utf-8") as f:
        return yaml.safe_load(f)

def read_text(path):
    try:
        with io.open(path, encoding="utf-8") as f:
            return f.read()
    except (OSError, IOError):
        return ""

def frontmatter(path):
    t = read_text(path)
    if t.startswith("---"):
        end = t.find("\n---", 3)
        if end != -1:
            try:
                d = yaml.safe_load(t[3:end]) or {}
            except Exception:
                d = {}
            if isinstance(d, dict):
                return d
    return {}

def first_line(s):
    if not s:
        return ""
    for line in str(s).splitlines():
        line = line.strip()
        if line:
            # cap no comprimento de 1 frase legivel para o indice (max 180 chars)
            if len(line) > 180:
                cut = line[:180]
                dot = cut.rfind(". ")
                line = (cut[:dot + 1] if dot > 60 else cut.rstrip() + "...")
            return line
    return ""

def first_h1(path):
    for line in read_text(path).splitlines():
        line = line.rstrip()
        if line.startswith("# "):
            return line[2:].strip()
    return ""

def desc_agent(path):
    fm = frontmatter(path)
    ag = fm.get("agent")
    if isinstance(ag, dict) and ag.get("title"):
        return str(ag["title"]).strip()
    return first_line(fm.get("description", ""))

def desc_task(path):
    fm = frontmatter(path)
    if fm.get("titulo"):
        return str(fm["titulo"]).strip()
    if fm.get("task"):
        return str(fm["task"]).strip()
    return os.path.splitext(os.path.basename(path))[0]

def desc_skill(path):
    fm = frontmatter(path)
    name = str(fm.get("name", "")).strip()
    resumo = first_line(fm.get("description", ""))
    if name and resumo:
        return "%s: %s" % (name, resumo)
    return resumo or name

def desc_workflow(path):
    try:
        d = load_yaml(path) or {}
    except Exception:
        d = {}
    if isinstance(d, dict):
        wf = d.get("workflow")
        if isinstance(wf, dict):
            return str(wf.get("name") or wf.get("id") or "").strip()
        return str(d.get("name") or d.get("id") or "").strip()
    return ""

def esc(s):
    s = " ".join(str(s).split())
    return s.replace("|", "\\|")

# (chave em components, titulo da secao, extrator ou None p/ H1)
CATS = [
    ("agents",     "Agents",                desc_agent),
    ("tasks",      "Tasks",                 desc_task),
    ("workflows",  "Workflows",             desc_workflow),
    ("skills",     "Skills",                desc_skill),
    ("data",       "Data (knowledge base)", None),
    ("templates",  "Templates",             None),
    ("checklists", "Checklists",            None),
]

try:
    m = load_yaml("squad.yaml") or {}
except Exception as e:
    sys.stderr.write("[FAIL] squad.yaml nao parseia: %s\n" % e)
    sys.exit(3)

comp = m.get("components", {}) or {}
squad_name = str(m.get("name") or os.path.basename(os.getcwd()))

L = []
L.append("<!-- ARQUIVO GERADO, nao editar a mao. Rode scripts/build-components-index.sh. -->")
L.append("")
L.append("# Componentes do squad %s" % squad_name)
L.append("")
L.append("> Indice gerado automaticamente a partir de `squad.yaml` e dos arquivos-fonte.")
L.append("> A fonte da verdade sao os arquivos em cada diretorio. Nao edite este indice manualmente.")
L.append("")

total = 0
for key, title, fn in CATS:
    items = comp.get(key) or []
    L.append("## %s (%d)" % (title, len(items)))
    L.append("")
    if not items:
        L.append("_Nenhum componente declarado._")
        L.append("")
        continue
    L.append("| Componente | Titulo / Descricao |")
    L.append("|---|---|")
    for fname in items:
        path = os.path.join(key, fname)
        if not os.path.exists(path):
            d = "(ARQUIVO AUSENTE)"
        elif fn is None:
            d = first_h1(path) or "(sem descricao)"
        else:
            d = fn(path) or "(sem descricao)"
        L.append("| `%s` | %s |" % (fname, esc(d)))
        total += 1
    L.append("")

L.append("---")
L.append("")
L.append("_Total: %d componentes indexados em %d categorias._" % (total, len(CATS)))
L.append("")

with io.open(OUT, "w", encoding="utf-8") as f:
    f.write("\n".join(L))
PYEOF
PYRC=$?
set -e

[ "$PYRC" -eq 0 ] || { echo "${RED}[FAIL] geracao de COMPONENTS.md falhou (rc=$PYRC)${NC}" >&2; exit 1; }

if [ "$CHECK" -eq 1 ]; then
  if [ -f "$OUT" ] && diff -q "$TMP" "$OUT" >/dev/null 2>&1; then
    echo "${GRN}[PASS] docs/COMPONENTS.md sem drift${NC}"
    exit 0
  fi
  echo "${RED}[FAIL] docs/COMPONENTS.md com drift (rode: scripts/build-components-index.sh)${NC}" >&2
  exit 1
fi

mkdir -p docs
cp "$TMP" "$OUT"
echo "${GRN}[PASS] docs/COMPONENTS.md gerado${NC}"
exit 0
