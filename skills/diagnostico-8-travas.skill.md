---
name: diagnostico-8-travas
description: |
  Diagnóstico científico das 8 travas do sistema de receita. Recebe as
  métricas do funil por etapa, pontua cada trava de 0 a 10 contra os
  thresholds canônicos, cruza com os 3 métodos de diagnóstico e aplica
  os 3 testes de confirmação (Acúmulo, Ociosidade, Impulso) com a
  regra 2 de 3 para declarar a trava governante.
inputs:
  - metricas_funil: "métricas por etapa (CAC, LTV, conversão por etapa, CTR, CVR de LP, MQL para SQL, show-rate, fechamento, churn, NPS)"
outputs:
  - scores_travas: "score de 0 a 10 por trava (T1 a T8)"
  - trava_governante: "trava confirmada com justificativa e artefato de solução"
  - resultado_testes: "resultado dos 3 testes com a regra 2 de 3"
wraps:
  - data/8-travas.md
applies_to_qg: QG-002
business_rule: BR-003
agent_origin: diagnosticador
---

# Skill: Diagnóstico das 8 Travas

## Purpose

Toda empresa opera um Sistema de Receita com 4 macrofases: Aquisição, Engajamento, Monetização, Retenção. O resultado final (Throughput) é limitado por 1 única restrição ativa por vez: a trava. Melhorar qualquer coisa que NÃO seja a restrição ativa é otimização local, ou seja, desperdício. Esta skill identifica matematicamente qual das 8 travas governa o sistema, com confirmação pela regra 2 de 3 (BR-003, blocking).

## Procedure

### Passo 1: Coletar as métricas do funil por etapa
Conjunto mínimo: CAC, LTV, conversão por etapa, payback, CTR, CVR de LP, MQL para SQL, show-rate, taxa de fechamento, churn, NPS. Registrar a defasagem dos dados (relatórios com mais de 30 dias contam contra a T1).

### Passo 2: Triagem da T1 (Cegueira, transversal)
- Menos de 4 métricas do funil monitoradas semanalmente OU defasagem superior a 30 dias → T1 ativa.
- Sem visibilidade, nenhuma das outras travas pode ser diagnosticada com segurança. Por isso a T1 é a primeira eliminada no diagnóstico (artefato: Dashboard de Decisão).

### Passo 3: Pontuar cada trava (score 0-10) contra os thresholds canônicos

| Trava | Sintomas mensuráveis (thresholds) |
|-------|-----------------------------------|
| T1 Cegueira | menos de 4 métricas monitoradas semanalmente; defasagem > 30 dias; decisão por intuição |
| T2 Retenção (Infidelidade) | churn mensal > 3% (recorrência); recompra < 20% em 90 dias; LTV/CAC < 3; NPS < 50 |
| T3 Decisão (Persuasão) | fechamento < 20% das reuniões; ciclo alongando; mesmas objeções em > 50% das perdas |
| T4 Compromisso (No-Show) | no-show > 30%; show-rate < 70%; > 3 dias úteis entre agendamento e reunião sem toque |
| T5 Qualificação (Ruído) | < 40% dos leads no ICP; MQL para SQL < 30%; lead frio em mais da metade das reuniões |
| T6 Interesse (Rejeição) | CVR de LP < 2% (captura) ou < 1% (agendamento direto); rejeição > 70% |
| T7 Atenção (Irrelevância) | CTR < 1%; hook rate < 25%; frequência alta com resposta em queda |
| T8 Exposição (Invisibilidade) | alcance < 10% do mercado endereçável; share of voice marginal; verba subdimensionada |

Rubrica de score por trava:
- 0 a 2: nenhum sintoma cruzou o threshold (trava saudável)
- 3 a 5: 1 sintoma no limite (atenção)
- 6 a 8: 2 sintomas confirmados (trava candidata)
- 9 a 10: todos os sintomas confirmados com desvio grave (candidata forte)

### Passo 4: Cruzar com os 3 métodos de diagnóstico científico

