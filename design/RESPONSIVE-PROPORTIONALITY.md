# Responsive Proportionality: Regra Canônica do Squad

> Severidade: **NON_NEGOTIABLE**
> Owner: brand-chief baziotti
> Versão: 3.0 (evoluída de v2.0; v3.0 adiciona regramento de preenchimento de tela e anti-overflow após incidente ARK TAX 2026-05-15)
> Aplicável a: brandbooks HTML, LPs, dashboards, decks digitais, previews de design system, qualquer interface responsiva produzida pelo squad
> Companheira de: `GRID_PROPORTIONALITY` (que cobre balanceamento de colunas em coleções)
> Galeria canônica de referência visual: `design/references/responsive-examples/`

---

## 1. Princípio fundador

Em qualquer peça responsiva produzida pelo squad, **respiros e proporções escalam continuamente com a viewport, não em saltos**. Tudo que separa elementos (padding, gap, margin) é fluido. Tudo que dimensiona texto é fluido. Tudo que estrutura grid respeita uma escala canônica.

A peça final precisa parecer projetada para qualquer largura, do iPhone SE ao monitor 4K, sem que cards, cartelas, headers ou colunas pareçam comprimidos, esticados ou desproporcionais.

---

## 2. Os 7 princípios obrigatórios

### 2.1. Respiros fluidos com `clamp()`

Todo padding, gap ou margin de container responsivo usa a sintaxe:

```css
clamp(<mínimo>, <preferido em vw|cqi>, <máximo>)
```

- O **preferido** é em `vw` (viewport-width) ou `cqi` (container-query inline-size).
- O **mínimo** garante respiro mínimo no menor mobile (≥320px).
- O **máximo** evita respiro excessivo em monitores grandes.

**Saltos discretos via `@media` só são permitidos para:**
- Trocar contagem de colunas em grid (ex: 3 → 2 → 1).
- Reordenar layout em mudança topológica (ex: sidebar vira top-nav).
- Garantir mínimo absoluto que `clamp()` não consegue dar.

**Proibido:** definir 4 ou mais breakpoints só para diminuir padding gradualmente. Use `clamp()` e elimine os breakpoints redundantes.

### 2.2. Hierarquia de 5 níveis de respiro

Toda peça reconhece e respeita 5 níveis, em **razão fixa ≈ 2** entre níveis adjacentes:

| Nível | Token | Default fluid | Quando usar |
|---|---|---|---|
| **section** | `--space-section` | `clamp(56px, 10vw, 140px)` | Vertical entre seções macro da página |
| **block** | `--space-block` | `clamp(28px, 5vw, 56px)` | Interno de cards grandes / blocos de seção |
| **group** | `--space-group` | `clamp(20px, 3.5vw, 40px)` | Entre grupos dentro de uma seção |
| **element** | `--space-element` | `clamp(12px, 2vw, 24px)` | Entre elementos do mesmo grupo |
| **tight** | `--space-tight` | `clamp(8px, 1.2vw, 14px)` | Gap entre rótulo e valor, ícone e texto |

**Razão verificável:** dividir o `max` de cada nível pelo `max` do nível seguinte. O resultado deve ficar entre 1.5 e 2.5.

```
section/block = 140/56 = 2.50  ✓
block/group   =  56/40 = 1.40  ✓ (limite inferior, OK)
group/element =  40/24 = 1.67  ✓
element/tight =  24/14 = 1.71  ✓
```

Não invente valores fora dessa escala. Use os tokens.

### 2.3. Gutter lateral único

Toda seção fullbleed da peça compartilha o **mesmo gutter lateral** via `--gutter`:

```css
:root { --gutter: clamp(14px, 4vw, 32px); }
section { padding-inline: var(--gutter); }
```

Proibido cada seção redefinir seu padding horizontal arbitrário. Se um bloco precisa de mais respiro lateral por motivo semântico (ex: hero), use `calc(var(--gutter) * 1.5)`, nunca um valor cru.

### 2.4. Container query > Media query (quando aplicável)

Componentes que **repetem em múltiplos contextos** (cards de produto que aparecem em grid-3 e grid-1, painéis que aparecem em sidebar e em main) reagem ao próprio container:

```css
.card { container-type: inline-size; }
@container (min-width: 480px) { .card-body { padding: var(--space-block); } }
```

