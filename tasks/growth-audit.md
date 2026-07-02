---
task: growth-audit
titulo: "Growth Audit V4 Completo"
responsavel: "@orchestrator"
responsavel_type: agent
atomic_layer: task
elicit: true
entrada: |
  - business_url: URL do negócio a ser auditado
  - periodo_analise: Período de dados (padrão: últimos 90 dias)
  - focos_prioritarios: Pilares com maior dor (opcional)
saida: |
  - audit_report: Relatório completo dos 4 pilares V4
  - gap_analysis: Gaps identificados por pilar
  - quick_wins: Top 3 ações de impacto imediato
  - roadmap_90d: Roadmap priorizado por ROI potencial
checklist:
  - "[ ] Dados coletados para os 4 pilares V4"
  - "[ ] Score de cada pilar calculado (0-10)"
  - "[ ] Top 3 quick wins identificados com impacto estimado"
  - "[ ] Roadmap de 90 dias priorizado por ROI"
quality_gates: [QG-001, QG-002]
usado_por_workflows: [wf-v4-growth-cycle]
---

# Task: growth-audit

**Trigger:** `*audit`
**Objetivo:** Auditoria científica completa dos 4 Pilares V4: Tráfego, Engajamento, Conversão e Retenção. Baseada na metodologia do Cientista do Marketing de Dener Lippert.

## Processo de Elicitação

```
? Qual o negócio/produto sendo auditado?
? Qual o período de análise? (padrão: últimos 90 dias)
? Quais pilares são maior prioridade? (ou todos)
? Quais dados você tem disponíveis?
  > Analytics (GA4, Meta Ads, Google Ads)
  > CRM data
  > Financeiros (CAC, LTV, Churn)
  > Todos acima
  > Nenhum: vamos mapear o que precisa ser medido
? Qual a maior dor atual?
  > CAC alto demais
  > Taxa de conversão baixa
  > Churn alto / LTV baixo
  > Falta de volume de tráfego
  > Engajamento fraco
  > Todas as anteriores
```

## Estrutura da Auditoria

### PILAR 1: TRÁFEGO (Hunter)

**Diagnóstico:**
- [ ] Volume de tráfego total e por canal
- [ ] CAC por canal (pago vs orgânico)
- [ ] Qualidade do tráfego (taxa de rejeição, tempo na página)
- [ ] ROAS por campanha ativa
- [ ] Share of Voice vs concorrentes

**Perguntas-chave:**
- Qual canal traz o melhor CAC:LTV ratio?
- Há canais subinvestidos com bom potencial?
- O tráfego pago está sendo escalado com rentabilidade?

**Score: /10** | **Gap:** | **Quick Win:**

---

### PILAR 2: ENGAJAMENTO (Nova)

**Diagnóstico:**
- [ ] Taxa de engajamento em redes sociais
- [ ] Email open rate e click rate
- [ ] Tempo médio no site e páginas por sessão
- [ ] NPS parcial (pesquisas de satisfação ativas?)
- [ ] Conteúdo: há estratégia clara de educação?

**Perguntas-chave:**
- O conteúdo move o lead pelo funil ou apenas entretém?
- Existe nurturing estruturado para leads frios?
- A marca é percebida como autoridade no nicho?

**Score: /10** | **Gap:** | **Quick Win:**

---

### PILAR 3: CONVERSÃO (Zara)

**Diagnóstico:**
- [ ] Taxa de conversão geral e por etapa do funil
- [ ] CPA (Custo por Aquisição)
- [ ] Taxa de abandono de carrinho/formulário
- [ ] Velocidade de fechamento (leads → clientes)
- [ ] Testes A/B: há cultura de experimentação?

**Perguntas-chave:**
- Onde o funil sangra mais? (maior drop-off)
- As landing pages têm proposta de valor clara?
- O processo de venda tem fricções evitáveis?

**Score: /10** | **Gap:** | **Quick Win:**

---

### PILAR 4: RETENÇÃO (Atlas)

**Diagnóstico:**
- [ ] Churn Rate mensal/anual
- [ ] LTV atual vs LTV potencial
- [ ] NPS score e segmentação (Promotores/Neutros/Detratores)
- [ ] Revenue de expansão (upsell/cross-sell %)
- [ ] Estratégia de reengagement ativa?

**Perguntas-chave:**
- Qual o custo de aquisição vs tempo de retenção?
- Existem early warning signs de churn sendo monitorados?
- Há programa estruturado de customer success?

**Score: /10** | **Gap:** | **Quick Win:**

---

## Cálculo de ROI Potencial por Pilar

```
ROI Potencial = Impacto Estimado na Receita / Investimento Necessário × 100

Priorização:
1. Quick Wins (impacto alto, esforço baixo) ← ATACAR PRIMEIRO
2. Projetos Estratégicos (impacto alto, esforço alto) ← PLANEJAR
3. Melhorias Incrementais (impacto médio, esforço baixo) ← INCLUIR NO CICLO
4. Backlog (impacto baixo) ← REVISAR TRIMESTRALMENTE
```

## Output: Relatório de Auditoria

```markdown
# Growth Audit: [Nome do Negócio]
**Data:** [data]
**Período:** [período analisado]

## Scorecard V4
| Pilar | Score | Status |
|-------|-------|--------|
| Tráfego | /10 | 🔴/🟡/🟢 |
| Engajamento | /10 | 🔴/🟡/🟢 |
| Conversão | /10 | 🔴/🟡/🟢 |
| Retenção | /10 | 🔴/🟡/🟢 |
| **TOTAL** | **/40** | |

## Top 3 Quick Wins
1. [Ação] | Impacto estimado: [R$X ou X%] | Prazo: [X dias]
2. [Ação] | Impacto estimado: [R$X ou X%] | Prazo: [X dias]
3. [Ação] | Impacto estimado: [R$X ou X%] | Prazo: [X dias]

## Roadmap 90 Dias
[Semana 1-2]: Quick Wins
[Semana 3-6]: Projetos de Conversão e Tráfego
[Semana 7-12]: Estratégias de Retenção e Escala
```