1. **Acúmulo de Fluxo:** onde o fluxo se acumula sem conversão está o gargalo.
   Exemplo: 10.000 visitantes → 500 leads → 400 MQLs → 50 SQLs → 10 clientes. Acúmulo maior em MQL → SQL = trava de Qualificação ou Decisão.
2. **Comparação de Benchmark:** qualquer métrica significativamente abaixo do benchmark = trava identificada (usar skill `benchmark-funil`).
3. **Impulso Controlado:** aumentar artificialmente o volume numa etapa e medir se a etapa seguinte responde proporcionalmente. Se não responde, a próxima etapa é a trava.

### Passo 5: Aplicar os 3 testes de confirmação (regra 2 de 3, BR-003)

Na trava candidata de maior score, aplicar os 3 testes. Se 2 de 3 derem positivo, a trava está confirmada:

| Teste | Pergunta | Se SIM, a trava está aqui |
|-------|----------|---------------------------|
| **Acúmulo** | Tem fila ou inventário ANTES dessa etapa? | O gargalo está à frente |
| **Ociosidade** | A etapa SEGUINTE tem capacidade ociosa? | Não está recebendo fluxo |
| **Impulso** | Se aumentar de 20 a 30% a entrada, trava AQUI? | Confirma o gargalo |

### Passo 6: Desempate pela leitura bottom-up do funil

Em caso de empate entre candidatas, priorizar de trás para frente (lucro imediato e dinheiro já na mesa):
1. **Lucro imediato:** T2 Retenção + T3 Decisão
2. **Eficiência de meio:** T4 Compromisso + T5 Qualificação
3. **Escala de aquisição:** T6 Interesse + T7 Atenção
4. **Expansão de insumo:** T8 Exposição (T1 é transversal e sempre a primeira eliminada)

> **Regra de ouro do funil:** não adianta abrir a torneira da mídia com o balde furado.

### Passo 7: Declarar a subordinação
- Trava T5: marketing para de gerar volume e foca em qualidade de lead
- Trava T4: comercial para de prospectar e foca em show-rate
- Trava T2: aquisição é pausada e o foco vai para CS e reativação

## Output Schema

```yaml
scores_travas:
  T1_cegueira: 0-10
  T2_retencao: 0-10
  T3_decisao: 0-10
  T4_compromisso: 0-10
  T5_qualificacao: 0-10
  T6_interesse: 0-10
  T7_atencao: 0-10
  T8_exposicao: 0-10
trava_governante:
  id: T4
  nome: Compromisso
  apelido: No-Show
  artefato_solucao: Kit Anti-No-Show
  justificativa: "score 9/10 + 3 de 3 testes positivos"
resultado_testes:
  acumulo: positivo | negativo
  ociosidade: positivo | negativo
  impulso: positivo | negativo
  regra_2_de_3: confirmada | nao_confirmada
proxima_acao: "1 trava por ciclo de 90 dias (BR-002)"
```

## Verdict Logic

- CONFIRMADA: trava candidata com score 6 ou mais + 2 de 3 testes positivos (BR-003, blocking)
- INCONCLUSIVO: nenhuma trava com 2 de 3 testes positivos; se a causa é falta de dados, a trava é a T1 Cegueira (aplicar Dashboard de Decisão antes de rediagnosticar)
- EMPATE: 2 ou mais travas confirmadas; aplicar a leitura bottom-up e escolher a mais próxima do caixa. NUNCA atacar 2 travas no mesmo ciclo (BR-002)

## Usage

```
@diagnosticador use skill diagnostico-8-travas {cliente}
```

Executar no início de todo engajamento DR e ao final de cada ciclo de 90 dias (a trava eliminada revela a próxima restrição ativa).

## Reference

- Taxonomia canônica das 8 travas, thresholds e 3 testes: `data/8-travas.md`
- 3 métodos de diagnóstico científico: `data/fabrica-de-receita-kb.md`
- BR-003 (Diagnóstico 2 de 3, blocking) e BR-002 (1 trava por ciclo): `squad.yaml` business_rules
- Handoff: trava confirmada → skill `ciclo-90-dias`; gaps de benchmark → skill `benchmark-funil`