Use media query apenas para mudanças topológicas (layout macro). Use container query para mudanças do próprio componente.

### 2.5. Escala tipográfica fluida

Toda hierarquia de heading usa `clamp()`, ancorada em uma **razão modular**:

| Razão | Nome clássico | Quando usar |
|---|---|---|
| 1.125 | Major Second | Dashboards densos, UI utilitária |
| 1.200 | Minor Third | Apps SaaS, interfaces de produto |
| 1.250 | Major Third | LPs comerciais, blogs, geral |
| 1.333 | Perfect Fourth | LPs editoriais, brandbooks |
| 1.414 | Augmented Fourth | LPs editoriais com forte hierarquia |

Body e UI text vêm do scale tipográfico do squad (`tokens.yaml > typography`). Não inventar tamanhos fora do scale.

```css
:root {
  --fs-h1: clamp(36px, 5.5vw, 84px);
  --fs-h2: clamp(28px, 3.6vw, 48px);
  --fs-h3: clamp(22px, 2.4vw, 32px);
  --fs-body: clamp(15px, 1.2vw, 17px);
  --fs-eyebrow: clamp(10px, 0.9vw, 12px);
}
```

### 2.7. Anti-órfãs tipográficas (NON_NEGOTIABLE)

PROIBIDO entregar headline ou parágrafo onde a última linha contém uma única palavra solta (órfã) ou um par muito curto (viúva). Quatro mecanismos obrigatórios:

| Mecanismo | Onde aplicar | Sintaxe |
|---|---|---|
| `text-wrap: balance` | Em **toda** `h1`, `h2`, `h3`, `.headline`, `.section-title`, `.cta-headline` | `h1, h2, h3 { text-wrap: balance; }` |
| `text-wrap: pretty` | Em **toda** prose (`p`, `.lede`, `.body`) | `p { text-wrap: pretty; }` |
| `&nbsp;` (non-breaking space) | Entre as **duas últimas palavras** de hooks/headlines onde a quebra final é crítica | `<h1>... antes da janela&nbsp;abrir.</h1>` |
| `max-width` em `ch` revisado | Headlines: 18 a 24ch (não 12-14ch que produz quebras agressivas). Prose: 50-65ch | `.headline { max-width: 22ch; }` |

**Anti-padrão clássico:** texto centralizado com `max-width` muito pequeno (ex: 28ch) em headline grande, gerando 1 palavra por linha. Isso é proibido. O resultado fica vertical e ilegível.

**Regra prática:** para texto centralizado tipo manifesto, use `max-width` proporcional ao tamanho do bloco. Manifesto curto (≤20 palavras): 32-44ch. Manifesto médio (20-50 palavras): 44-56ch. Nunca abaixo de 28ch para frase com palavra longa em pt-BR.

### 2.6. Travas anti-overflow

Quatro travas obrigatórias em qualquer grid:

| Trava | Onde | Por quê |
|---|---|---|
| `min-width: 0` | em **todo filho de grid** | Impede o conteúdo de empurrar a célula e quebrar o grid |
| `max-width: <N>ch` | em **toda coluna de prose** | 50-75ch para body, 12-18ch para titles |
| `aspect-ratio: X/Y` | em **toda imagem em grid** | Reserva espaço, evita layout shift |
| `box-sizing: border-box` | global | Garante que padding não sangra |

---

## 3. Tokens canônicos (referência)

A seção `spacing.fluid` em `config/tokens.yaml` é a fonte da verdade. Bloco a copiar para qualquer peça nova:

```css
:root {
  /* Respiros fluidos: razão ≈ 2 entre níveis */
  --space-section: clamp(56px, 10vw, 140px);
  --space-block:   clamp(28px, 5vw, 56px);
  --space-group:   clamp(20px, 3.5vw, 40px);
  --space-element: clamp(12px, 2vw, 24px);
  --space-tight:   clamp(8px, 1.2vw, 14px);

  /* Gutter lateral único */
  --gutter: clamp(14px, 4vw, 32px);

  /* Gaps de grid (atalhos sobre os respiros acima) */
  --gap-grid:        var(--space-element);          /* default */
  --gap-grid-loose:  var(--space-group);            /* generoso */
  --gap-grid-tight:  var(--space-tight);            /* compacto */

  /* Travas tipográficas */
  --max-w-shell: 1320px;
  --max-w-prose: 60ch;
  --max-w-title: 14ch;

  /* Escala tipográfica fluida (ratio 1.25 default) */
  --fs-h1: clamp(36px, 5.5vw, 84px);
  --fs-h2: clamp(28px, 3.6vw, 48px);
  --fs-h3: clamp(22px, 2.4vw, 32px);
  --fs-h4: clamp(18px, 1.8vw, 22px);
  --fs-body: clamp(15px, 1.2vw, 17px);
  --fs-small: clamp(13px, 1vw, 14px);
  --fs-eyebrow: clamp(10px, 0.9vw, 12px);
}
```

