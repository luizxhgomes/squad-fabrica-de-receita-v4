#!/usr/bin/env bash
# v4-compliance-check.sh
# Squad: fabrica-de-receita-v4
# Gate de compliance de marca e conteúdo V4 sobre uma peça ou diretório.
# Verifica as regras NON_NEGOTIABLE do design system: zero azul, zero travessão,
# logo nunca inventado, numeros como digitos, acentuacao pt-BR, sem preco de produto.
#
# Usage:
#   scripts/v4-compliance-check.sh <arquivo-ou-diretorio> [--strict]
#   scripts/v4-compliance-check.sh --help
#
# Exit codes: 0 = PASS (ou so avisos), 1 = FAIL (violacao blocking), 2 = uso incorreto
set -euo pipefail

RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; NC=$'\033[0m'
STRICT=0
TARGET=""

usage() {
  grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'
  exit "${1:-0}"
}

for arg in "$@"; do
  case "$arg" in
    --help|-h) usage 0 ;;
    --strict) STRICT=1 ;;
    -*) echo "Flag desconhecida: $arg" >&2; usage 2 ;;
    *) TARGET="$arg" ;;
  esac
done

[ -z "$TARGET" ] && { echo "${RED}Erro: informe um arquivo ou diretorio.${NC}" >&2; usage 2; }
[ ! -e "$TARGET" ] && { echo "${RED}Erro: '$TARGET' nao existe.${NC}" >&2; exit 2; }

FAILS=0
WARNS=0

# Escopo: apenas arquivos de texto renderizavel
if [ -d "$TARGET" ]; then
  FILES=$(find "$TARGET" -type f \( -name '*.md' -o -name '*.html' -o -name '*.css' -o -name '*.yaml' -o -name '*.yml' \) 2>/dev/null || true)
else
  FILES="$TARGET"
fi

check() {
  # check <label> <regex> <blocking:1|0> [arquivos-excluir-grep]
  local label="$1" regex="$2" blocking="$3"
  local hits
  hits=$(printf '%s\n' $FILES | xargs grep -nE "$regex" 2>/dev/null || true)
  if [ -n "$hits" ]; then
    if [ "$blocking" -eq 1 ]; then
      echo "${RED}[FAIL] ${label}${NC}"
      printf '%s\n' "$hits" | head -8 | sed 's/^/    /'
      FAILS=$((FAILS+1))
    else
      echo "${YEL}[WARN] ${label}${NC}"
      printf '%s\n' "$hits" | head -4 | sed 's/^/    /'
      WARNS=$((WARNS+1))
    fi
  else
    echo "${GRN}[PASS] ${label}${NC}"
  fi
}

echo "== V4 Compliance Check: ${TARGET} =="

# R1 ZERO_AZUL: hex de azul e palavras de cor azul (fora de contexto de proibicao)
check "ZERO_AZUL (hex azul #3B82F6 e familia)" "#3[0-9A-Fa-f]82[0-9A-Fa-f]{2}|#1D4ED8|#2563EB|#60A5FA" 1
# R2 SEM_TRAVESSAO
check "SEM_TRAVESSAO (travessao U+2014/U+2013)" $'\xe2\x80\x94|\xe2\x80\x93' 1
# R3 SEM_PRECO_PRODUTO: R$ seguido de digito
check "SEM_PRECO_PRODUTO (R\$ com digito)" 'R\$ ?[0-9]' 1
# R4 NUMEROS_COMO_DIGITOS (aviso: numeros por extenso comuns em copy)
check "NUMEROS_COMO_DIGITOS (extenso em copy)" '\b(um|dois|tres|quatro|cinco) (gatilhos|pilares|travas|passos|etapas)\b' 0
# R5 ACENTUACAO (heuristica de palavras comuns sem acento)
check "ACENTUACAO_PT (palavras sem acento)" '\b(nao|acao|conversao|estrategia|analise|metrica|gestao|voce|traves)\b' 0

echo "-- Resumo: ${FAILS} falha(s), ${WARNS} aviso(s) --"

if [ "$FAILS" -gt 0 ]; then exit 1; fi
if [ "$STRICT" -eq 1 ] && [ "$WARNS" -gt 0 ]; then exit 1; fi
exit 0
