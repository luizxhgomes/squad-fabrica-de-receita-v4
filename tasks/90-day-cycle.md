---
task: 90-Day Cycle
responsavel: "@fabrica-de-receita-master"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - trava_atual: Trava a ser trabalhada neste ciclo
  - numero_ciclo: Numero do ciclo (1, 2, 3)
  - kpi_principal: Metrica de sucesso do ciclo
  - baseline_kpi: Valor atual do KPI
  - meta_kpi: Valor alvo ao final dos 90 dias
  - data_inicio: Data de inicio do ciclo
Saida: |
  - kickoff_document: Ciclo kickoff document com plano completo
  - dashboard_semanal: Dashboard semanal de KPIs
  - closure_report: Ciclo closure report com ROI calculado
  - proximo_ciclo_brief: Brief do proximo ciclo com proxima trava candidata
Checklist:
  - "[ ] Fase IDENTIFICAR concluida (diagnostico + baseline + plano)"
  - "[ ] Fase OTIMIZAR concluida (quick wins + testes de hipoteses)"
  - "[ ] Fase ALINHAR concluida (convergencia + escala + playbooks)"
  - "[ ] Fase EXPANDIR concluida (escala plena + ROI medido)"
  - "[ ] Fase RECOMECAR concluida (consolidacao + proxima trava identificada)"
---

# Task: 90-day-cycle

**Agent:** @fabrica-de-receita-master (Fabio) | @growth-planner (Gabi)
**Trigger:** `*ciclo-90d`
**Objetivo:** Planejar, iniciar e gerenciar um ciclo completo de 90 dias focado em uma trava

---

## Pré-requisito

Trava crítica identificada e plano STEP criado (via `*trava-critica` e `*step-plan`).

```yaml
elicit: true
fields:
  - trava_atual: "Qual trava será trabalhada neste ciclo?"
  - numero_ciclo: "É o ciclo 1, 2, 3? (contexto de continuidade)"
  - kpi_principal: "Qual a métrica de sucesso do ciclo?"
  - baseline_kpi: "Qual o valor atual desse KPI?"
  - meta_kpi: "Qual o valor alvo ao final dos 90 dias?"
  - data_inicio: "Data de início do ciclo"
```

---

## Execução

### FASE 1: IDENTIFICAR (Dias 1-14)

**Objetivo:** Diagnóstico científico da trava + baseline + plano do ciclo

```markdown
#### SEMANA 1 (Dias 1-7): Diagnóstico
[ ] Executar diagnóstico completo da trava selecionada
[ ] Coletar todos os dados de baseline disponíveis
[ ] Mapear o fluxo de receita atual na etapa da trava
[ ] Identificar as 3 principais hipóteses de causa-raiz
[ ] Benchmarking: onde estamos vs mercado?

#### SEMANA 2 (Dias 8-14): Planejamento
[ ] Selecionar as hipóteses prioritárias por ICE Score
[ ] Definir experimentos para validar cada hipótese
[ ] Criar plano de ação detalhado para o ciclo
[ ] Alinhar time na trava e no plano (Revenue Team kickoff)
[ ] Documentar baseline oficial de todos os KPIs

**Entregável:** Ciclo kickoff document + KPI baseline registrado
```

---

### FASE 2: OTIMIZAR (Dias 15-28)

**Objetivo:** Quick wins + testes de hipóteses + primeiros dados

```markdown
#### SEMANA 3 (Dias 15-21): Quick Wins
[ ] Implementar melhorias de baixo esforço/alto impacto
[ ] Ativar primeiros experimentos das hipóteses prioritárias
[ ] Coletar primeiros dados dos testes

#### SEMANA 4 (Dias 22-28): Análise Inicial
[ ] Analisar resultados dos primeiros experimentos
[ ] Eliminar o que não está funcionando
[ ] Dobrar aposta no que está mostrando sinal positivo
[ ] Review do KPI principal: está respondendo?

**Check-in:** KPI principal vs baseline: está movendo?
- Se SIM → continuar e preparar para escalar
- Se NÃO → revisar hipóteses, possível pivô
```

---

### FASE 3: ALINHAR (Dias 29-56)

**Objetivo:** Convergência do time + escala do que funcionou + playbooks

```markdown
#### SEMANAS 5-6 (Dias 29-42): Convergência
[ ] Consolidar os experimentos que funcionaram
[ ] Descartar definitivamente o que não funcionou
[ ] Criar/atualizar playbooks com os processos que ganharam
[ ] Treinar toda equipe nas novas abordagens validadas
[ ] Alinhar Marketing, Vendas e CS nos novos processos

#### SEMANAS 7-8 (Dias 43-56): Escala Inicial
[ ] Escalar as iniciativas validadas
[ ] Monitorar KPI principal: deve mostrar movimento claro
[ ] Documentar todos os aprendizados até aqui

**Check-in:** KPI principal vs meta
- Progresso esperado: 40-60% do caminho para a meta
- Se abaixo → acelerar, revisar recursos, escalar investimento
```

---

### FASE 4: EXPANDIR (Dias 57-75)

**Objetivo:** Escala plena + medir impacto + preparar transição

```markdown
#### SEMANAS 9-10 (Dias 57-70): Escala Plena
[ ] Escalar todas as iniciativas validadas ao máximo de capacidade
[ ] Otimizar continuamente baseado nos dados semanais
[ ] Medir impacto consolidado no KPI principal
[ ] Calcular ROI real do ciclo até o momento

#### SEMANA 11 (Dias 71-75): Preparação de Transição
[ ] Documentar todos os resultados alcançados
[ ] Identificar o que deve ser mantido como padrão operacional
[ ] Começar análise prévia da próxima trava candidata

**Check-in:** KPI principal vs meta
- Progresso esperado: 80-100% do caminho para a meta
```

---

### FASE 5: RECOMEÇAR (Dias 76-90)

**Objetivo:** Consolidação + audit da trava resolvida + diagnóstico da próxima

```markdown
#### SEMANAS 12-13 (Dias 76-90): Consolidação e Próximo Ciclo
[ ] Consolidar todos os resultados do ciclo
[ ] Atualizar todos os playbooks com versão final
[ ] Calcular ROI final do ciclo (R$ receita gerada / investimento)
[ ] Apresentar relatório de resultados ao C-Level
[ ] Executar audit para identificar a PRÓXIMA trava crítica
[ ] Planejar kickoff do Ciclo 2

**Entregável:** Ciclo closure report + Ciclo 2 brief
```

---

## Dashboard do Ciclo

```markdown
## Ciclo [N]: Trava: [NOME]
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
| Final (Sem 13) | ? | ? | |
**Meta:** [valor alvo]

**Status geral:** 🟢 No Track | 🟡 Atenção | 🔴 Off Track
```

---

## Outputs

- Ciclo kickoff document com plano completo
- Dashboard semanal de KPIs
- Ciclo closure report com ROI calculado
- Brief do próximo ciclo com próxima trava candidata