---

## 4. Anti-padrões (REJEITADOS pelo brand-chief)

```css
/* ❌ Padding fixo + 4 breakpoints discretos */
section { padding: 140px 32px; }
@media (max-width: 1024px) { section { padding: 100px 28px; } }
@media (max-width: 768px)  { section { padding: 80px 22px; } }
@media (max-width: 600px)  { section { padding: 64px 18px; } }
@media (max-width: 420px)  { section { padding: 52px 14px; } }

/* ❌ Gap fixo grande que não escala */
.master-grid { gap: 80px; }

/* ❌ Cada seção definindo seu próprio padding lateral */
.hero        { padding: 140px 32px; }
.onliness    { padding: 140px 32px; }
.principles  { padding: 140px 32px; }

/* ❌ Valores inventados fora do scale */
.card { padding: 17px 23px; gap: 11px; }

/* ❌ auto-fit/auto-fill em coleção fechada sem trava */
.cards { grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); }
```

E os equivalentes corretos:

```css
/* ✅ Padding fluido com clamp */
section { padding: var(--space-section) var(--gutter); }

/* ✅ Gap fluido com escala */
.master-grid { gap: var(--space-block); }

/* ✅ Gutter lateral único */
section { padding-inline: var(--gutter); }
.hero { padding-block: calc(var(--space-section) * 1.2); }

/* ✅ Scale */
.card { padding: var(--space-element) var(--space-group); gap: var(--space-tight); }

/* ✅ Coleção fechada com trava */
.cards { grid-template-columns: repeat(3, minmax(0, 1fr)); gap: var(--gap-grid); }
@media (max-width: 720px) { .cards { grid-template-columns: 1fr; } }
```

---

## 5. Checklist de validação Baziotti pré-publicação

Antes de qualquer interface responsiva sair do squad:

**Tokens e estrutura**
- [ ] Existe um bloco `:root` com tokens fluid (5 níveis de respiro + gutter + scale tipográfica)
- [ ] Toda `section`/`.section` usa `var(--space-section)` e `var(--gutter)`, nunca valores crus
- [ ] Não há `@media` que apenas reduz padding em saltos discretos (substituir por `clamp`)
- [ ] Razão entre níveis de respiro é ≈2 (verificável dividindo `max` de cada nível)

**Tipografia e prose**
- [ ] Escala tipográfica de heading usa `clamp()` ancorada em razão modular
- [ ] Toda coluna de prose tem `max-width: <N>ch`
- [ ] Headlines respeitam a tabela de ratio font-size × max-width-ch da seção 8.5
- [ ] **Nenhuma headline contém `<br />` manual** (apenas `text-wrap: balance` + `max-width` em ch resolvem a quebra)
- [ ] Headlines em desktop ≥1280px não produzem palavras órfãs verticais (1-2 palavras por linha)

**Grid e overflow**
- [ ] Todo filho de grid tem `min-width: 0`
- [ ] Toda imagem em grid tem `aspect-ratio` declarado
- [ ] Componentes que se repetem em múltiplos contextos usam `@container`
- [ ] Coleções fechadas (cards de produto, swatches) não usam `auto-fit`/`auto-fill` sem trava
- [ ] `html, body { overflow-x: clip }` configurado globalmente
- [ ] Elementos `position: absolute` que ficam à direita usam `right: var(--gutter)` ou equivalente, nunca `right: 0`

**Densidade e preenchimento (seção 8)**
- [ ] Hero em desktop não ocupa mais de 100vh com apenas 1-3 palavras visíveis
- [ ] Coluna principal de hero 2-col preenche pelo menos 70% da sua altura disponível com conteúdo
- [ ] Stats grid 4× em desktop colapsa para 2×2 em tablet e 2×2 ou 1× em mobile (nunca deixa coluna órfã)
- [ ] Comparação visual feita contra `design/references/responsive-examples/desktop-correto.png` e `mobile-correto.png`

