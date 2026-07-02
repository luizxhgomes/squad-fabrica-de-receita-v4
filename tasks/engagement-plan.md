---
task: Engagement Plan
responsavel: "@content-engine"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - empresa: Empresa e segmento
  - icp: Perfil do cliente ideal
  - canais_conteudo: Canais onde os clientes estao (Instagram, LinkedIn, Email, YouTube)
  - metricas_engajamento: Taxa de engajamento atual, email open rate
  - top_content: Conteudo que mais performou
  - objetivo: Aumentar autoridade, gerar leads, nutrir pipeline
Saida: |
  - audit_engajamento: Audit completo de engajamento com gaps
  - matrix_conteudo: Matrix de conteudo com calendario editorial
  - fluxo_email: Fluxo de email marketing estruturado
  - automacoes_ia: Automacoes de IA configuradas
  - dashboard_kpis: Dashboard de KPIs do Pilar de Engajamento
Checklist:
  - "[ ] Diagnostico de engajamento por canal realizado"
  - "[ ] Matrix de conteudo definida (Atencao/Interesse/Conversao)"
  - "[ ] Fluxo de email marketing estruturado (boas-vindas + nutricao)"
  - "[ ] KPIs de engajamento com baseline e metas definidos"
---

# Task: engagement-plan

**Agent:** @content-engine
**Trigger:** `*engagement-plan`
**Objetivo:** Criar plano de engajamento para o Pilar 2 V4: construir conexão, confiança e valor percebido em escala

---

## Inputs

```yaml
elicit: true
fields:
  - empresa: "Empresa e segmento"
  - icp: "Perfil do cliente ideal"
  - canais_conteudo: "Onde estão seus clientes? (Instagram, LinkedIn, Email, YouTube...)"
  - metricas_engajamento: "Taxa de engajamento atual, email open rate, etc."
  - top_content: "Qual conteúdo performou melhor até hoje?"
  - objetivo: "Aumentar autoridade, gerar leads, nutrir pipeline?"
```

---

## Execução

### FASE 1: Audit de Engajamento

```markdown
#### DIAGNÓSTICO ATUAL:
| Canal | Seguidores/Base | Taxa Engajamento | Benchmark | Gap |
|-------|----------------|-----------------|-----------|-----|
| Instagram | | | >3% | |
| LinkedIn | | | >2% | |
| Email | | | 25-35% | |
| YouTube | | | >5% views | |

#### CONTEÚDO QUE MAIS PERFORMA:
- Formato: [vídeo, carrossel, texto]
- Tema: [o que ressoa com o ICP]
- CTA: [o que gera mais ação]
```

---

### FASE 2: Estratégia de Conteúdo por Pilar

```markdown
#### MATRIX DE CONTEÚDO (V4 Method):

**Conteúdo de ATENÇÃO (Top of Funnel):**
- Objetivo: parar o scroll, criar curiosidade
- Formatos: Reels, Shorts, headlines impactantes
- Volume: 40% do conteúdo total
- Hook obrigatório nos primeiros 3 segundos

**Conteúdo de INTERESSE (Middle of Funnel):**
- Objetivo: educar, criar desejo, demonstrar valor
- Formatos: Carrosséis, artigos longos, webinars
- Volume: 40% do conteúdo total
- Deve responder às principais dúvidas do ICP

**Conteúdo de CONVERSÃO (Bottom of Funnel):**
- Objetivo: criar urgência, remover objeções, converter
- Formatos: Cases, depoimentos, ofertas
- Volume: 20% do conteúdo total
- CTA específico e direto

#### CALENDÁRIO EDITORIAL:
| Semana | Segunda | Quarta | Sexta |
|--------|---------|--------|-------|
| Tipo | Atenção | Interesse | Conversão |
| Formato | [formato] | [formato] | [formato] |
| Tema | [tema] | [tema] | [tema] |
```

---

### FASE 3: Email Marketing e Nutrição

```markdown
#### FLUXO DE NUTRIÇÃO:

BOAS-VINDAS (Lead acabou de entrar):
- Email 1 (imediato): Boas-vindas + recurso prometido
- Email 2 (+2 dias): A dor principal do ICP + insights
- Email 3 (+4 dias): Social proof + case de sucesso
- Email 4 (+7 dias): Conteúdo de valor gratuito
- Email 5 (+10 dias): Soft offer (CTA para próximo passo)

NUTRIÇÃO CONTÍNUA:
- 1 email por semana com valor genuíno
- 1 email por mês com oferta/CTA
- Segmentação por interesse e comportamento

REENGAJAMENTO (Leads frios):
- Sequência de 3 emails com "última chance" para leads inativos >60 dias
```

---

### FASE 4: AI-First para Engajamento

```markdown
#### AUTOMAÇÕES DE IA:
[ ] Personalização dinâmica de conteúdo por segmento
[ ] Content scoring (IA aprende o que mais engaja)
[ ] Behavioral targeting (conteúdo baseado em ações)
[ ] Melhor horário de envio de email por usuário
[ ] A/B testing automático de headlines e CTAs

#### FERRAMENTAS:
- Email: [RD Station / ActiveCampaign / Mailchimp]
- Social scheduling: [Buffer / Later / Metricool]
- Analytics: [GA4 + UTM estruturado]
- Criação: [Canva + IA generativa]
```

---

### FASE 5: KPIs e Metas

```markdown
#### DASHBOARD DE ENGAJAMENTO:
| KPI | Baseline | Meta 30d | Meta 60d | Meta 90d |
|-----|---------|---------|---------|---------|
| Email Open Rate | | +5pp | +10pp | +15pp |
| Taxa Engajamento Social | | | | |
| Tempo médio no site | | | | |
| NPS parcial | | | | |
```

---

## Outputs

- Audit completo de engajamento com gaps identificados
- Matrix de conteúdo com calendário editorial
- Fluxo de email marketing estruturado
- Automações de IA configuradas
- Dashboard de KPIs do Pilar de Engajamento