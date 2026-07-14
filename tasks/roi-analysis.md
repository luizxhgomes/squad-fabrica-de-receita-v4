---
task: ROI Analysis: ROI-first Style
responsavel: "@roi-analyst"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - periodo: Período de análise
  - canais: Canais de marketing ativos
  - investimento_total: Budget de marketing do período
  - receita_atribuida: Receita atribuível ao marketing
Saida: |
  - roi_report: Relatório de ROI por canal
  - ltv_cac_ratio: Relação LTV:CAC atual
  - attribution_analysis: Análise de atribuição
  - recommendations: Realocação de budget recomendada
Checklist:
  - "[ ] ROI calculado por canal com dados reais"
  - "[ ] LTV:CAC ratio analisado e classificado"
  - "[ ] Payback period calculado"
  - "[ ] Recomendacoes de realocacao de budget documentadas"
elicit: true
---

# *roi-review: Análise de ROI ao Estilo ROI-first

Revisão científica de ROI inspirada no podcast ROI-first da a assessoria
no padrão ROI-first, com o rigor do Cientista de Marketing. Sem achismos: só dados.

## Processo de Coleta de Dados

```
? Período de análise:
? Budget total de marketing no período: R$
? Quais canais estão ativos?
  □ Meta Ads (Facebook/Instagram)
  □ Google Ads (Search/Display/YouTube)
  □ TikTok Ads
  □ Email Marketing
  □ SEO/Orgânico
  □ Outbound/SDR
  □ Outros: ___

? Para cada canal, você tem: Investimento + Receita Atribuída?
? Qual o modelo de atribuição atual?
? Você tem dados de LTV e Churn?
```

## Framework ROI-first

### 1. ROI Básico por Canal

```
Para cada canal:
ROI = (Receita Atribuída - Investimento) / Investimento × 100%
ROAS = Receita Atribuída / Investimento
CAC = Investimento / Número de Clientes Adquiridos
```

### 2. LTV:CAC Analysis: O Termômetro do Negócio

```
LTV = Ticket Médio × Frequência de Compra × Tempo de Vida do Cliente
LTV:CAC Ratio:
  < 1:1 → Emergência: cada cliente custa mais do que vale
  1:1 → 2:1 → Problema: não há margem para crescimento
  3:1 → Saudável: modelo viável e escalável
  5:1+ → Excelente: muito espaço para crescer
  10:1+ → Repensar: possível subinvestimento em aquisição
```

### 3. Payback Period

```
Payback = CAC / (MRR por Cliente × Margem Bruta %)
< 6 meses: Excelente (escale agressivamente)
6-12 meses: Saudável
12-18 meses: Atenção
> 18 meses: Problema
```

### 4. ROI Incremental (Como os melhores calculam)

```
Problema do ROAS simples: atribui receita que aconteceria de qualquer forma.

ROI Real:
1. Identifique o baseline (o que venderia SEM o marketing)
2. Calcule o incremento (Receita COM marketing - Receita SEM)
3. ROI Real = (Incremento - Investimento) / Investimento × 100%

Para medir: Use holdout groups ou períodos de controle.
```

## Output: ROI-first Report

```markdown
# ROI-first Report: [Período]
**Gerado por:** @roi-analyst (Data)
**Data:** [data]

## Executive Summary
- Budget Total: R$ [X]
- Receita Atribuída: R$ [X]
- ROI Geral: [X]%
- LTV:CAC Ratio: [X]:1
- Payback Period: [X] meses

## Performance por Canal
| Canal | Investimento | Receita | ROI | ROAS | CAC |
|-------|-------------|---------|-----|------|-----|
| Meta Ads | R$ | R$ | % | x | R$ |
| Google | R$ | R$ | % | x | R$ |
| Email | R$ | R$ | % | ∞ | R$ |
| **TOTAL** | **R$** | **R$** | **%** | **x** | **R$** |

## Veredicto ROI-first (ao estilo do podcast)
[Análise honesta e direta do que está funcionando e o que precisa mudar]

## Realocação de Budget Recomendada
- Aumentar investimento em: [Canal A]: por quê: [ROI superior]
- Reduzir investimento em: [Canal B]: por quê: [ROI abaixo do mínimo]
- Testar: [Canal C]: hipótese: [X]

## Próximas Ações (Priorizado por ROI Potencial)
1. [Ação com maior impacto]
2. [Segunda ação]
3. [Terceira ação]
```