**Validação multi-viewport obrigatória**
- [ ] A peça preview foi testada em 375px, 480px, 768px, 1024px, 1440px e 1920px sem quebra
- [ ] Screenshot DevTools 375×667 mostra zero overflow horizontal (nada cortado pela direita)
- [ ] Screenshot desktop 1440px mostra densidade horizontal mínima de 70% nas colunas principais

---

## 6. Como aplicar a peças existentes (refatoração)

1. **Identificar valores crus.** `grep -E "padding: [0-9]+px [0-9]+px"` e `grep "gap: [0-9]+px"`.
2. **Adicionar tokens fluid** ao `:root` (copiar bloco da seção 3).
3. **Substituir paddings de section** por `var(--space-section) var(--gutter)`.
4. **Substituir gaps significativos** pelos tokens da hierarquia (5 níveis).
5. **Eliminar breakpoints redundantes** que apenas reduzem padding linearmente; `clamp()` já faz isso.
6. **Adicionar travas anti-overflow** em todos os grids.
7. **Validar** rodando o checklist da seção 5.

---

## 8. Preenchimento de Tela & Anti-overflow (NON_NEGOTIABLE)

> Seção adicionada em 2026-05-15 após incidente ARK TAX (proposta CRM com hero violando densidade horizontal em desktop e overflow lateral em mobile).
>
> Princípio fundador desta seção: **layout responsivo correto não tem buracos visuais verticais, não força quebras tipográficas manuais, e nunca permite overflow horizontal em nenhuma viewport.** A regra de preenchimento é tão inegociável quanto o respiro fluido das seções anteriores.

### 8.1 Proibição absoluta de `<br />` em headlines de display, h1 e h2

Headlines grandes NUNCA contém `<br />` manual. A quebra de linha é responsabilidade exclusiva de:

| Mecanismo | Onde aplicar |
|---|---|
| `text-wrap: balance` | Em toda `h1`, `h2`, `h3`, `.headline`, `.section-title` |
| `max-width` em `ch` (seção 8.5) | Calibrado para o `font-size` máximo da viewport |
| `&nbsp;` (non-breaking space) | Entre palavras que NUNCA devem ser separadas (par ênfase + acento, "ARK TAX", "V4 Company", "30 dias") |
| `<span class="line">` block | Pattern canônico para sentenças semanticamente distintas (ver 8.1.1) |

**Por que `<br />` é proibido:** `<br />` é breakpoint estático. Quando a viewport muda, ele quebra no lugar errado e produz órfãs verticais (1-2 palavras por linha). É o anti-padrão clássico documentado na seção 2.7 que continua sendo violado por reflexo. Esta proibição é defesa em profundidade.

#### 8.1.1 Pattern canônico para headline com sentenças distintas

Quando uma headline contém DUAS ou mais sentenças semanticamente distintas que precisam quebrar entre si (ex: "CRM não é ferramenta. É governança.") **sem** virar uma frase contínua de linhas balanceadas aleatoriamente, use o pattern de `<span class="line">` block com flexbox column.

**Sintomas que indicam que você precisa deste pattern:**

- Headline tem 2+ frases separadas por ponto final
- Uma das frases é o "soco" (geralmente italic/destaque) e quer ficar na sua própria linha
- `text-wrap: balance` está produzindo viúvas tipográficas (palavra de 1-3 letras solta no fim de uma linha que tem outra sentença começando)
- Você está tentado a usar `<br />` (NÃO USE, viola 8.1)

**Pattern HTML:**

```html
<h2 class="headline-multi">
  <span class="line">CRM não é&nbsp;ferramenta.</span>
  <span class="line accent">É&nbsp;governança.</span>
</h2>
```

**Pattern CSS:**

```css
.headline-multi {
  display: flex;
  flex-direction: column;
  gap: clamp(4px, 0.6vw, 10px);
  max-width: 22ch;             /* calibrado pela tabela 8.5 */
}
.headline-multi .line {
  display: block;
  text-wrap: balance;
}
.headline-multi .line.accent {
  font-family: 'Times New Roman', Georgia, serif;
  font-style: italic;
  font-weight: 400;
  color: #F2A89F;
}
```

**Regras complementares deste pattern:**

