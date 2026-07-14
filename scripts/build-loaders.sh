#!/usr/bin/env bash
# build-loaders.sh
# Squad: fabrica-de-receita (repositorio publico)
# Gera thin-loaders .claude/agents/fdr-{basename}.md a partir de cada agents/*.md.
# Cada loader aponta para a persona canonica (fonte da verdade) e NAO a duplica.
# Por seguranca de terceiros os loaders NAO recebem permissionMode nem memory.
#
# Formato do loader gerado:
#   frontmatter: name=fdr-{basename}, description (1a frase da persona),
#                tools=[Read, Grep, Glob, Write, Edit, Bash, WebSearch, WebFetch]
#   corpo: marcador ARQUIVO DERIVADO + Fonte da verdade + instrucao de ativacao.
#   chief (cientista-de-marketing) e sub-orchestrator (fabrica-de-receita-master) recebem
#   o bloco Protocolo de Orquestracao Prioridade 0.
#
# Usage:
#   scripts/build-loaders.sh [--relative]         (SQUAD_ROOT=".", destino .claude/agents; default)
#   scripts/build-loaders.sh --absolute DIR [--out DIR]
#                                                 (SQUAD_ROOT=DIR absoluto; destino default .claude/agents)
#   scripts/build-loaders.sh --help
#
# Exit codes: 0 = ok, 1 = falha de geracao, 2 = uso incorreto
set -euo pipefail

RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; NC=$'\033[0m'

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

MODE="relative"       # relative | absolute
SQUAD_ROOT="."        # valor gravado nos loaders
ABS_DIR=""            # DIR do modo --absolute
OUT=""               # destino dos loaders

while [ "$#" -gt 0 ]; do
  case "$1" in
    --help|-h) grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'; exit 0 ;;
    --relative) MODE="relative"; shift ;;
    --absolute)
      MODE="absolute"
      shift
      [ "$#" -gt 0 ] || { echo "${RED}--absolute exige um DIR${NC}" >&2; exit 2; }
      ABS_DIR="$1"; shift ;;
    --out)
      shift
      [ "$#" -gt 0 ] || { echo "${RED}--out exige um DIR${NC}" >&2; exit 2; }
      OUT="$1"; shift ;;
    -*) echo "Flag desconhecida: $1" >&2; exit 2 ;;
    *) echo "Argumento inesperado: $1" >&2; exit 2 ;;
  esac
done

if [ "$MODE" = "absolute" ]; then
  case "$ABS_DIR" in
    /*) : ;;
    *) echo "${RED}--absolute exige caminho ABSOLUTO (recebido: $ABS_DIR)${NC}" >&2; exit 2 ;;
  esac
  SQUAD_ROOT="${ABS_DIR%/}"
else
  SQUAD_ROOT="."
fi

# Destino default: .claude/agents dentro do ROOT do repo.
[ -n "$OUT" ] || OUT="$ROOT/.claude/agents"

AGENTS_DIR="$ROOT/agents"
[ -d "$AGENTS_DIR" ] || { echo "${RED}diretorio agents/ ausente em $ROOT${NC}" >&2; exit 1; }

mkdir -p "$OUT"

# Extrai a 1a frase da description do frontmatter (inline ou bloco '|').
extract_desc() {
  awk '
    BEGIN { fm=0; indesc=0; got=0 }
    /^---[ \t]*$/ { fm++; if (fm==1) next; else exit }
    fm==1 && got==0 {
      if ($0 ~ /^description:[ \t]*\|/) { indesc=1; next }
      if (indesc==0 && $0 ~ /^description:[ \t]*[^ \t]/) {
        line=$0; sub(/^description:[ \t]*/, "", line); print line; got=1; next
      }
      if (indesc==1) {
        if ($0 ~ /^[ \t]*$/) { next }
        if ($0 ~ /^[ \t]+/) { line=$0; sub(/^[ \t]+/, "", line); print line; got=1; indesc=0; next }
        indesc=0
      }
    }
  ' "$1"
}

count=0
for f in "$AGENTS_DIR"/*.md; do
  [ -e "$f" ] || { echo "${YEL}nenhum agents/*.md encontrado${NC}" >&2; break; }
  b="$(basename "$f" .md)"
  gname="fdr-$b"

  raw="$(extract_desc "$f" || true)"
  # 1a frase: recorta ate o primeiro ponto (inclusive); normaliza espacos.
  desc="$(printf '%s' "$raw" | sed 's/\([^.]*\.\).*/\1/' | tr '\t' ' ' | sed 's/  */ /g; s/^ //; s/ $//')"
  [ -n "$desc" ] || desc="Especialista do squad fabrica-de-receita."

  # Bloco de orquestracao apenas para chief e sub-orchestrator.
  orch=""
  case "$b" in
    cientista-de-marketing|fabrica-de-receita-master)
      orch='

## 🔴 Protocolo de Orquestracao, Prioridade 0 (NON_NEGOTIABLE)
Voce e ponto de entrada do squad e SEMPRE: (1) monta um plano de acao
(especialistas, tasks/workflows, sequencia); (2) DELEGA cada etapa ao agent
dono; (3) coordena e consolida a entrega final. NUNCA execute uma task direto
pulando o plano do Chief.'
      ;;
  esac

  target="$OUT/$gname.md"
  {
    printf '%s\n' "---"
    printf '%s\n' "name: $gname"
    printf '%s\n' "description: |"
    printf '  %s\n' "$desc"
    printf '%s\n' "tools: [Read, Grep, Glob, Write, Edit, Bash, WebSearch, WebFetch]"
    printf '%s\n' "---"
    printf '\n'
    printf '%s\n' "# $gname (loader derivado)"
    printf '\n'
    printf '%s\n' "> ⚠️ ARQUIVO DERIVADO, NAO edite manualmente."
    printf '%s\n' "> Fonte da verdade: $SQUAD_ROOT/agents/$b.md  (arquivo canonico do squad)"
    printf '\n'
    printf '%s\n' "## Ativacao"
    printf '%s\n' "1. Leia integralmente a persona canonica em: $SQUAD_ROOT/agents/$b.md"
    printf '%s\n' "2. Adote essa persona como sua identidade operacional."
    printf '%s\n' "3. Leia $SQUAD_ROOT/squad.yaml para conhecer especialistas, tasks e workflows do squad."
    [ -n "$orch" ] && printf '%s\n' "$orch"
  } > "$target"

  count=$((count + 1))
done

echo "${GRN}[PASS] $count loader(s) fdr-* gerado(s) em $OUT (modo: $MODE, SQUAD_ROOT: $SQUAD_ROOT)${NC}"
exit 0
