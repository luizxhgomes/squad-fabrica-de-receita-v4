#!/usr/bin/env bash
# check-public-safety.sh
# Squad: fabrica-de-receita (repositorio publico)
# Gate de seguranca de conteudo publico: nomes proibidos, infra interna, precos,
# travessao e segredos. Fonte unica dos FORBIDDEN_PATTERNS (o export-public.sh usa
# a mesma lista; manter os dois em sincronia).
#
# Usage:
#   scripts/check-public-safety.sh [dir]        (default: raiz do repo)
#   scripts/check-public-safety.sh --accent-heuristic [dir]
#   scripts/check-public-safety.sh --help
#
# Exit codes: 0 = limpo, 1 = violacao encontrada, 2 = uso incorreto
set -euo pipefail

RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; NC=$'\033[0m'
ACCENT=0
ROOT="."

for arg in "$@"; do
  case "$arg" in
    --help|-h) grep '^#' "$0" | sed 's/^# \{0,1\}//' | sed '1d'; exit 0 ;;
    --accent-heuristic) ACCENT=1 ;;
    -*) echo "Flag desconhecida: $arg" >&2; exit 2 ;;
    *) ROOT="$arg" ;;
  esac
done

cd "$ROOT" 2>/dev/null || { echo "${RED}Diretorio invalido: $ROOT${NC}" >&2; exit 2; }

# Padroes BLOQUEANTES (marca interna, infra interna, preco, travessao, segredo).
# Um por linha: "rotulo|||regex". A busca ignora .git, node_modules e este script.
# Os padroes de marca e de sistema tambem capturam nomes proprios associados.
FORBIDDEN_PATTERNS='Marca interna (surname)|||[Bb]ilinski
Sistema interno|||[Bb]rabissimo
Marca legada|||[Ss]quad [Nn]exus
Dominio interno|||bilinski\.cloud
Figma file_key|||file_key|figma\.com/(file|design)/
Preco de produto (R$)|||R\$ ?[0-9]
Travessao (em/en dash)|||—|–
Path absoluto local|||/Users/
Segredo (chave real)|||sk-[A-Za-z0-9]{20}|ghp_[A-Za-z0-9]{20}|github_pat_[A-Za-z0-9]|AKIA[A-Z0-9]{16}|xox[baprs]-[0-9]|-----BEGIN [A-Z ]*PRIVATE KEY|figd_[A-Za-z0-9]|apify_api_[A-Za-z0-9]'

# Nomes de pessoa e marca de terceiro. Checados em TODOS os formatos, incluindo .html,
# .js e .svg, porque foi exatamente por ai que vazaram antes: o logo estava vetorizado
# dentro de um .svg e a landing page e .html, e nenhum dos dois era varrido.
IDENTITY_PATTERNS='Nome de pessoa (terceiro)|||[Dd]ener|[Ll]ippert|[Bb]aziotti
Marca de terceiro|||\bV4\b|ROI Hunters'

FAILS=0
FILES=$(find . -type f \( -name '*.md' -o -name '*.yaml' -o -name '*.yml' -o -name '*.json' -o -name '*.sh' \) \
  -not -path './.git/*' -not -path './node_modules/*' -not -path './.claude/agent-memory/*' -not -name 'check-public-safety.sh' -not -name 'export-public.sh' 2>/dev/null || true)

echo "== Public Safety Check: $(pwd) =="

while IFS= read -r line; do
  [ -z "$line" ] && continue
  label="${line%%|||*}"
  regex="${line##*|||}"
  hits=$(printf '%s\n' $FILES | xargs grep -nEl "$regex" 2>/dev/null || true)
  if [ -n "$hits" ]; then
    echo "${RED}[FAIL] ${label}${NC}"
    printf '%s\n' $FILES | xargs grep -nE "$regex" 2>/dev/null | head -6 | sed 's/^/    /'
    FAILS=$((FAILS+1))
  fi
done <<EOF
$FORBIDDEN_PATTERNS
EOF

# Segunda passada: nome de pessoa e marca de terceiro, varrendo tambem .html, .js e .svg.
# Estes formatos ficam fora de FILES porque a landing page carrega precos (R$), o que
# dispararia um falso positivo na regra de preco. Aqui so os padroes de identidade rodam.
ID_FILES=$(find . -type f \( -name '*.md' -o -name '*.yaml' -o -name '*.yml' -o -name '*.json' \
  -o -name '*.sh' -o -name '*.html' -o -name '*.js' -o -name '*.svg' -o -name 'AUTHORS' \) \
  -not -path './.git/*' -not -path './node_modules/*' -not -path './.claude/agent-memory/*' -not -name 'check-public-safety.sh' \
  -not -name 'export-public.sh' 2>/dev/null || true)

while IFS= read -r line; do
  [ -z "$line" ] && continue
  label="${line%%|||*}"
  regex="${line##*|||}"
  hits=$(printf '%s\n' $ID_FILES | xargs grep -nEl "$regex" 2>/dev/null || true)
  if [ -n "$hits" ]; then
    echo "${RED}[FAIL] ${label}${NC}"
    printf '%s\n' $ID_FILES | xargs grep -nE "$regex" 2>/dev/null | head -6 | sed 's/^/    /'
    FAILS=$((FAILS+1))
  fi
done <<EOF
$IDENTITY_PATTERNS
EOF

if [ "$ACCENT" -eq 1 ]; then
  aw=$(printf '%s\n' $FILES | xargs grep -nE '\b(nao|acao|conversao|estrategia|analise|metrica|gestao|voce|tres|traves)\b' 2>/dev/null | grep -v '\.sh:' || true)
  if [ -n "$aw" ]; then
    echo "${YEL}[WARN] Acentuacao (heuristica)${NC}"
    printf '%s\n' "$aw" | head -6 | sed 's/^/    /'
  fi
fi

if [ "$FAILS" -gt 0 ]; then
  echo "${RED}== ${FAILS} categoria(s) de violacao. Repositorio NAO esta seguro para publicacao. ==${NC}"
  exit 1
fi
echo "${GRN}== Public safety: limpo. Nenhum padrao proibido encontrado. ==${NC}"
exit 0
