---
task: weekly-performance
titulo: "Ritual Semanal de Performance"
responsavel: "@orchestrator"
responsavel_type: agent
atomic_layer: task
elicit: false
entrada: |
  - resultados_semana_anterior: KPIs da semana vs meta
  - eventos_relevantes: O que aconteceu de importante
  - blockers_identificados: O que está travando
saida: |
  - dashboard_semanal: Dashboard semanal atualizado (4 pilares)
  - decisoes: Lista de decisões (escalar/matar/pivotar/manter)
  - prioridades: Top 3 prioridades para a próxima semana
  - resumo_executivo: Resumo executivo para o time
  - tracking_ciclo: Tracking de progresso do ciclo de 90 dias
checklist:
  - "[ ] KPIs dos 4 pilares coletados e comparados com metas"
  - "[ ] Itens vermelhos identificados com ações imediatas"
  - "[ ] Decisões da semana documentadas (escalar/matar/pivotar/manter)"
  - "[ ] Top 3 prioridades definidas com responsáveis e prazos"
quality_gates: [QG-004]
usado_por_workflows: [wf-performance-sprint, wf-v4-growth-cycle]
---

# Task: weekly-performance

**Trigger:** `*sprint` / `*weekly`
**Objetivo:** Conduzir o ritual semanal de performance: medir, decidir e priorizar a semana seguinte

---

## Inputs

```yaml
# O orquestrador coleta os dados diretamente dos agentes especialistas
required_inputs:
  - resultados_semana_anterior: "KPIs da semana vs meta"
  - eventos_relevantes: "O que aconteceu de importante"
  - blockers_identificados: "O que está travando"
```

---

## Execução

### FASE 1: Coleta de KPIs (5min)

```markdown
#### DASHBOARD SEMANAL: [DATA]

**PILAR 1 (TRÁFEGO):**
| KPI | Meta Semana | Real | Delta | Status |
|-----|-----------|------|-------|--------|
| Volume de Leads | | | | 🟢🟡🔴 |
| CAC (últimos 7d) | | | | 🟢🟡🔴 |
| CTR principal canal | | | | 🟢🟡🔴 |
| ROAS | | | | 🟢🟡🔴 |

**PILAR 2 (ENGAJAMENTO):**
| KPI | Meta Semana | Real | Delta | Status |
|-----|-----------|------|-------|--------|
| Email Open Rate | | | | 🟢🟡🔴 |
| Taxa de Engajamento Social | | | | 🟢🟡🔴 |
| Conteúdo publicado | | | | 🟢🟡🔴 |

**PILAR 3 (CONVERSÃO):**
| KPI | Meta Semana | Real | Delta | Status |
|-----|-----------|------|-------|--------|
| MQL volume | | | | 🟢🟡🔴 |
| Reuniões realizadas | | | | 🟢🟡🔴 |
| Propostas enviadas | | | | 🟢🟡🔴 |
| Fechamentos | | | | 🟢🟡🔴 |

**PILAR 4 (RETENÇÃO):**
| KPI | Meta Semana | Real | Delta | Status |
|-----|-----------|------|-------|--------|
| Churn (semana) | | | | 🟢🟡🔴 |
| NPS (rolling) | | | | 🟢🟡🔴 |
| Clientes em risco (🔴) | | | | 🟢🟡🔴 |

**NORTH STAR METRIC:**
→ [Métrica principal] esta semana: [valor] vs meta: [valor]
→ Progresso acumulado do ciclo: [X]% da meta de 90d
```

---

### FASE 2: Análise dos Semáforos (5min)

```markdown
#### ITENS VERMELHOS 🔴 (Ação imediata):
1. [KPI]: [valor] vs [meta], [ação necessária]
2. [KPI]: [valor] vs [meta], [ação necessária]

#### ITENS AMARELOS 🟡 (Atenção próxima semana):
1. [KPI]: tendência de [direção], [monitorar]
2. [KPI]: [observação], [ação preventiva]

#### ITENS VERDES 🟢 (Oportunidade de escalar):
1. [KPI]: acima da meta, [escalar budget/esforço?]
```

---

### FASE 3: Decisões da Semana (10min)

```markdown
#### DECISÕES TOMADAS:

**ESCALAR** (dobrar aposta):
[ ] [Iniciativa]: de R$X para R$Y ou de [volume] para [volume]
Razão: [dados que justificam]

**MATAR** (parar agora):
[ ] [Iniciativa]: CPL = R$X vs benchmark R$Y, sem sinal após [N] dias
[ ] [Campanha]: CTR = [X]%, abaixo do threshold de [Y]%

**PIVOTAR** (mudar abordagem):
[ ] [Iniciativa]: hipótese A não funcionou → testar hipótese B
Novo approach: [descrição]

**MANTER** (continuar como está):
[ ] [Iniciativa]: dentro do range esperado, aguardar mais dados
```

---

### FASE 4: Prioridades da Próxima Semana (5min)

```markdown
#### TOP 3 PRIORIDADES:

1. 🔥 **[Prioridade 1]** | Responsável: [@agente] | Deadline: [dia]
   Meta: [resultado esperado]

2. ⚡ **[Prioridade 2]** | Responsável: [@agente] | Deadline: [dia]
   Meta: [resultado esperado]

3. 📊 **[Prioridade 3]** | Responsável: [@agente] | Deadline: [dia]
   Meta: [resultado esperado]

#### EXPERIMENTOS DA SEMANA:
→ [Experimento 1]: Hipótese, métrica de sucesso, prazo
→ [Experimento 2]: Hipótese, métrica de sucesso, prazo

#### ALERTAS E RISCOS:
⚠️ [Risco 1]: [ação preventiva]
⚠️ [Risco 2]: [ação preventiva]
```

---

### FASE 5: Síntese para o Time (2min)

```markdown
#### RESUMO EXECUTIVO DA SEMANA [DATA]:

**Headline:** [Uma frase descrevendo o status geral]

**O que funcionou:**
- [Resultado 1]
- [Resultado 2]

**O que não funcionou:**
- [Resultado negativo + aprendizado]

**Foco da semana seguinte:**
- [Top prioridade com responsável]

**Status do ciclo 90 dias:**
Semana [X]/13 | [X]% para a meta | Status: 🟢🟡🔴
```

---

## Outputs

- Dashboard semanal atualizado (todos os 4 pilares)
- Lista de decisões: escalar / matar / pivotar / manter
- Top 3 prioridades para a próxima semana
- Resumo executivo para o time
- Tracking de progresso do ciclo de 90 dias
