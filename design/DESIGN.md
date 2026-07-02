# DESIGN.md: Design System da Fábrica de Receita (v3.0.0)

> Documento mestre e autocontido do design system do squad `fabrica-de-receita-v4`,
> baseado na identidade V4 Company 2026. Autoridade: baziotti (brand chief).
> Fonte da verdade dos tokens: `design/tokens/tokens.json` (espelho YAML: `config/tokens.yaml`).
> Aplicação prática: `config/brandbook.md`. Responsividade: `design/RESPONSIVE-PROPORTIONALITY.md`.
> Motion: `design/motion/MOTION-SYSTEM.md`. Preview: `design/preview.html`.

## 1. Princípios inegociáveis

| Regra | Resumo |
|---|---|
| ZERO_AZUL | Proibição absoluta de azul. A paleta é vermelha com neutros; CTA é verde |
| NUNCA_INVENTAR_LOGO | Usar somente os assets de `design/logos/`; jamais recriar logo em texto, IA ou traçado |
| TIPOGRAFIA_OFICIAL | Morganite + Fjalla One (display) e IBM Plex Sans (body); máximo 2 fontes por peça |
| WCAG_AA | Contraste mínimo 4.5:1 (body) e 3:1 (large text), validado antes de publicar |
| GRID_PROPORTIONALITY | Grids nunca deixam órfãos; 4 estratégias de balanceamento (squad.yaml) |
| RESPONSIVE_PROPORTIONALITY | Respiros fluidos com clamp(); 5 níveis com razão ~2; gutter único |

## 2. Paleta

### 2.1 Marca (rampa vermelha 2026)

| Token | Hex | Uso |
|---|---|---|
| brand.red-v4 | `#E50914` | Primária: logo, destaques, links, filete de assinatura |
| brand.flame | `#FB2E0A` | Stop final de gradientes, glow quente |
| brand.red | `#C41E08` | Stop intermediário de gradientes |
| brand.red-mid | `#8B1205` | Stop do gradiente subtle |
| brand.red-deep | `#7A0A02` | Stop inicial de gradientes |
| brand.maroon | `#560303` | Base escura de gradientes e fundos premium |
| brand.dark-red | `#280000` | Fundo radial e base de gradiente |

Gradiente primário: `135deg, #560303 para #7A0A02 para #FB2E0A`.

### 2.2 Neutros

| Token | Hex | Uso |
|---|---|---|
| neutral.black | `#050505` | Fundo dark e texto sobre claro |
| neutral.white | `#FFFFFF` | Fundo claro e texto sobre dark |
| neutral.light-gray | `#F2F2F2` | Superfícies claras secundárias |
| neutral.gray | `#606060` | Texto secundário |
| neutral.dark-gray | `#1E2124` | Superfícies dark secundárias |

### 2.3 CTA e acentos

| Token | Hex | Uso |
|---|---|---|
| cta.green | `#00A86B` | Cor EXCLUSIVA de CTA (texto normal usa o alt `#0E8420`) |
| cta.hover-orange | `#FF6200` | Hover de CTA |
| accent.yellow | `#FDFF87` | Realce pontual |
| accent_dr | `#FF003F` | Accent exclusivo da linha Destrava Receita (deck oficial) |

### 2.4 Código de cores das 8 Travas (rampa quente, zero azul)

T1 é o neutro máximo (cegueira: sem dados, sem cor). De T8 para T2 a rampa esquenta do âmbar ao
vermelho: quanto mais perto da receita, mais vermelha a trava.

| Trava | Hex | Racional |
|---|---|---|
| T1 Cegueira | `#050505` | Neutro máximo: sem dados não há diagnóstico |
| T2 Retenção | `#C41E08` | Vermelho profundo: máxima proximidade da receita |
| T3 Decisão | `#E50914` | Vermelho V4 pleno |
| T4 Compromisso | `#FB2E0A` | Vermelho alaranjado |
| T5 Qualificação | `#FF4820` | Laranja avermelhado |
| T6 Interesse | `#FF6200` | Laranja |
| T7 Atenção | `#F97316` | Laranja âmbar |
| T8 Exposição | `#F59E0B` | Âmbar pleno: topo do funil |

## 3. Tipografia

Fontes self-hosted pelo usuário (woff2 próprios). Nunca embutir fontes licenciadas de terceiros
no repositório.

| Papel | Família | Pesos | Uso |
|---|---|---|---|
| Display | Morganite | 500/600/700 | Impacto e headlines condensadas, uso pontual |
| Display alternativa | Fjalla One | 400 | Display quando Morganite não couber |
| Body/UI | IBM Plex Sans | 400/500/600 | Heading, corpo e interface |

Escala fluida (clamp, ancorada em razão modular):

| Nível | Valor |
|---|---|
| h1 | `clamp(2.7rem, 2.7rem + ((1vw - 0.363rem) * 5.359), 115px)` |
| h2 | `clamp(2.188rem, 2.188rem + ((1vw - 0.363rem) * 4.104), 90px)` |
| h3 | `clamp(1.75rem, 1.75rem + ((1vw - 0.363rem) * 2.687), 64px)` |
| small | `12px` (fixo) |

Regras: números em copy são dígitos ("4 gatilhos"); zero travessão em texto renderizável;
headlines sem `<br/>`; texto preenche antes de quebrar; favicon obrigatório em toda peça web.

## 4. Espaçamento fluido (5 níveis, razão ~2)

| Nível | Token | Valor |
|---|---|---|
| Entre seções macro | spacing.fluid.section | `clamp(56px, 10vw, 140px)` |
| Interno de blocos/cards | spacing.fluid.block | `clamp(28px, 5vw, 56px)` |
| Entre grupos | spacing.fluid.group | `clamp(20px, 3.5vw, 40px)` |
| Entre elementos | spacing.fluid.element | `clamp(12px, 2vw, 24px)` |
| Gap pequeno | spacing.fluid.tight | `clamp(8px, 1.2vw, 14px)` |
| Gutter lateral único | spacing.fluid.gutter | `clamp(14px, 4vw, 32px)` |

Máximos canônicos: shell `1320px` · wide `1440px` · prose `60ch` · title `14ch` · label `36ch`.
Travas anti-overflow: `min-width: 0` em filhos de grid, `aspect-ratio` declarado em imagens,
`box-sizing: border-box` global. Detalhe completo: `design/RESPONSIVE-PROPORTIONALITY.md`.

## 5. Raio e superfícies

| Token | Valor | Uso |
|---|---|---|
| radius.sm / md / lg | `10px` / `15px` / `25px` | Elementos e cards legados |
| radius.card | `36px` | Card dominante |
| radius.card-glass | `22px` | Glass card da linha DR |
| radius.pill | `9999px` | Botões pill e chips |

## 6. Motion (resumo)

Framework: Remotion. Durações: entrada 400-600ms, ênfase 200-300ms, saída 200-400ms. Ease-out
para entrada, ease-in para saída. `prefers-reduced-motion` respeitado com versão estática
equivalente. 60fps mobile-first. Detalhe: `design/motion/MOTION-SYSTEM.md`.

## 7. Assets

Logos oficiais em `design/logos/` (ícones V4 nas variantes vermelho, branco e preto). A regra
NUNCA_INVENTAR_LOGO se aplica integralmente: se o asset necessário não existir, a produção para
e o brand chief é acionado; em instalações de terceiros, os assets de logo são fornecidos pelo
usuário final. Regras de nomenclatura e proporção: `design/references/REBRANDING-RULES.md`.
