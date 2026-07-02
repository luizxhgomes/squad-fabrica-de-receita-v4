---
task: monitor-regressao
titulo: "Monitor de regressão: snapshot semanal contra baseline"
responsavel: "@fdr-quality-monitor"
responsavel_type: agent
atomic_layer: task
elicit: false
entrada: |
  - baseline: métricas de referência por fluxo (registradas no onboarding ou no início do ciclo)
  - snapshot_semanal: CAC por canal, conversão por etapa, show-rate, taxa de fechamento, churn, NRR
saida: |
  - relatorio_regressao: tabela métrica x baseline x atual x variação x severidade
  - atribuicao: causa provável de cada regressão (iniciativa, sazonalidade, externo)
  - acoes: ação recomendada por regressão com owner e prazo
checklist:
  - "[ ] Snapshot coletado das mesmas fontes do baseline (comparação justa)"
  - "[ ] Variação percentual calculada para todas as métricas monitoradas"
  - "[ ] Severidade classificada pelos thresholds (observação / alerta / escalação)"
  - "[ ] Causa provável atribuída (nunca deixar regressão sem hipótese)"
  - "[ ] Alertas enviados aos donos de fluxo; escalações enviadas ao Chief"
quality_gates: [QG-004]
usado_por_workflows: [wf-performance-sprint, wf-onboarding-cliente]
---
# Task: monitor-regressao

## Objetivo

Detectar regressões de performance ANTES que virem crise de receita. O monitor compara o snapshot
semanal contra o baseline e classifica cada desvio por severidade, com atribuição de causa e ação.
É a materialização operacional do princípio "Dados > Opinião".

## Métricas monitoradas (por fluxo estratégico)

| Fluxo | Métricas |
|---|---|
| Aquisição | CAC por canal, CPL, CTR, share de impressões |
| Engajamento e Conversão | CVR por etapa do funil, show-rate, taxa de fechamento |
| Retenção | churn mensal, NRR, adoção/uso |
| Inteligência | LTV:CAC, payback, margem de contribuição |

## Thresholds de severidade (sobre a variação vs baseline)

| Variação negativa | Severidade | Ação |
|---|---|---|
| 5% a 10% | Observação | Registrar; reavaliar no próximo snapshot |
| 10% a 20% | Alerta | Notificar o dono do fluxo com hipótese de causa em 24h |
| Acima de 20% | Escalação | Escalar ao Chief (@dener-lippert) com dossiê: métrica, série, causa provável, ação proposta |

Regras:
1. 2 semanas consecutivas em "observação" na mesma métrica sobem para "alerta".
2. Regressão simultânea em 2+ fluxos: tratar como sistêmica e escalar direto.
3. Melhoria acima de 20% também é investigada (pode ser erro de medição ou efeito não atribuído).

## Processo

1. Coletar snapshot das mesmas fontes do baseline (mesma janela, mesma definição de métrica).
2. Calcular variação percentual por métrica.
3. Classificar severidade pelos thresholds.
4. Atribuir causa provável: iniciativa do ciclo (qual?), sazonalidade, mudança externa (leilão,
   algoritmo, concorrência) ou instrumentação quebrada.
5. Emitir o relatório e disparar alertas/escalações.

## Formato de saída

```
MONITOR DE REGRESSÃO · semana [N] · [cliente]
| Métrica | Fluxo | Baseline | Atual | Variação | Severidade | Causa provável | Ação | Owner |
Resumo: [X] em observação, [Y] alertas, [Z] escalações.
```
