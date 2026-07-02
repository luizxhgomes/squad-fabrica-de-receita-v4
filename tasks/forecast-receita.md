---
task: forecast-receita
titulo: "Forecast de receita: projeção de 90 dias em 3 cenários"
responsavel: "@growth-planner"
responsavel_type: agent
atomic_layer: task
elicit: true
entrada: |
  - baseline: faturamento mensal atual e métricas do funil por etapa
  - trava_ativa: trava confirmada no diagnóstico (T1 a T8)
  - plano_do_ciclo: iniciativas do ciclo de 90 dias com datas
  - historico: últimos 12 meses de receita (quando disponível)
saida: |
  - forecast_90d: projeção mensal em 3 cenários (conservador, base, agressivo) no templates/forecast-template.md
  - analise_sensibilidade: impacto da trava ativa em cada cenário
  - riscos: 3 principais riscos com gatilhos de revisão
checklist:
  - "[ ] Baseline validado com dados reais (nunca estimativa sobre estimativa)"
  - "[ ] Premissas explícitas por cenário (o que precisa ser verdade)"
  - "[ ] Sensibilidade da trava ativa calculada (destravada vs não destravada)"
  - "[ ] Efeito parcial aplicado (mês 1: 50%, mês 2: 75%, mês 3: 100% do ganho)"
  - "[ ] Riscos e gatilhos de revisão registrados"
  - "[ ] templates/forecast-template.md preenchido"
quality_gates: [QG-002]
usado_por_workflows: [wf-diagnostico-completo]
---
# Task: forecast-receita

## Objetivo

Transformar o diagnóstico em expectativa numérica auditável. O forecast existe para governar
decisão de investimento (quanto esperar, quando revisar), não para agradar: cenário otimista sem
premissa explícita é ficção.

## Processo

### Passo 1: Baseline

Partir do faturamento atual e do funil medido (não declarado). Se o baseline não existe, parar e
acionar `tasks/unit-economics.md` e o Dashboard de Decisão (T1) antes.

### Passo 2: Premissas por cenário

| Cenário | Regra de construção |
|---|---|
| Conservador | Trava NÃO destravada no ciclo; apenas crescimento orgânico histórico |
| Base | Trava destravada com resultado mediano dos benchmarks da KB |
| Agressivo | Trava destravada no teto do benchmark + efeito composto no funil |

Cada cenário lista explicitamente: o que precisa ser verdade, até quando, e quem é o owner.

### Passo 3: Sensibilidade pela trava ativa

Calcular o delta de receita entre "trava destravada" e "não destravada" usando os thresholds de
`data/8-travas.md`. Exemplo de raciocínio: se a trava é T4 (Compromisso) e o no-show cai de 40%
para 15%, quantas reuniões a mais viram receita com a taxa de fechamento atual?

Aplicar efeito parcial: mês 1 captura 50% do ganho, mês 2 captura 75%, mês 3 captura 100%.

### Passo 4: Riscos e gatilhos

3 riscos principais, cada um com gatilho objetivo de revisão do forecast (ex.: "se CPL subir
mais de 20% por 2 semanas, revisar cenário base").

### Passo 5: Preencher o template

Saída obrigatória em `templates/forecast-template.md`, com as 3 curvas mensais e o comparativo
contra a meta declarada do cliente.

## Regras

1. Forecast é revisado no ritual semanal (`wf-performance-sprint`), nunca esquecido no drive.
2. Desvio acima de 20% contra o cenário base por 2 semanas: escalar ao Chief.
3. Número sem premissa não entra no documento.
