#!/usr/bin/env bash
# install.sh
# Squad: fabrica-de-receita (repositorio publico)
# Instalador Modo B: instala o squad em OUTRO projeto Claude Code do usuario.
# Copia o command .claude/commands/fdr.md para o projeto destino reescrevendo
# a linha SQUAD_ROOT para o caminho absoluto deste clone, e (opcional) gera os
# thin-loaders fdr-* globais em ~/.claude/agents.
#
# Usage:
#   ./install.sh --target DIR [--with-agents] [--force]
#   ./install.sh --uninstall --target DIR
#   ./install.sh --check
#   ./install.sh --help
#
# Flags:
#   --target DIR     projeto destino (recebe .claude/commands/fdr.md)
#   --with-agents    tambem instala loaders fdr-* em ~/.claude/agents (absoluto)
#   --uninstall      remove o command do destino e os loaders fdr-* globais
#   --check          verifica que os loaders fdr-* em ~/.claude/agents apontam
#                    para arquivos existentes (check pos-instalacao, fora do CI)
#   --force          sobrescreve arquivos existentes sem perguntar
#   --help
#
# Exit codes: 0 = ok, 1 = falha (arquivo existente sem --force / loader quebrado), 2 = uso incorreto
set -euo pipefail

RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; NC=$'\033[0m'

CLONE="$(cd "$(dirname "$0")" && pwd)"
GLOBAL_AGENTS="$HOME/.claude/agents"

TARGET=""
WITH_AGENTS=0
UNINSTALL=0
CHECK=0
FORCE=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --help|-h) grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'; exit 0 ;;
    --target)
      shift
      [ "$#" -gt 0 ] || { echo "${RED}--target exige um DIR${NC}" >&2; exit 2; }
      TARGET="$1"; shift ;;
    --with-agents) WITH_AGENTS=1; shift ;;
    --uninstall) UNINSTALL=1; shift ;;
    --check) CHECK=1; shift ;;
    --force) FORCE=1; shift ;;
    -*) echo "Flag desconhecida: $1" >&2; exit 2 ;;
    *) echo "Argumento inesperado: $1" >&2; exit 2 ;;
  esac
done

# ---------------------------------------------------------------------------
# --check: valida loaders fdr-* globais (nao precisa de --target)
# ---------------------------------------------------------------------------
if [ "$CHECK" -eq 1 ]; then
  echo "== Check pos-instalacao: loaders fdr-* em $GLOBAL_AGENTS =="
  if [ ! -d "$GLOBAL_AGENTS" ]; then
    echo "${YEL}[WARN] $GLOBAL_AGENTS nao existe. Nada instalado globalmente.${NC}"
    exit 0
  fi
  found=0
  broken=0
  for lf in "$GLOBAL_AGENTS"/fdr-*.md; do
    [ -e "$lf" ] || break
    found=$((found + 1))
    src="$(sed -n 's/^> *Fonte da verdade: *\([^ ]*\).*/\1/p' "$lf" | head -1)"
    if [ -z "$src" ]; then
      echo "${RED}[FAIL]${NC} $(basename "$lf"): sem linha 'Fonte da verdade'"
      broken=$((broken + 1)); continue
    fi
    if [ -f "$src" ]; then
      echo "${GRN}[PASS]${NC} $(basename "$lf") -> $src"
    else
      echo "${RED}[FAIL]${NC} $(basename "$lf") -> $src (ausente)"
      broken=$((broken + 1))
    fi
  done
  if [ "$found" -eq 0 ]; then
    echo "${YEL}[WARN] nenhum loader fdr-* encontrado em $GLOBAL_AGENTS${NC}"
    exit 0
  fi
  echo "-- $found loader(s), $broken quebrado(s) --"
  [ "$broken" -gt 0 ] && exit 1 || exit 0
fi

# ---------------------------------------------------------------------------
# --uninstall: remove command do destino + loaders globais
# ---------------------------------------------------------------------------
if [ "$UNINSTALL" -eq 1 ]; then
  [ -n "$TARGET" ] || { echo "${RED}--uninstall exige --target DIR${NC}" >&2; exit 2; }
  removed=0
  cmd="$TARGET/.claude/commands/fdr.md"
  if [ -f "$cmd" ]; then
    rm -f "$cmd"; echo "${GRN}removido:${NC} $cmd"; removed=$((removed + 1))
  else
    echo "${YEL}nao encontrado:${NC} $cmd"
  fi
  if [ -d "$GLOBAL_AGENTS" ]; then
    for lf in "$GLOBAL_AGENTS"/fdr-*.md; do
      [ -e "$lf" ] || break
      rm -f "$lf"; echo "${GRN}removido:${NC} $lf"; removed=$((removed + 1))
    done
  fi
  echo "-- desinstalacao concluida ($removed item(s) removido(s)) --"
  exit 0
fi

# ---------------------------------------------------------------------------
# Instalacao (default): exige --target
# ---------------------------------------------------------------------------
[ -n "$TARGET" ] || { echo "${RED}informe o projeto destino com --target DIR (ou use --check / --help)${NC}" >&2; exit 2; }
[ -d "$TARGET" ] || { echo "${RED}destino invalido (nao e diretorio): $TARGET${NC}" >&2; exit 2; }

SRC_CMD="$CLONE/.claude/commands/fdr.md"
[ -f "$SRC_CMD" ] || { echo "${RED}command de origem ausente: $SRC_CMD${NC}" >&2; exit 1; }

DEST_DIR="$TARGET/.claude/commands"
DEST_CMD="$DEST_DIR/fdr.md"

if [ -f "$DEST_CMD" ] && [ "$FORCE" -eq 0 ]; then
  echo "${RED}ja existe: $DEST_CMD${NC}" >&2
  echo "${YEL}use --force para sobrescrever.${NC}" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"
# Reescreve o valor de SQUAD_ROOT para o caminho absoluto deste clone.
# Delimitador '#' pois o path nao contem '#'.
sed "s#^\([[:space:]]*\)SQUAD_ROOT:.*#\1SQUAD_ROOT: ${CLONE}#" "$SRC_CMD" > "$DEST_CMD"

echo "${GRN}[PASS] command instalado:${NC} $DEST_CMD"
echo "        SQUAD_ROOT apontando para: $CLONE"

AGENTS_MSG="(loaders globais NAO instalados; use --with-agents para instalar)"
if [ "$WITH_AGENTS" -eq 1 ]; then
  bash "$CLONE/scripts/build-loaders.sh" --absolute "$CLONE" --out "$GLOBAL_AGENTS"
  AGENTS_MSG="loaders fdr-* instalados em: $GLOBAL_AGENTS"
fi

echo ""
echo "== Resumo da instalacao =="
echo "  clone (origem)   : $CLONE"
echo "  projeto destino  : $TARGET"
echo "  command          : $DEST_CMD"
echo "  agents globais   : $AGENTS_MSG"
echo ""
echo "  Para desinstalar : ./install.sh --uninstall --target \"$TARGET\""
echo "  Para verificar   : ./install.sh --check"
exit 0