- Cada `<span class="line">` representa **uma sentença completa e semanticamente distinta**. Não usar para quebrar frase única.
- Cada `.line` tem seu próprio `text-wrap: balance` (controla a quebra **interna** de cada sentença).
- Sentenças críticas (ênfase de marca) recebem `&nbsp;` entre as duas últimas palavras para evitar viúva interna (ex: "É&nbsp;governança").
- O `gap` do flexbox controla o espaço entre as duas sentenças; mantém proporcional à viewport via `clamp()`.
- Quando há acento de marca (italic, cor diferente), aplicar via classe modificadora `.accent`, não via `<em>` inline.

**Quando NÃO usar este pattern:**

- Headline de uma só frase (use `text-wrap: balance` + `max-width` em ch direto no `<h2>`)
- 3+ sentenças (significa que a headline está mal escrita, reduzir para 2)
- Body text ou prose (esses usam `text-wrap: pretty`, não precisam deste pattern)

### 8.2 Hero proporcional à viewport (regra 60% / 70%)

Em desktop (≥1024px), a hero respeita dois ratios obrigatórios:

| Ratio | Métrica | Limite |
|---|---|---|
| Altura da headline / altura da viewport | `<h1>` ocupa | máximo 60% de `100vh` |
| Conteúdo / altura disponível por coluna | Cada coluna preenche | mínimo 70% verticalmente |

**Sintoma de violação:** headline com 8+ linhas verticais e 1-2 palavras por linha, deixando coluna lateral com muito espaço vazio. Sintoma idêntico ao registrado em `design/references/responsive-examples/desktop-errado.png`.

**Correção possível** quando viola: (a) reduzir `font-size` máximo da headline em 20-30%, (b) reduzir contagem de palavras da headline (12 palavras é o teto saudável), ou (c) trocar para layout em 1 coluna se a hero for puramente declarativa.

### 8.3 Garantia anti-overflow horizontal (NON_NEGOTIABLE absoluta)

Toda página DEVE conter no `:root` ou no reset:

```css
html, body {
  overflow-x: clip;          /* clip > hidden, mantém position:sticky funcionando */
}
* {
  box-sizing: border-box;
}
[class*="grid"] > * {
  min-width: 0;              /* defesa contra explosão de filhos em flex e grid */
}
```

E TODA seção fullbleed verifica antes de publicar:

- O `padding-inline` da `<section>` usa `var(--gutter)`, nunca valor cru
- Elementos `position: absolute` ou `position: fixed` à direita usam `right: var(--gutter)`, nunca `right: 0`
- Botões, badges e CTAs do nav respeitam o gutter lateral
- Texto longo com tokens longos (URLs, códigos, hashes) recebe `overflow-wrap: anywhere` ou `word-break: break-word`
- Imagens declaram `max-width: 100%; height: auto`
- Tabelas dentro de seções recebem `display: block; overflow-x: auto` quando podem estourar (rare-case mobile)

**Validação obrigatória:** abrir DevTools mobile 375×667 e rolar até o final da página. Em nenhum ponto deve aparecer barra de scroll horizontal, conteúdo cortado pela direita, ou CTA escapando do viewport. Sintoma idêntico ao registrado em `design/references/responsive-examples/mobile-errado.png`.

### 8.4 Densidade horizontal mínima

Layout responsivo correto preenche o viewport horizontalmente com conteúdo significativo. Buracos verticais grandes (mais de 1.5× a altura do header) são proibidos em qualquer viewport.

**Desktop ≥1280px:**

- Hero com layout 2-col: ratio entre 60/40 e 50/50. Coluna principal nunca abaixo de 45% da largura do container.
- Cada coluna preenche pelo menos 70% da sua altura disponível com conteúdo (não espaço em branco).
- Stats grids 4-col preenchem toda a largura do shell, sem coluna órfã ou desbalanceada.

**Tablet 768-1023px:**

- Stats 4-col viram 2×2 (nunca 4×1 vertical que gera scroll desnecessário).
- Hero 2-col vira 1-col com headline ocupando até 80% da largura do shell.

**Mobile <540px:**

- Conteúdo da hero preenche viewport horizontal completo, respeitando apenas o gutter lateral.
- Stats grids 4-col viram 2×2 (preferido) ou 1×4 vertical (apenas se cada card contiver muito texto).
- Headlines respeitam ch correto para a viewport (ver tabela 8.5), sem palavra órfã isolada em linha própria.

