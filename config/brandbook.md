# Brandbook aplicado da Fábrica de Receita

> Guia de aplicação da identidade visual do squad `fabrica-de-receita`.
> Fonte da verdade dos tokens: `design/tokens/tokens.json` (espelho YAML em `config/tokens.yaml`).
> Documento mestre do design system: `design/DESIGN.md`. Autoridade: experience-designer.

---

## 1. Identidade e hierarquia de marca

### Hierarquia institucional
- **a assessoria é a referência máxima.** Toda peça produzida pelo squad usa a identidade **Fábrica de Receita** sob o umbrella a assessoria.
- Nomes de franquias nominais aparecem apenas em material didático de rebranding, como exemplos. Nunca em produção.
- Compliance 100% ao Manual de Rebranding a assessoria: regras canônicas em `design/references/REBRANDING-RULES.md`.

### Logos oficiais (regra NUNCA_INVENTAR_LOGO, NON_NEGOTIABLE)
- Usar **somente** os arquivos existentes em `design/logos/` (ícone em vermelho, branco e preto).
- Proibido: recriar a logo em texto (Morganite, IBM Plex Sans, Fjalla One ou qualquer tipografia), gerar logo via IA, traçar manualmente em SVG ou Figma.
- Logo sempre intacta: sem rotação, distorção, mudança de cor ou efeito.
- Se o asset correto não existir em `design/logos/`, parar a produção e solicitar ao brand-chief.
- Favicon obrigatório em toda página HTML: `design/logos/-icon-preto.jpg`.

### Essência da marca
- **Precisão cirúrgica:** não fazemos tudo, fazemos o que importa.
- **Autoridade técnica:** baseado em ciência, não em achismo.
- **Urgência controlada:** o gargalo custa caro a cada dia que passa.
- **Clareza e objetividade:** diagnóstico limpo, sem ruído.

---

## 2. Paleta 2026

Regra ZERO_AZUL (NON_NEGOTIABLE): proibição absoluta de azul em qualquer papel, seja marca, semântica, dataviz, links ou estados informativos. O antigo acento informativo azul foi removido da paleta: informação neutra usa neutros ou amarelo.

### Cores primárias e de marca

| Nome | Hex | Uso | Contraste (aprox.) |
|------|-----|-----|--------------------|
| Vermelho (primária) | `#E50914` | Logo, destaques, links, filete de assinatura | Branco sobre ele: 4.8:1 (AA body). Sobre `#050505`: 4.3:1 (AA texto grande/bold) |
| Preto (dark) | `#050505` | Texto principal, backgrounds escuros | Branco sobre ele: 20:1 (AAA) |
| Flame (accent) | `#FB2E0A` | Stop final de gradientes, glow quente, ênfase gráfica | Sobre `#050505`: uso gráfico e texto grande |
| Accent DR | `#FF003F` | Exclusivo da linha Destrava Receita (deck oficial do produto): destaques e grafismos de peças DR | Sobre `#050505`: 5.2:1 (AA body). Sobre branco: 3.9:1 (só texto grande) |

Rampa vermelha de apoio (stops de gradiente, nunca protagonistas): `#C41E08`, `#8B1205`, `#7A0A02`, `#560303`, `#280000`.

### CTA (o verde é EXCLUSIVO de CTA)

| Nome | Hex | Uso | Contraste (aprox.) |
|------|-----|-----|--------------------|
| CTA verde | `#00A86B` | Botões de conversão. Texto branco SOMENTE grande/bold | Branco sobre ele: 3.1:1 (limítrofe, só large/bold) |
| CTA verde escuro | `#0E8420` | Botão com texto branco em tamanho normal | Branco sobre ele: 4.8:1 (AA body) |
| CTA hover | `#FF6200` | Estado hover de CTA | Uso de estado, não de texto corrido |
| CTA ativo | `#E55700` | Estado ativo/pressed de CTA | Uso de estado |

Regras do CTA: o botão de conversão é **verde, nunca vermelho**. O verde de CTA não aparece em nenhum outro papel (não é cor de sucesso, não é dataviz, não é acento decorativo).

### Neutros

