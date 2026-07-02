# Template: ROI Dashboard

> Dashboard mensal de ROI: para ser preenchido pelo @roi-analyst e apresentado no Revenue Board.
> Foco: transformar dados em decisões de alocação de recursos.

---

# ROI Dashboard: [MÊS/ANO]

**Período:** [Data início] → [Data fim]
**Preparado por:** [@roi-analyst]
**Revisado por:** [@orchestrator]
**Status do Ciclo 90d:** Semana [X]/13

---

## 1. North Star Metric

```
[NOME DA NORTH STAR METRIC]

Meta do Mês: [valor]
Real do Mês: [valor]
Variação: [+/-X%]
Status: 🟢 Acima da meta | 🟡 Dentro do range | 🔴 Abaixo da meta

Acumulado do Ciclo 90d: [X]% da meta de 90 dias
```

---

## 2. Resumo de ROI por Pilar

| Pilar V4 | Investimento | Receita Gerada | ROI | Status |
|---------|-------------|----------------|-----|--------|
| Tráfego | R$ | R$ | X:1 | 🟢🟡🔴 |
| Engajamento | R$ | R$ | X:1 | 🟢🟡🔴 |
| Conversão | R$ | R$ | X:1 | 🟢🟡🔴 |
| Retenção | R$ | R$ | X:1 | 🟢🟡🔴 |
| **TOTAL** | **R$** | **R$** | **X:1** | |

**Interpretação:** ROI > 3:1 = Saudável | 2-3:1 = Atenção | < 2:1 = Crítico

---

## 3. KPIs por Pilar

### Pilar 1: TRÁFEGO

| KPI | Meta | Real | Δ Mês Anterior | Status |
|-----|------|------|----------------|--------|
| Volume de Leads | | | | 🟢🟡🔴 |
| CAC Médio | R$ | R$ | | 🟢🟡🔴 |
| CPC Médio | R$ | R$ | | 🟢🟡🔴 |
| ROAS | | | | 🟢🟡🔴 |
| % Leads Qualificados | | | | 🟢🟡🔴 |

**Melhor Canal do Mês:** [canal] com CAC = R$[X]
**Pior Canal do Mês:** [canal] com CAC = R$[X]: decisão: [matar/pivotar/aguardar]

---

### Pilar 2: ENGAJAMENTO

| KPI | Meta | Real | Δ Mês Anterior | Status |
|-----|------|------|----------------|--------|
| Email Open Rate | | | | 🟢🟡🔴 |
| Email Click Rate | | | | 🟢🟡🔴 |
| Taxa Engajamento Social | | | | 🟢🟡🔴 |
| Tempo médio no site | | | | 🟢🟡🔴 |
| Leads nutridos no mês | | | | 🟢🟡🔴 |

---

### Pilar 3: CONVERSÃO

| KPI | Meta | Real | Δ Mês Anterior | Status |
|-----|------|------|----------------|--------|
| Taxa de Conversão (lead→cliente) | | | | 🟢🟡🔴 |
| Taxa de Fechamento | | | | 🟢🟡🔴 |
| CPA (Custo por Aquisição) | R$ | R$ | | 🟢🟡🔴 |
| Ciclo médio de vendas | dias | dias | | 🟢🟡🔴 |
| Novos clientes no mês | | | | 🟢🟡🔴 |
| Receita nova | R$ | R$ | | 🟢🟡🔴 |

---

### Pilar 4: RETENÇÃO

| KPI | Meta | Real | Δ Mês Anterior | Status |
|-----|------|------|----------------|--------|
| Churn Rate Mensal | | | | 🟢🟡🔴 |
| LTV Médio | R$ | R$ | | 🟢🟡🔴 |
| LTV:CAC Ratio | | | | 🟢🟡🔴 |
| NPS | | | | 🟢🟡🔴 |
| Receita de Expansão | R$ | R$ | | 🟢🟡🔴 |
| Clientes Promotores (NPS 9-10) | % | % | | 🟢🟡🔴 |
| Clientes em Risco (🔴 health score) | N | N | | 🟢🟡🔴 |

---

## 4. Análise de Coesão do Funil

```
FUNIL DO MÊS:
[X.000 impressões] ──(CTR X%)──> [X.000 visitas]
                                       │
                               (CVR X%)↓
                               [X leads]
                                       │
                           (MQL rate X%)↓
                               [X MQLs]
                                       │
                       (Fechamento X%)↓
                               [X clientes]
                                       │
                           (Churn X%)↓
                               [X retidos]

CAC = R$[X] | LTV = R$[X] | LTV:CAC = X:1
```

---

## 5. Top 3 Decisões do Mês

```
1. ✅ ESCALAR: [Iniciativa]: ROI confirmado X:1 → dobrar budget
   Ação: De R$X para R$Y a partir de [data]

2. ❌ MATAR: [Iniciativa]: [X] dias sem sinal após [N] impressões
   Liberado: R$Z/mês → realocar para [canal/iniciativa]

3. ⚡ PIVOTAR: [Iniciativa]: Hipótese A falhou → Testar hipótese B
   Nova abordagem: [descrição]
```

---

## 6. Projeção para Próximo Mês

| Métrica | Mês Atual | Projeção Próximo Mês | Upside se Otimizar |
|---------|----------|--------------------|--------------------|
| Novos Clientes | X | X (+Y%) | X (+Y% se escalar [canal]) |
| Receita Nova | R$X | R$X | R$X |
| CAC | R$X | R$X | R$X (com melhoria em [tática]) |

---

## 7. Alinhamento com Ciclo 90 Dias

**Trava atual:** [NOME DA TRAVA]
**KPI do ciclo:** [métrica] de [baseline] → [meta]
**Progresso no mês:** [X]% → cumprido [Y]% da meta do ciclo

**Em risco:** [Sim/Não]: [ação corretiva se sim]

---

## 8. Decisão de Budget Próximo Mês

| Canal/Iniciativa | Budget Atual | Budget Proposto | Justificativa |
|-----------------|-------------|----------------|---------------|
| [Canal 1] | R$ | R$ (+X%) | [ROI confirmado] |
| [Canal 2] | R$ | R$ (-X%) | [ROI ruim, realocar] |
| [Iniciativa nova] | 0 | [valor em reais] | [Hipótese a testar] |
| **TOTAL** | **R$** | **R$** | |
