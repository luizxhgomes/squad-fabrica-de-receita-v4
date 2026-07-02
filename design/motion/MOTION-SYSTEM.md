# MOTION-SYSTEM.md: Sistema de animação do squad fabrica-de-receita-v4

> Framework oficial: **Remotion** (React Video Framework).
> Brand authority: agente baziotti.
> Manual aplicável a toda animação produzida pelo squad: landing pages, redes sociais, dashboards, design system, vídeos institucionais, audiograms.
> Compliance 100% ao DESIGN.md, REBRANDING-RULES.md e às regras de orquestração do squad.

---

## 1. Princípios

### 1.1 Brand compliance first

Animação não é exceção ao brandbook. Todas as cores vêm de `design/tokens/tokens.json`. Toda tipografia obedece à seção 3 do `DESIGN.md`. A logo é sempre arquivo PNG ou SVG existente em `design/logos/`. NUNCA inventar logo via animação programática.

### 1.2 Animação tem função

Toda animação responde a uma das três funções:

- **Atenção:** chamar o olho para o elemento mais importante (hero, CTA, número impactante).
- **Hierarquia:** ordenar a leitura ao revelar elementos em sequência (timeline das 8 travas, steps do método V4).
- **Narrativa:** contar uma história em movimento (jornada do diagnóstico, transformação de receita).

Animação sem função é decoração pura. Decoração pura é proibida.

### 1.3 Timing oficial

| Tipo | Duração | Easing |
|---|---|---|
| Entrada (fade in, slide up, scale up) | 400ms a 600ms | ease-out |
| Ênfase (pulse, glow, shake leve) | 200ms a 300ms | ease-in-out |
| Saída (fade out, slide down) | 200ms a 400ms | ease-in |
| Transição entre cenas (Remotion) | 300ms a 500ms | ease-in-out |
| Stagger entre itens em lista | 60ms a 120ms entre cada item | linear |

### 1.4 Reduced motion

Toda peça digital deve respeitar `prefers-reduced-motion: reduce`. Quando o usuário sinaliza que prefere reduzir animação, o squad fornece:

- Versão estática equivalente da peça.
- Transições reduzidas para `opacity` apenas.
- Sem auto-play em vídeos.

### 1.5 Performance budget

- Mobile first: tudo testado em 60 fps em iPhone SE de geração 1.
- Vídeos para web exportados em H.264, max 5 MB por trecho de até 6 segundos.
- Audiograms para Reels: 1080x1920 a 30 fps, max 8 MB.
- LPs: animação CSS pura sempre que possível. Recorrer a Remotion ou Lottie apenas quando o efeito não cabe em CSS.

---

## 2. Stack oficial

### 2.1 Remotion (vídeo programático em React)

Framework principal para qualquer asset que precise ser **vídeo exportável** (MP4, WebM, GIF).

Skills disponíveis no Claude Code:

- `remotion-animator`: skill principal. Use quando precisar criar do zero qualquer vídeo, motion graphic, audiogram, TikTok ou Reel.
- `remotion-best-practices`: carregar antes de iniciar projeto Remotion. Garante performance e estrutura correta.
- `remotion`: walkthrough de UI a partir de projetos Stitch.

### 2.2 CSS animations e Web Animations API

Para tudo que vive **dentro do browser** (LPs, dashboards, design system preview):

- `@keyframes` mais `transition` para animações simples.
- Web Animations API (`element.animate()`) para sequências orquestradas.
- Variáveis CSS dos tokens oficiais.
- IntersectionObserver para revelar conteúdo no scroll.

### 2.3 Lottie (apenas quando aplicável)

Para ícones animados pequenos (loading, success, micro-interações). Sempre exportado a partir de After Effects pelo time de design, com cores pré-mapeadas para tokens oficiais.

---

## 3. Padrões de animação (motion patterns)

### 3.1 Hero entrance

Aplicação típica em landing pages do Destrava Receita.

Sequência:

1. Background gradient hero (`--grad-brand-primary`: `#560303` para `#7A0A02` para `#FB2E0A`) entra com fade in 600ms.
2. Logo V4 (PNG branco) entra com scale de 0.92 para 1.0, fade in 500ms, delay 200ms.
3. Headline entra de baixo para cima 24px, fade in 500ms, delay 400ms.
4. Subheadline entra de baixo para cima 16px, fade in 400ms, delay 600ms.
5. CTA primário com glow vermelho pulsando lento (4s loop), delay 800ms.

Total da entrada: cerca de 1.4 segundos. O usuário vê headline em 900ms.

### 3.2 Stat counter

Para números impactantes (100x, 800k, 82%, NRR 118%).