| Nome | Hex | Uso |
|------|-----|-----|
| Branco | `#FFFFFF` | Fundos claros, texto sobre escuro |
| Cinza claro | `#F2F2F2` | Cards, backgrounds secundários claros |
| Cinza | `#606060` | Bordas, placeholders, texto de apoio (AA sobre branco) |
| Cinza escuro | `#1E2124` | Texto sobre claro, superfícies escuras neutras |
| Preto 70% | `#1c1c1cb3` | Texto secundário sobre fundo claro |
| Branco 70% | `#ffffffb3` | Texto secundário sobre fundo escuro |

### Acentos e semânticas

| Nome | Hex | Uso | Contraste (aprox.) |
|------|-----|-----|--------------------|
| Amarelo | `#FDFF87` | Acento e ativação, highlights | Sobre `#050505`: 19:1 |
| Amarelo saturado | `#FFDD00` | Badges, tags, avisos | Sobre `#050505`: alto |
| Verde positivo | `#09E50D` | Dado positivo/destravado em dataviz de benchmark. NÃO é CTA | Uso gráfico |

---

## 3. Código de cores das 8 travas

Rampa exclusivamente vermelho/laranja/âmbar + neutros (a regra ZERO_AZUL proíbe azul, e também não se usa roxo nem rosa nas travas). T1 é o neutro máximo (cegueira: sem dados, sem cor). De T8 para T2 a rampa esquenta do âmbar ao vermelho conforme a proximidade da receita: quanto mais perto do dinheiro, mais vermelha a trava.

| Trava | Hex | Racional de uso |
|-------|-----|------------------|
| T1 Cegueira | `#050505` | Neutro máximo: sem dados não há diagnóstico nem cor |
| T2 Retenção | `#C41E08` | Vermelho profundo: perder cliente caro é dupla penalidade, máxima proximidade da receita |
| T3 Decisão | `#E50914` | Vermelho pleno: prospect qualificado que não fecha |
| T4 Compromisso | `#FB2E0A` | Vermelho alaranjado: abandono no momento crítico |
| T5 Qualificação | `#FF4820` | Laranja avermelhado (stop do gradiente ember): leads errados no pipeline |
| T6 Interesse | `#FF6200` | Laranja: visitante não vira lead |
| T7 Atenção | `#F97316` | Laranja âmbar: exposição ignorada |
| T8 Exposição | `#F59E0B` | Âmbar pleno: sem alcance ao público, topo do funil |

Estado especial: **restrição ativa** (a trava que é o constraint do sistema) recebe `#E50914` + glow `red-spread` (`0 0 39.3px 8.8px rgba(255,0,0,0.51)`), podendo pulsar conforme o motion system.

Aplicação: sobre fundo escuro, a cor da trava funciona como acento gráfico (barra, ícone, borda, chip); o texto ao lado usa neutros (`#FFFFFF` ou `#ffffffb3`) para garantir WCAG AA.

---

## 4. Tipografia

| Papel | Fonte | Pesos | Uso |
|-------|-------|-------|-----|
| Display (impacto) | **Morganite** | 500 / 600 / 700 | Headlines de impacto, condensada, uso pontual (chamadas fortes, números-herói) |
| Display alternativa | **Fjalla One** | 400 | Alternativa de display quando Morganite não couber |
| Heading e body | **IBM Plex Sans** | 400 / 500 / 600 | Títulos de seção, corpo de texto e UI |

Regras:
- Máximo de 2 fontes por peça. Morganite é pontual, nunca texto corrido.
- Nunca serif.
- Escala tipográfica fluida com `clamp()` (valores canônicos em `config/tokens.yaml` e `design/DESIGN.md`).
- Números em copy sempre como dígitos ("4 gatilhos", nunca "quatro gatilhos").

### Licenciamento
As fontes são **self-hosted pelo usuário** (arquivos woff2 próprios, fora deste repositório). **Nunca embutir fontes licenciadas de terceiros no repositório** nem versionar arquivos de fonte de terceiros junto com o squad.

---

## 5. Voz e tom

