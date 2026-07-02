---
task: STEP Framework
responsavel: "@fabrica-de-receita-master"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - trava_critica: Trava a ser atacada (ex: DECISAO, RETENCAO)
  - contexto_empresa: Resumo do diagnostico/contexto
  - recursos_disponiveis: Time, budget, ferramentas disponiveis
  - prazo: Prazo do ciclo (padrao: 90 dias)
Saida: |
  - clarity_report: Clarity Report com diagnostico e estrategia (S)
  - infrastructure_checklist: Infrastructure Checklist e Resource Plan (T)
  - execution_log: Execution Log com sprints detalhadas (E)
  - performance_dashboard: Dashboard de KPIs e rituais de performance (P)
Checklist:
  - "[ ] SABER: causa-raiz identificada e estrategia definida"
  - "[ ] TER: ferramentas, dados, equipe e budget mapeados"
  - "[ ] EXECUTAR: sprints semanais detalhados com responsaveis"
  - "[ ] PERFORMAR: dashboard de KPIs e decisoes pre-definidas"
---

# Task: step-framework

**Agent:** @fabrica-de-receita-master (Fabio)
**Trigger:** `*step-plan`
**Objetivo:** Criar plano STEP completo para destravar a trava crítica identificada

---

## Pré-requisito

Trava crítica identificada (via `*trava-critica` ou informada diretamente).

```yaml
elicit: true
fields:
  - trava_critica: "Qual trava será atacada? (ex: DECISÃO, RETENÇÃO)"
  - contexto_empresa: "Resumo do diagnóstico/contexto"
  - recursos_disponiveis: "Time, budget, ferramentas disponíveis"
  - prazo: "Qual o prazo do ciclo? (padrão: 90 dias)"
```

---

## Execução

### S: SABER (Diagnóstico e Estratégia)

**Objetivo:** Clareza total sobre o problema e a estratégia de solução

```markdown
#### O QUE ESTÁ ACONTECENDO:
[Descrição precisa do problema com dados]

#### POR QUÊ ESTÁ ACONTECENDO (causa-raiz):
[Análise causal, não de sintomas]
Usar o método dos 5 Porquês se necessário:
- Por que [sintoma]? → [causa 1]
- Por que [causa 1]? → [causa 2]
- Por que [causa 2]? → [causa 3]
...
- Causa-raiz: [causa final]

#### ESTRATÉGIA PARA DESTRAVAR:
[Abordagem escolhida com justificativa]

#### KPIs DO CICLO:
- Métrica principal: [KPI] de [baseline] → [meta em 90 dias]
- Métricas de apoio: [KPIs secundários para monitorar]

#### ENTREGÁVEL SABER:
Clarity Report: diagnóstico + estratégia posicionada
```

---

### T: TER (Recursos e Infraestrutura)

**Objetivo:** Garantir que tudo necessário existe antes de executar

```markdown
#### FERRAMENTAS NECESSÁRIAS:
| Ferramenta | Existe? | Ação Necessária |
|-----------|---------|-----------------|
| [ferramenta 1] | Sim/Não | [ação] |
| [ferramenta 2] | Sim/Não | [ação] |

#### DADOS E TRACKING:
| Dado | Disponível? | Como Obter |
|------|-------------|------------|
| [dado 1] | Sim/Não | [fonte] |

#### GAPS DE EQUIPE:
| Competência | Temos? | Solução |
|------------|--------|---------|
| [skill 1] | Sim/Não | [contratar/treinar/terceirizar] |

#### BUDGET NECESSÁRIO:
| Item | Investimento | Justificativa ROI |
|------|-------------|-------------------|
| [item 1] | R$ [X] | [retorno esperado] |

#### PLAYBOOKS E PROCESSOS:
[ ] Playbook de [processo relevante] criado/atualizado
[ ] Documentação da nova abordagem
[ ] Alinhamento de equipe realizado

#### ENTREGÁVEL TER:
Infrastructure Checklist + Resource Plan aprovado
```

---

### E: EXECUTAR (Implementação Operacional)

**Objetivo:** Plano de execução detalhado e acionável

```markdown
#### SPRINT DE EXECUÇÃO:

SEMANA 1-2 (Quick Wins):
[ ] [Ação imediata 1]: Responsável: [quem]: Prazo: [data]
[ ] [Ação imediata 2]: Responsável: [quem]: Prazo: [data]
[ ] [Ação imediata 3]: Responsável: [quem]: Prazo: [data]

SEMANA 3-6 (Implementação Principal):
[ ] [Ação principal 1]: Responsável: [quem]: Prazo: [data]
[ ] [Ação principal 2]: Responsável: [quem]: Prazo: [data]

SEMANA 7-10 (Escala):
[ ] [Ação de escala 1]: Responsável: [quem]: Prazo: [data]
[ ] [Ação de escala 2]: Responsável: [quem]: Prazo: [data]

SEMANA 11-13 (Consolidação):
[ ] [Consolidação 1]: Responsável: [quem]: Prazo: [data]
[ ] Preparação para próximo ciclo

#### AUTOMAÇÕES A ATIVAR:
[ ] [Automação 1]: Plataforma: [tool]
[ ] [Automação 2]: Plataforma: [tool]

#### ENTREGÁVEL EXECUTAR:
Execution Log + Progress Tracker atualizado semanalmente
```

---

### P: PERFORMAR (Medição e Otimização)

**Objetivo:** Sistema de medição e loop de aprendizado

```markdown
#### DASHBOARD DO CICLO:

| KPI | Baseline | Meta 30d | Meta 60d | Meta 90d | Frequência |
|-----|---------|---------|---------|---------|-----------|
| [KPI principal] | [atual] | [meta] | [meta] | [meta] | Semanal |
| [KPI apoio 1] | [atual] | [meta] | [meta] | [meta] | Semanal |

#### RITUAIS DE PERFORMANCE:
- Daily: [O que monitorar diariamente]
- Semanal: Review de [KPI]: responsável: [quem]
- Mensal: Revenue Board: comparar vs baseline

#### DECISÕES PRÉ-DEFINIDAS:
- Se [KPI] < [threshold] após 30 dias → [ação corretiva]
- Se [KPI] > [meta] após 30 dias → [escalar essa iniciativa]
- Se [hipótese] não se confirmar → [pivotar para alternativa B]

#### ENTREGÁVEL PERFORMAR:
Performance Report + Input para o próximo ciclo
```

---

## Output Final

Plano STEP completo e acionável com:
- Clarity Report (S)
- Infrastructure Checklist + Resource Plan (T)
- Execution Log com sprints detalhadas (E)
- Dashboard de KPIs + rituais de performance (P)
