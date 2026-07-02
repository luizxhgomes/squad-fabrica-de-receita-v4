---
name: ciclo-90-dias
description: |
  Planejamento e gestão do ciclo de 90 dias dedicado a 1 trava. Recebe a
  trava confirmada, o KPI principal, o baseline e a meta, e devolve o
  plano de 5 fases (Identificar, Otimizar, Alinhar, Expandir, Recomeçar)
  com marcos, check-ins de progresso e entregáveis por fase.
inputs:
  - trava: "trava governante confirmada para o ciclo"
  - kpi_principal: "métrica de sucesso do ciclo"
  - baseline_kpi: "valor atual do KPI"
  - meta_kpi: "valor alvo ao final dos 90 dias"
outputs:
  - plano_5_fases: "5 fases com marcos, checklists e entregáveis"
  - dashboard_ciclo: "estrutura de acompanhamento semanal do KPI"
wraps:
  - tasks/90-day-cycle.md
applies_to_qg: QG-003
business_rule: BR-002
agent_origin: fabrica-de-receita-master
---

# Skill: Ciclo de 90 Dias

## Purpose

Cada ciclo de 90 dias é dedicado a 1 trava crítica (BR-002, blocking). Atacar mais de 1 restrição simultaneamente dilui foco e impede atribuição de resultado. Pré-requisito: trava identificada e confirmada pela regra 2 de 3 (skill `diagnostico-8-travas`). Esta skill monta o plano completo do ciclo com marcos, check-ins e entregáveis.

## Procedure (5 fases)

### Fase 1: IDENTIFICAR (dias 1 a 14)
**Objetivo:** diagnóstico científico da trava + baseline + plano do ciclo

Semana 1 (dias 1 a 7), Diagnóstico:
- Executar diagnóstico completo da trava selecionada
- Coletar todos os dados de baseline disponíveis
- Mapear o fluxo de receita atual na etapa da trava
- Identificar as 3 principais hipóteses de causa-raiz
- Benchmarking: onde estamos vs mercado?

Semana 2 (dias 8 a 14), Planejamento:
- Selecionar as hipóteses prioritárias por ICE Score
- Definir experimentos para validar cada hipótese
- Criar plano de ação detalhado para o ciclo
- Alinhar time na trava e no plano (Revenue Team kickoff)
- Documentar baseline oficial de todos os KPIs

**Entregável:** kickoff document do ciclo + KPI baseline registrado

### Fase 2: OTIMIZAR (dias 15 a 28)
**Objetivo:** quick wins + testes de hipóteses + primeiros dados

Semana 3 (dias 15 a 21), Quick Wins: implementar melhorias de baixo esforço e alto impacto, ativar os primeiros experimentos, coletar os primeiros dados.

Semana 4 (dias 22 a 28), Análise Inicial: analisar resultados, eliminar o que não funciona, dobrar aposta no que mostra sinal positivo, review do KPI principal.

**Check-in:** KPI principal vs baseline, está movendo?
- Se SIM → continuar e preparar para escalar
- Se NÃO → revisar hipóteses, possível pivô

### Fase 3: ALINHAR (dias 29 a 56)
**Objetivo:** convergência do time + escala do que funcionou + playbooks

Semanas 5 e 6 (dias 29 a 42), Convergência: consolidar os experimentos que funcionaram, descartar definitivamente o que não funcionou, criar/atualizar playbooks com os processos vencedores, treinar toda a equipe, alinhar Marketing, Vendas e CS.

Semanas 7 e 8 (dias 43 a 56), Escala Inicial: escalar as iniciativas validadas, monitorar o KPI principal (deve mostrar movimento claro), documentar aprendizados.

**Check-in:** KPI principal vs meta
- Progresso esperado: de 40 a 60% do caminho para a meta
- Se abaixo → acelerar, revisar recursos, escalar investimento

### Fase 4: EXPANDIR (dias 57 a 75)
**Objetivo:** escala plena + medir impacto + preparar transição

Semanas 9 e 10 (dias 57 a 70), Escala Plena: escalar todas as iniciativas validadas ao máximo de capacidade, otimizar continuamente com os dados semanais, medir o impacto consolidado, calcular o ROI parcial do ciclo.

Semana 11 (dias 71 a 75), Preparação de Transição: documentar resultados, definir o que vira padrão operacional, começar a análise prévia da próxima trava candidata.

**Check-in:** KPI principal vs meta
- Progresso esperado: de 80 a 100% do caminho para a meta

### Fase 5: RECOMEÇAR (dias 76 a 90)
**Objetivo:** consolidação + audit da trava resolvida + diagnóstico da próxima

Semanas 12 e 13 (dias 76 a 90): consolidar todos os resultados, atualizar playbooks com versão final, calcular o ROI final do ciclo (receita gerada dividida pelo investimento), apresentar relatório ao C-Level, executar audit para identificar a PRÓXIMA trava crítica, planejar o kickoff do próximo ciclo.

**Entregável:** closure report do ciclo + brief do próximo ciclo

## Dashboard do Ciclo

```markdown
## Ciclo [N], Trava: [NOME]
**Período:** [data início] → [data fim]
**KPI Principal:** [métrica]

| Semana | KPI Atual | Delta vs Baseline | Status |
|--------|-----------|-------------------|--------|
| Baseline | [valor] | - | - |
| Semana 2 | ? | ? | |
| Semana 4 | ? | ? | |
| Semana 6 | ? | ? | |
| Semana 8 | ? | ? | |
| Semana 10 | ? | ? | |
| Final (Semana 13) | ? | ? | |
**Meta:** [valor alvo]

**Status geral:** No Track | Atenção | Off Track
```

## Output Schema

```yaml
plano_5_fases:
  trava: T4
  kpi_principal: show-rate
  baseline: "55%"
  meta: "75%"
  fases:
    - fase: identificar
      dias: "1 a 14"
      entregavel: "kickoff document + baseline registrado"
    - fase: otimizar
      dias: "15 a 28"
      check_in: "KPI vs baseline movendo?"
    - fase: alinhar
      dias: "29 a 56"
      check_in: "40 a 60% do caminho para a meta"
    - fase: expandir
      dias: "57 a 75"
      check_in: "80 a 100% do caminho para a meta"
    - fase: recomecar
      dias: "76 a 90"
      entregavel: "closure report + brief do próximo ciclo"
dashboard_ciclo: "tabela semanal KPI vs baseline vs meta"
```

## Verdict Logic

- CICLO_APROVADO: 5 fases com marcos e entregáveis definidos + baseline e meta registrados + exatamente 1 trava no escopo (BR-002)
- REPLANEJAR: check-in de fase abaixo do esperado (fase 3 abaixo de 40% ou fase 4 abaixo de 80% do caminho); revisar hipóteses e recursos, possível pivô
- BLOQUEADO: mais de 1 trava no escopo do ciclo (viola BR-002) ou trava sem confirmação pela regra 2 de 3; voltar ao diagnóstico

## Usage

```
@fabrica-de-receita-master use skill ciclo-90-dias {trava}
```

Executar após a confirmação da trava governante e antes do kickoff com o cliente.

## Reference

- Task completa com checklists por fase e trigger `*ciclo-90d`: `tasks/90-day-cycle.md`
- Ritmo da fábrica e fases do ciclo: `data/fabrica-de-receita-kb.md`
- BR-002 (1 trava por ciclo, blocking): `squad.yaml` business_rules
- Handoff: trava do ciclo → skills de artefato (`anti-no-show` para T4, `objections-arsenal` para T3)