A voz canônica do squad é a do Chief. Antes de gerar qualquer copy, o agente consulta o manual de voz: **`data/revenue-principles.md`** (ponte obrigatória, não duplicar o conteúdo aqui).

Princípios aplicados:
1. **Direto ao ponto:** nunca enrola, nunca vende sem substância.
2. **Baseado em dados:** números, não jargões.
3. **Autoridade sem arrogância:** ensina, não julga.
4. **Urgência honesta:** o gargalo custa caro, mas não grita.

Exemplo de linguagem:

Evitar:
> "Transformamos seu negócio com soluções inovadoras de marketing digital para alavancar resultados!"

Usar:
> "Identificamos matematicamente qual das 8 travas está limitando seu faturamento. Atacamos essa. Só essa. Por 90 dias."

Regras de escrita (NON_NEGOTIABLE): português com acentuação completa; travessão proibido em copy renderizável (usar ponto, vírgula ou dois-pontos); números como dígitos.

---

## 6. Aplicação em peças

Todas as peças obedecem às regras GRID_PROPORTIONALITY e RESPONSIVE_PROPORTIONALITY do `squad.yaml` (respiros fluidos em `clamp()`, hierarquia de 5 níveis de `config/tokens.yaml` seção `spacing.fluid`, gutter único `clamp(14px, 4vw, 32px)`, grids sem órfãos).

### Landing page
- Hero com gradiente `primary` ou `hero-cine`, overlay `hero` para legibilidade do texto.
- Headline em Morganite ou Fjalla One, corpo em IBM Plex Sans.
- CTA verde `#00A86B` (pill), hover `#FF6200`.
- Gutter lateral único, seções com respiro `section`, zero `<br/>` em headline, hero de no máximo 60vh.

### Dashboard
- Fundo `#050505`, cards glass-first (`surface-glass.fill`, stroke em gradiente, blur 22px) com fallback flat para ambientes sem `backdrop-filter`.
- Dado positivo/destravado em `#09E50D`; travas na rampa da seção 3; restrição ativa com glow.
- Métricas e números em IBM Plex Sans semibold; grid com `min-width: 0` em todo filho.

### Social
- Formatos verticais com fundo escuro ou gradiente `sphere`/`ember` como objeto, nunca como fundo de foto.
- Foto oficial sempre sobre `photo-radial`.
- Logo pelo asset oficial de `design/logos/`, nunca recriada.

### Deck
- Capa com `hero-cine`, marcos dourados com `gold-accent` e glow `gold`.
- 1 ideia por slide, títulos em display, corpo em IBM Plex Sans.
- Paridade de identidade entre formatos (LP, PPTX, PDF) quando a peça for multi-formato.

### Motion
- Toda animação segue `design/motion/MOTION-SYSTEM.md`: entrada 400ms a 600ms, ênfase 200ms a 300ms, saída 200ms a 400ms; ease-out na entrada, ease-in na saída; respeitar `prefers-reduced-motion`; 60fps.

---

## 7. Resumo das regras NON_NEGOTIABLE

1. **ZERO_AZUL:** proibição absoluta de azul em qualquer papel.
2. **NUNCA_INVENTAR_LOGO:** somente assets de `design/logos/`; nunca recriar, gerar por IA ou traçar.
3. **TIPOGRAFIA_OFICIAL:** Morganite/Fjalla One (display) + IBM Plex Sans (body); máximo 2 fontes por peça; nunca serif.
4. **PALETA_OFICIAL:** apenas cores documentadas nos tokens; nada inventado.
5. **CTA verde:** `#00A86B` exclusivo de conversão; botão nunca vermelho.
6. **WCAG_AA:** contraste mínimo 4.5:1 para body, 3:1 para texto grande; validar antes de publicar.
7. **GRID_PROPORTIONALITY:** grids sem órfãos (encaixe perfeito, split semântico, single line ou balanceamento).
8. **RESPONSIVE_PROPORTIONALITY:** respiros fluidos em `clamp()`, 5 níveis, gutter único; doc em `design/RESPONSIVE-PROPORTIONALITY.md`.
9. **Escrita:** acentuação completa, travessão proibido, números como dígitos.