- Conta de 0 até o valor final em 1.2 segundos.
- Easing ease-out (rápido no início, desacelera no fim).
- Tipografia Morganite Bold em tamanho de impacto (clamp até 115px desktop).
- Cor `--v4-red-primary` (#E50914) sobre fundo claro, ou branco sobre fundo escuro.
- Sufixo (x, k, %) entra fade in 200ms depois do número alcançar o valor final.

### 3.3 Step reveal (timeline das 8 travas)

Aplicação para apresentar a metodologia em ordem.

- Linha do tempo horizontal cresce da esquerda para a direita em 800ms.
- Cada um dos 8 marcadores aparece em sequência com stagger de 100ms entre cada.
- Trava ativa pulsa em vermelho (200ms in, 200ms out, loop infinito).
- Conteúdo da trava ativa aparece à direita ou abaixo com slide up 24px e fade in 400ms.

### 3.4 Card hover (sobre dark)

Para cards glassmorphism em landing pages dark:

- Estado normal: `border: 1px solid rgba(233,57,44,0.3)`, sem glow.
- Hover: `border: 1px solid rgba(233,57,44,1)`, `box-shadow: 0 0 60px rgba(233,57,44,0.4)`, scale 1.02.
- Transição: 250ms ease-out.

### 3.5 Scroll reveal

Para sections internas de LP. Usar IntersectionObserver:

- Trigger quando 20% do elemento entra na viewport.
- Animação: fade in 500ms, slide up 32px, delay zero.
- Stagger entre filhos diretos: 100ms.

### 3.6 Audiogram (trecho de podcast Dener)

Aplicação para Reels e TikTok do Dener falando.

- Background vermelho profundo sólido (`#280000`).
- Forma de onda animada acompanhando a faixa de áudio (cor `#E50914`).
- Legenda (caption) sincronizada, fonte IBM Plex Sans Bold 32pt branco.
- Logo V4 em canto inferior direito, fixo, branco.
- Duração: 15 a 60 segundos.
- Output: 1080x1920 a 30 fps, MP4 H.264.

---

## 4. Aplicações por superfície

### 4.1 Landing pages

Cada LP do Destrava Receita usa, no mínimo:

- Hero entrance.
- Glow loop no CTA primário.
- Scroll reveal nas sections.
- Stat counter na seção de social proof.
- Step reveal no método.
- Card hover nos pricing cards.

### 4.2 Design system preview

A página `design/preview.html` ganha animações suaves de entrada:

- Hero entrance no header.
- Scroll reveal em cada section.
- Hover effect nos swatches de cor.
- Glow pulse no botão "Destravar receita" da seção Componentes.

### 4.3 Dashboards e Command Center

- Skeleton loader com shimmer durante fetch (cor `#1a1a1a` a `#2a2a2a` em loop horizontal 1.5s).
- Toast de sucesso: slide in da direita 300ms, fica 4s, slide out 200ms.
- Toast de erro: shake 200ms (3 oscilações de 4px) ao aparecer.
- Atualização de KPI: cross-fade do número antigo para o novo em 400ms.

### 4.4 Redes sociais

- Reels e TikTok do Dener: produzir via Remotion com `remotion-animator`. Output 1080x1920 a 30 fps.
- Carrosséis Instagram: capa com hero animado em PNG sequence, slides internos estáticos.
- Stories: motion de 5 a 10 segundos com headline animada e CTA.

### 4.5 Vídeos institucionais

- Walkthrough de produto: Remotion mais skill `remotion` (Stitch + walkthrough).
- Pitch deck animado: Remotion para slides de até 30 segundos cada.

---

## 5. Workflow de produção

### 5.1 Ativação

1. Specialist do squad identifica que a peça precisa de motion.
2. Solicita aprovação ao brand-chief baziotti antes de animar.
3. Baziotti valida que a animação tem função (atenção, hierarquia, narrativa) e cabe no orçamento performance.

### 5.2 Execução

1. Carregar skill `remotion-best-practices` para boas práticas atualizadas.
2. Para vídeo: usar skill `remotion-animator`.
3. Para CSS: aplicar tokens oficiais via variáveis CSS.
4. Para Stitch walkthrough: skill `remotion`.

### 5.3 Validação

Antes de publicar, baziotti aplica o checklist:

- [ ] Cores vêm de `design/tokens/tokens.json`. Nada fora da paleta.
- [ ] Tipografia respeita a stack oficial (Morganite/Fjalla One display de impacto, IBM Plex Sans sistema/body).
- [ ] Logo é arquivo PNG ou SVG real, nunca recriação tipográfica.
- [ ] Nomenclatura V4 Company correta (padrão Sobrenome&Co do rebranding). Sem nomes de exemplo didático do manual em produção.
- [ ] Timing dentro do range oficial (seção 1.3).
- [ ] Versão reduced-motion existe.
- [ ] 60 fps em mobile.
- [ ] Tamanho do arquivo dentro do budget.
- [ ] Português impecável.
- [ ] Zero travessão em legendas.
- [ ] Zero azul.

---

## 6. Estrutura de pastas

```
design/motion/
├── MOTION-SYSTEM.md        Este documento, fonte da verdade
├── examples/               Snippets e mini-projetos de referência
│   ├── hero-entrance.tsx   (futuro) componente Remotion para hero
│   ├── stat-counter.tsx    (futuro) componente Remotion para counters
│   ├── audiogram.tsx       (futuro) template de audiogram do Dener
│   └── README.md           (futuro) índice navegável dos exemplos
└── output/                 (gerado por workflows, gitignored)
```

---

## 7. Referências externas

- Site oficial Remotion: https://www.remotion.dev
- Documentação: https://www.remotion.dev/docs
- Brand guidelines deste squad: `design/DESIGN.md`
- Rebranding compliance: `design/references/REBRANDING-RULES.md`
- Tokens canônicos: `design/tokens/tokens.json`

---

*MOTION-SYSTEM.md, versão 1.0.0, criado em 2026-05-08 por aiox-master sob direção do brand-chief baziotti. Owner permanente: baziotti.*
