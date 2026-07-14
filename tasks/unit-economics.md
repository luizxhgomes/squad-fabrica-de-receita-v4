---
task: unit-economics
titulo: "Unit Economics: cálculo canônico de LTV, CAC e payback"
responsavel: "@roi-analyst"
responsavel_type: agent
atomic_layer: task
elicit: true
entrada: |
  - ticket_medio: valor médio por venda (R$)
  - margem_contribuicao: percentual de margem após custos variáveis
  - tempo_de_vida: tempo médio de permanência do cliente (meses)
  - investimento_marketing_vendas: gasto total do período (mídia + time + ferramentas)
  - novos_clientes_periodo: quantidade de clientes adquiridos no período
  - ciclo_de_caixa: prazo médio de recebimento do cliente
saida: |
  - painel_unit_economics: LTV, CAC full-loaded, razão LTV:CAC, payback e margem de contribuição com interpretação
  - recomendacao: veredito (saudável / atenção / crítico) com 1 ação prioritária
checklist:
  - "[ ] LTV calculado (ticket médio x margem x tempo de vida)"
  - "[ ] CAC full-loaded calculado (mídia + time + ferramentas, dividido por novos clientes)"
  - "[ ] Razão LTV:CAC comparada aos benchmarks (mínimo 3:1, excelência 5:1)"
  - "[ ] Payback de CAC comparado ao ciclo de caixa"
  - "[ ] Veredito e ação prioritária registrados"
quality_gates: [QG-001, QG-004]
usado_por_workflows: [wf-onboarding-cliente, wf-roi-first-review]
---
# Task: unit-economics

## Objetivo

Estabelecer a matemática do negócio antes de qualquer decisão de investimento. "A matemática não
mente": se LTV dividido por CAC não fecha, o resto é vaidade. Esta task produz o painel canônico
de unit economics que alimenta o QG-001 (baseline) e o QG-004 (medição contra baseline).

## Processo

### Passo 1: Coleta (elicitar do cliente ou do Dashboard de Decisão)

Solicitar os 6 campos de entrada. Regra: NUNCA aceitar "não sei" sem registrar a lacuna; dado
ausente vira pendência de instrumentação (T1 Cegueira), não suposição.

### Passo 2: Cálculo canônico

```
LTV = ticket médio x margem de contribuição x tempo de vida (meses)
CAC = (mídia + time de marketing/vendas + ferramentas) / novos clientes do período
LTV:CAC = LTV / CAC
Payback = CAC / (ticket médio x margem de contribuição) [em meses]
```

Regras de rigor:
1. CAC é sempre **full-loaded**: salário do time comercial e custo de ferramentas entram. CAC só
   de mídia é autoengano.
2. LTV usa margem de contribuição, nunca receita bruta.
3. Períodos consistentes: mesmo intervalo para investimento e novos clientes.

### Passo 3: Interpretação contra benchmarks

| Métrica | Crítico | Saudável | Excelência |
|---|---|---|---|
| LTV:CAC | abaixo de 3:1 | 3:1 a 5:1 | acima de 5:1 |
| Payback | acima do ciclo de caixa | dentro do ciclo | metade do ciclo |

Leituras derivadas (referência: data/fabrica-de-receita-kb.md):
- LTV:CAC abaixo de 3:1 com payback longo: trava provável em Retenção (T2) ou Decisão (T3),
  não em tráfego. Não escalar mídia.
- LTV:CAC acima de 5:1 com crescimento estagnado: subinvestimento em aquisição (T7/T8);
  há espaço para escalar.
- CAC subindo com conversão estável: fadiga de criativo ou leilão mais caro; revisar Pack de
  Criativos antes de aumentar verba.

### Passo 4: Veredito e recomendação

Emitir 1 dos 3 vereditos (saudável / atenção / crítico) + 1 ação prioritária única, sempre
subordinada à trava ativa do ciclo (BR-002: 1 trava por vez).

## Formato de saída

```
UNIT ECONOMICS: [cliente] · [período]
LTV: R$ [X] | CAC: R$ [X] | LTV:CAC = [X]:1 | Payback: [X] meses
Veredito: [saudável/atenção/crítico]
Leitura: [2 frases: o que a matemática diz]
Ação prioritária: [1 ação] | Owner: [@agent] | Prazo: [dias]
```
