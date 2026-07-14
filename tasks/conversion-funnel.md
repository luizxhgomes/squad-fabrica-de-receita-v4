---
task: Conversion Funnel
responsavel: "@conversion-optimizer"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - empresa: Empresa e segmento
  - tipo_venda: B2B, B2C, ecommerce, SaaS, servico
  - funil_atual: Etapas do funil de vendas atual
  - taxa_conversao_atual: Taxa de conversao geral (leads para clientes)
  - taxa_fechamento: Percentual de propostas que fecham
  - motivos_perda: Por que os prospects NAO compram
  - cpa_atual: Custo por Aquisicao atual
Saida: |
  - mapa_funil: Mapa completo do funil com taxas e benchmarks
  - diagnostico_travas: Diagnostico das travas de Decisao e Compromisso
  - playbook_vendas: Playbook de vendas (B2B) ou CRO plan (B2C/ecommerce)
  - automacoes: Sequencias de automacao configuradas
  - dashboard_kpis: Dashboard de KPIs do Pilar de Conversao
Checklist:
  - "[ ] Funil mapeado com taxas de conversao por etapa"
  - "[ ] Travas de conversao diagnosticadas com evidencias"
  - "[ ] Playbook ou CRO plan criado por tipo de negocio"
  - "[ ] Sequencias de automacao definidas (confirmacao, recuperacao, follow-up)"
---

# Task: conversion-funnel

**Agent:** @conversion-optimizer
**Trigger:** `*conversion-funnel`
**Objetivo:** Otimizar o funil de conversão: Pilar 3: transformar atenção em receita com precisão cirúrgica

---

## Inputs

```yaml
elicit: true
fields:
  - empresa: "Empresa e segmento"
  - tipo_venda: "B2B, B2C, ecommerce, SaaS, serviço?"
  - funil_atual: "Descrever etapas do funil de vendas atual"
  - taxa_conversao_atual: "Taxa de conversão geral (leads → clientes)"
  - taxa_fechamento: "% de propostas que fecham"
  - motivos_perda: "Por que os prospects NÃO compram?"
  - cpa_atual: "Custo por Aquisição atual"
```

---

## Execução

### FASE 1: Mapeamento do Funil Atual

```markdown
#### FUNIL COMPLETO COM TAXAS:

TOPO (Aquisição)
├── Volume de Leads: [X]/mês
├── Custo por Lead: R$ [Y]
└── Taxa Qualificação: [Z]%
    ↓
MEIO (Qualificação & Interesse)
├── Volume de MQLs: [X]/mês
├── Taxa MQL → SQL: [Z]%
└── Tempo médio de qualificação: [X] dias
    ↓
FUNDO (Decisão & Compromisso)
├── Volume de Reuniões/Demos: [X]/mês
├── No-show rate: [Z]%
├── Taxa Proposta enviada: [Z]%
├── Taxa de Fechamento: [Z]%
└── Ciclo médio de vendas: [X] dias
    ↓
PÓS-VENDA
├── Taxa de Onboarding completo: [Z]%
└── NPS inicial: [X]

**Trava identificada no funil:** [etapa com pior taxa vs benchmark]
```

---

### FASE 2: Diagnóstico de Travas de Conversão

```markdown
#### TRAVA DE DECISÃO (Fechamento):
Diagnóstico:
- Taxa de fechamento atual: [X]% vs benchmark 20-30%
- Principais objeções mapeadas:
  1. [Objeção + frequência]
  2. [Objeção + frequência]
  3. [Objeção + frequência]
- O follow-up existe? É estruturado?
- Existe playbook de vendas documentado?

Solução:
[ ] Criar playbook de objeções (cada objeção com 3 respostas)
[ ] Estruturar sequência de follow-up automatizada
[ ] Adicionar social proof no momento de decisão
[ ] Criar urgência genuína na oferta

---

#### TRAVA DE COMPROMISSO (Abandono):
Diagnóstico:
- No-show rate em reuniões: [X]% (ideal: <20%)
- Taxa de abandono de checkout: [X]% (ideal: <70% ecommerce)
- Formulários iniciados vs completados: [X]%

Solução:
[ ] Sequência de confirmação de reunião (email + WhatsApp)
[ ] Simplificar checkout (menos campos, mais clareza)
[ ] Recuperação de carrinho/abandono automatizada
[ ] Remover fricções técnicas identificadas
```

---

### FASE 3: Otimização por Tipo de Negócio

```markdown
#### SE B2B (VENDAS COMPLEXAS):

Playbook de Vendas:
1. Discovery: [script de perguntas para mapear dor]
2. Qualificação BANT: Budget, Authority, Need, Timeline
3. Demo/Apresentação: [estrutura que converte]
4. Proposta: [formato que facilita decisão]
5. Follow-up: [cadência e canais]
6. Fechamento: [técnicas de fechamento]
7. Objeções: [mapa completo de objeções + respostas]

---

#### SE B2C / ECOMMERCE:

CRO (Conversion Rate Optimization):
[ ] Headline da LP: testa 3 versões diferentes
[ ] CTA acima da dobra (não exige scroll para ver o botão)
[ ] Prova social visível: número de clientes, avaliações
[ ] Urgência genuína: estoque limitado, prazo real
[ ] Checkout simplificado: máximo 3 campos
[ ] Garantia clara e visível
[ ] Chat ou suporte ativo durante o processo
```

---

### FASE 4: Automações de Conversão

```markdown
#### SEQUÊNCIAS AUTOMATIZADAS:

CONFIRMAÇÃO DE REUNIÃO:
- D-2: Email de confirmação + pauta
- D-1: WhatsApp lembrete
- D-0 (2h antes): Reminder final + link

RECUPERAÇÃO DE ABANDONO:
- 1h após abandono: Email "esqueceu algo?"
- 24h: Email com prova social + garantia
- 72h: Email com oferta especial (se houver)

FOLLOW-UP PÓS-PROPOSTA:
- D+1: "Tem alguma dúvida sobre a proposta?"
- D+3: Case de sucesso relevante
- D+7: "Ainda fazendo sentido pra vocês?"
- D+14: Última oportunidade antes de arquivar

#### IA NA CONVERSÃO:
[ ] Propensity scoring (IA prevê quem vai fechar)
[ ] Chatbot de qualificação (responde dúvidas 24/7)
[ ] Personalização de proposta com dados do prospect
[ ] Alerta ao vendedor quando lead demonstra intenção de compra
```

---

### FASE 5: KPIs e Metas

```markdown
#### DASHBOARD DE CONVERSÃO:
| KPI | Baseline | Benchmark | Meta 90d |
|-----|---------|-----------|---------|
| Taxa de Fechamento | | 20-30% | |
| Ciclo de Vendas | | | -20% |
| CPA | | | -15% |
| No-show rate | | <20% | |
| Taxa de Proposta → Fechamento | | | +10pp |
```

---

## Outputs

- Mapa completo do funil com taxas e benchmarks
- Diagnóstico das travas de Decisão e Compromisso
- Playbook de vendas completo (B2B) ou CRO plan (B2C/ecommerce)
- Sequências de automação configuradas
- Dashboard de KPIs do Pilar de Conversão