### 8.5 Tabela canônica de ratio font-size × max-width-ch

`max-width` em `ch` para headlines DEVE ser calibrado em função do `font-size` máximo na viewport. Headline com font-size grande em max-width estreito é o anti-padrão #1 desta seção.

| Font-size máximo (clamp `max`) | Max-width recomendado | Tolerância em palavras |
|---|---|---|
| 36-48px | 22-28ch | Até 12 palavras |
| 48-72px | 18-22ch | Até 10 palavras |
| 72-96px | 14-18ch | Até 7 palavras |
| 96-112px | 12-16ch | Até 5 palavras |
| ≥112px | 10-14ch | Até 4 palavras (apenas headlines manifesto) |

**Regra de bolso:** se a headline tem mais palavras que a tolerância acima, ou (a) reduza o `font-size` máximo, ou (b) reescreva a headline para ser mais curta. Nunca aceite quebra vertical agressiva.

**Proibido absoluto:** headline com `font-size` máximo de 112px + `max-width: 18ch` + mais de 5 palavras. Resultado matemático é texto vertical com 1-2 palavras por linha. Foi exatamente o caso registrado em `desktop-errado.png`.

### 8.6 Anti-padrões de viewport (REJEITADOS pelo brand-chief)

```html
<!-- ❌ Headline grande com <br/> manual forçando quebras -->
<h1 style="font-size: clamp(44px, 8vw, 112px); max-width: 18ch;">
  Reconstruímos o<br/>
  comercial da<br/>
  ARK TAX<br/>
  <em>como uma fábrica.</em>
</h1>

<!-- ❌ Botão posicionado absoluto sem gutter -->
<a class="cta" style="position: absolute; right: 0;">CTA</a>

<!-- ❌ Section sem overflow-x:clip global e sem min-width:0 em filhos -->
<style>
  body { /* sem overflow-x: clip */ }
  .grid > * { /* sem min-width: 0 */ }
</style>
```

```html
<!-- ✅ Headline com balance + ch adequado, sem <br/> -->
<h1 style="
  font-size: clamp(40px, 6vw, 84px);
  max-width: 18ch;
  text-wrap: balance;
">
  Reconstruímos o comercial da ARK&nbsp;TAX como uma&nbsp;fábrica
</h1>

<!-- ✅ Botão respeitando gutter -->
<a class="cta" style="position: absolute; right: var(--gutter);">CTA</a>

<!-- ✅ Reset global e defesa em filhos de grid -->
<style>
  html, body { overflow-x: clip; }
  * { box-sizing: border-box; }
  [class*="grid"] > * { min-width: 0; }
</style>
```

### 8.7 Galeria canônica de referência visual

Antes de publicar qualquer hero, seção crítica ou painel, comparar visualmente contra as evidências canônicas em `design/references/responsive-examples/`:

| Arquivo | Status | O que ensina |
|---|---|---|
| `desktop-correto.png` | ✅ Modelo | Painel V4 em desktop. Logo centralizado, eyebrow centralizado, headline em duas linhas com `text-wrap: balance`, subtexto preenchendo largura, stats grid 4×1 preenchendo 100% do shell, sem buracos verticais. |
| `desktop-errado.png` | ❌ Anti-padrão | Hero ARK TAX violando 8.1, 8.2 e 8.5 simultaneamente. `<br/>` forçando 5 quebras manuais. Cada palavra grande (Reconstruímos / o / comercial / da / ARK TAX) em sua linha. Hero ocupa 100vh com baixa densidade de informação. Card lateral "Tese da operação" também com headline quebrada palavra por palavra. |
| `mobile-correto.png` | ✅ Modelo | Painel V4 em mobile. Logo + eyebrow + título centralizados. Subtexto preenchendo largura total respeitando gutter. Stats em grid 2×2 balanceado. Zero overflow horizontal. Hierarquia clara. |
| `mobile-errado.png` | ❌ Anti-padrão | Hero ARK TAX em mobile violando 8.3 e 8.4. Subtexto cortado pela direita ("no Mos…", "o t…", "omnichannel"). CTA "Aprovar próximo" cortado. Conteúdo sangra para fora do viewport. Causa raiz: ausência de `overflow-x: clip` global e elementos posicionados sem `right: var(--gutter)`. |

**Regra operacional:** abrir os 4 arquivos lado a lado antes de aprovar qualquer hero novo. Se a peça em produção parece com `*-errado.png`, refatorar imediatamente.

### 8.9 Preenchimento antes da quebra · Container-aware typography (NON_NEGOTIABLE)

> Adicionada em 2026-05-15 após terceiro incidente ARK TAX (operador apontou: "SEMPRE QUE TIVER ESPAÇO SUFICIENTE NO PAINEL, A HEADLINE, SUB-HEADLINE E OS TEXTOS NÃO PODEM QUEBRAR"). Esta regra **sobrepõe** a tabela 8.5 quando houver conflito.

**Princípio:** Texto preenche o espaço horizontal disponível do container ANTES de quebrar para a linha de baixo. Headlines, sub-headlines e prose se ajustam ao tamanho do painel onde vivem, escalando o font-size proporcionalmente.

**Anti-padrão raiz que esta regra resolve:** definir `max-width` em `ch` tão restritivo que força quebra mesmo quando há espaço sobrando no container pai. Resultado visual: headline em 3 linhas curtas quando caberia em 2 longas, ou em 2 linhas quando caberia em 1.

#### 8.9.1 Hierarquia de decisão para `max-width` em headlines

Quando aplicar qual mecanismo:

| Contexto | `max-width` recomendado | Por quê |
|---|---|---|
| Headline dentro de **card/painel de largura conhecida** (`.hero-aside`, `.pipe-card`, `.phase-card`, etc.) | `100%` ou `none` | Container já limita pela própria largura. Trava em ch força quebra desnecessária. |
| Headline dentro de **coluna de grid em layout 2-col** | `100%` ou ajustar pela coluna real | Mesmo princípio. O grid já garante o ratio horizontal. |
| Headline dentro de **section fullbleed sem container limitante** | aplicar tabela 8.5 (`max-width: <N>ch`) | Aqui não há container que limite, então a trava em ch evita linha gigante em monitor 4K. |
| Prose body (`p`, `.lede`) | `60ch` máximo (legibilidade) | Trava em ch existe para legibilidade, não para forçar quebra estética. |

#### 8.9.2 Container queries + unidades `cqi` (pattern preferido)

Componentes que abrigam headlines DEVEM usar container queries quando vivem em múltiplos contextos (sidebar + main, mobile + desktop). O font-size escala com o container, não com o viewport:

```css
/* Habilita o container como referência */
.hero-aside,
.pipe-card,
.phase-card,
.locks-panel {
  container-type: inline-size;
}

/* Font-size proporcional ao container */
.hero-aside-title {
  font-size: clamp(28px, 9cqi, 56px);   /* 9% do inline-size do container */
  width: 100%;
}
```

Onde:
- `cqi` = container query inline-size: 1cqi = 1% da largura inline do container.
- Usar `cqi` em containers de largura conhecida; usar `vw` apenas para hero fullbleed da página.

#### 8.9.3 Ratio de preenchimento mínimo

Quando uma headline está numa única linha (não quebra), ela deve **preencher pelo menos 65% da largura disponível do container** para não parecer apertada num canto. Se preenche menos que isso, o font-size está pequeno demais e deve subir.

| Container | Preenchimento mínimo | Ação se abaixo |
|---|---|---|
| Card (`.pipe-card`, `.phase-card`) | 65% | Subir `font-size` máximo |
| Painel lateral (`.hero-aside`, `.locks-panel`) | 70% | Subir `font-size` máximo |
| Hero coluna principal | 75% | Subir `font-size` máximo ou aumentar headline |
| Section fullbleed | 60% | OK (margens laterais grandes são desejadas) |

#### 8.9.4 Exemplo concreto · refatoração do hero-aside ARK TAX

**Antes (errado):**

```css
.hero-aside { /* sem container-type */ }
.hero-aside-title {
  font-size: clamp(32px, 3.8vw, 52px);  /* baseado em viewport, não no container */
  max-width: 14ch;                       /* força quebra mesmo com painel largo */
}
```

Resultado: em desktop 1440px com painel de 580px de largura, headline ficava em 3 linhas curtas com viúva "É" no meio.

**Depois (correto):**

```css
.hero-aside {
  container-type: inline-size;          /* o painel vira referência */
}
.hero-aside-title {
  font-size: clamp(32px, 11cqi, 60px);  /* escala com o painel */
  width: 100%;                          /* preenche o painel */
}
```

Resultado: em desktop 1440px com painel de 580px, `11cqi = 63.8px` → cap em 60px → "CRM NÃO É FERRAMENTA." cabe em uma linha. Em mobile com painel de 320px, `11cqi = 35.2px` → "CRM NÃO É FERRAMENTA." quebra naturalmente em 2 linhas balanceadas.

#### 8.9.5 Checklist 8.9 pré-publicação

- [ ] Toda headline dentro de card/painel/coluna tem `max-width: 100%` ou `none` (não `<N>ch` restritivo)
- [ ] Cards e painéis que abrigam headlines declaram `container-type: inline-size`
- [ ] Font-size de headlines em containers usa `cqi` (preferido) ou `vw` calibrado para o uso
- [ ] Em desktop ≥1440px, abrir a peça e verificar: cada headline preenche ≥65% da largura do seu container quando em linha única
- [ ] Nenhuma headline quebra em painel onde sobra mais de 30% de espaço horizontal vazio
- [ ] Quebras que acontecem são balanceadas (não viúvas) pela combinação `text-wrap: balance` + `<span class="line">` (pattern 8.1.1)

### 8.10 Validação automatizada sugerida

Antes de publicar, executar mentalmente (ou via Playwright/DevTools):

```
1. Abrir página em 375×667 (mobile baseline)
2. Tirar screenshot full-page
3. Verificar: existe scroll horizontal? → se sim, FALHA (viola 8.3)
4. Verificar: algum texto cortado pela direita? → se sim, FALHA (viola 8.3)
5. Abrir em 1440×900 (desktop baseline)
6. Tirar screenshot da viewport visível (sem rolar)
7. Verificar: hero tem mais de 5 linhas verticais? → se sim, FALHA (viola 8.2)
8. Verificar: alguma headline tem palavra isolada em linha própria? → se sim, FALHA (viola 8.1)
9. Verificar: coluna lateral tem mais de 40% de espaço vazio? → se sim, FALHA (viola 8.4)
```

Toda peça nova passa por esse roteiro antes de receber o selo de aprovação Baziotti.

---

## 9. Histórico

| Data | Versão | Mudança | Por |
|---|---|---|---|
| 2026-05-08 | 1.0 | `GRID_PROPORTIONALITY` formalizada (balanceamento de colunas + tabela de gaps fixos) | aiox-master sob baziotti |
| 2026-05-08 | 2.0 | `RESPONSIVE_PROPORTIONALITY` adicionada como evolução: respiros fluidos + hierarquia de 5 níveis + gutter único + container query + scale tipográfica fluida + travas anti-overflow | aiox-master sob baziotti |
| 2026-05-15 | 3.0 | Seção 8 adicionada (Preenchimento de Tela & Anti-overflow) após incidente ARK TAX: proibição absoluta de `<br/>` em headlines, regra 60%/70% de densidade de hero, garantia anti-overflow horizontal global, tabela canônica font-size × ch, galeria de referência visual em `references/responsive-examples/`, checklist expandido. | aiox-master sob baziotti |
| 2026-05-15 | 3.1 | Sub-seção 8.1.1 adicionada (Pattern canônico para headline com sentenças distintas) após segundo incidente ARK TAX hero-aside-title ("CRM NÃO É FERRAMENTA. É governança." virando viúva tipográfica). Pattern `<span class="line">` block + flexbox column + `&nbsp;` em pares ênfase formalizado com HTML e CSS de referência. | aiox-master sob baziotti |
| 2026-05-15 | 3.2 | Seção 8.9 adicionada (Preenchimento antes da quebra · Container-aware typography) após terceiro incidente ARK TAX. Estabelece hierarquia de `max-width`: `100%` ou `none` em headlines dentro de cards/painéis, `<N>ch` apenas em fullbleed sem container limitante. Container queries (`container-type: inline-size`) e unidades `cqi` viram pattern preferido para tipografia adaptativa. Ratio de preenchimento mínimo de 65-75% por tipo de container. Esta regra SOBREPÕE tabela 8.5 quando houver conflito. | aiox-master sob baziotti |

---

*Owner: baziotti. Severidade: NON_NEGOTIABLE. Refatorar peças existentes em ordem de criticidade comercial. Sempre que detectar violação em produção, gerar story de correção imediata via @sm.*
