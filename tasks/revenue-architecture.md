---
task: Revenue Architecture
responsavel: "@revenue-team-architect"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - empresa: Nome da empresa
  - estrutura_atual: Organizacao atual dos times (tamanhos, responsabilidades)
  - silos_identificados: Conflitos/silos entre os times
  - ferramentas_atuais: CRM, automacao, analytics existentes
  - north_star_atual: Metrica mais importante para o CEO
Saida: |
  - score_integracao: Score atual de integracao dos times
  - estrutura_revenue_team: Estrutura do Revenue Team com North Star unificado
  - slas_documentados: SLAs documentados para cada handoff
  - calendario_rituais: Calendario de rituais de sincronizacao
  - roadmap_implementacao: Roadmap de implementacao em 3 meses
Checklist:
  - "[ ] Silos mapeados entre Marketing, Vendas e CS"
  - "[ ] Revenue Team projetado com North Star compartilhada"
  - "[ ] SLAs definidos para cada handoff (MKT>Vendas, Vendas>CS, CS>MKT)"
  - "[ ] Rituais de sincronizacao definidos (daily, weekly, monthly, quarterly)"
---

# Task: revenue-architecture

**Agent:** @fabrica-de-receita-master (Fabio) | @revenue-team-architect (Rian)
**Trigger:** `*revenue-architecture`
**Objetivo:** Projetar arquitetura de Revenue Team unificado (Marketing + Vendas + CS)

---

## Pré-requisito

```yaml
elicit: true
fields:
  - empresa: "Nome da empresa"
  - estrutura_atual: "Como está organizado hoje (times, tamanhos, responsabilidades)"
  - silos_identificados: "Quais conflitos/silos existem hoje entre os times?"
  - ferramentas_atuais: "CRM, automação, analytics: o que já existe"
  - north_star_atual: "Qual a métrica mais importante hoje para o CEO?"
```

---

## Execução

### PASSO 1: Audit de Silos

```markdown
#### MAPEAMENTO DOS SILOS ATUAIS:

Para cada par de times, identificar:

**Marketing → Vendas:**
- Qual o SLA de entrega de leads? (existe? é cumprido?)
- Qual informação o vendedor recebe sobre cada lead?
- O que Vendas reclama de Marketing?
- O que Marketing reclama de Vendas?
- Existe acordo de definição de MQL/SQL?

**Vendas → Customer Success:**
- O que CS sabe sobre o cliente antes de receber o handoff?
- Existe documento de passagem de bastão?
- As expectativas criadas em vendas são cumpridas pelo produto?
- O que CS reclama de Vendas?

**CS → Marketing:**
- Marketing usa cases e depoimentos de CS para prova social?
- Marketing sabe quais clientes têm NPS alto (promotores)?
- Existe loop de feedback de clientes para Marketing?

#### SCORE DE INTEGRAÇÃO ATUAL:
| Elo | Score (0-10) | Principal Problema |
|----|-------------|-------------------|
| Marketing → Vendas | ? | |
| Vendas → CS | ? | |
| CS → Marketing | ? | |
| **Total / 30** | ? | |
```

---

### PASSO 2: Projetar Revenue Team Unificado

```markdown
#### ESTRUTURA DO REVENUE TEAM:

**MISSÃO UNIFICADA:**
[Uma frase que define o objetivo comum dos 3 times]

**NORTH STAR METRIC COMPARTILHADA:**
[Uma métrica que todos os times influenciam e são medidos por ela]
Exemplos: MRR, Receita Total, NRR (Net Revenue Retention)

**ESTRUTURA ORGANIZACIONAL:**
```
Revenue Leader (CRO ou equivalente)
├── Marketing Team
│   ├── KPIs próprios: [CAC, MQL, CPL...]
│   └── SLA para Vendas: [definição de MQL + prazo de entrega]
├── Sales Team
│   ├── KPIs próprios: [Taxa de fechamento, ciclo, ACV...]
│   └── SLA para CS: [handoff document + prazo]
└── CS Team
    ├── KPIs próprios: [Churn, NPS, Expansion...]
    └── SLA para Marketing: [casos de sucesso + feedback loop]
```
```

---

### PASSO 3: Definir SLAs e Handoffs

```markdown
#### SLA: MARKETING → VENDAS

**Definição de MQL (Marketing Qualified Lead):**
- ICP match: [critérios de perfil]
- Engajamento mínimo: [score ou ações]
- Dados obrigatórios no lead: [campos]

**SLA de Entrega:**
- MQL entregue para SDR em: [X horas]
- Contexto obrigatório: [informações que acompanham o lead]
- SLA de primeiro contato do SDR: [Y horas após receber]

**O que acontece se SLA for quebrado:**
[Processo de escalada]

---

#### SLA: VENDAS → CUSTOMER SUCCESS

**Handoff Document obrigatório:**
- [ ] Expectativas criadas durante a venda
- [ ] Objetivos específicos do cliente
- [ ] Riscos identificados durante o processo de venda
- [ ] Decisores e stakeholders mapeados
- [ ] Histórico de objeções e como foram tratadas

**SLA de Handoff:**
- Reunião de passagem de bastão: [X dias após fechamento]
- CS inicia onboarding: [Y dias após handoff]

---

#### SLA: CS → MARKETING

**Loop de Feedback:**
- NPS promotores (9-10): Marketing recebe lista mensal para casos de sucesso
- Motivos de churn: Marketing recebe relatório trimestral
- Expansão de clientes: Marketing cria case study

**Entregáveis de CS para Marketing:**
- 2 cases de sucesso por trimestre
- 1 depoimento em vídeo por mês
- Feedback de produto → Marketing Product Loop
```

---

### PASSO 4: Rituais de Sincronização

```markdown
#### RITMO OPERACIONAL DO REVENUE TEAM:

**Daily (15min: Standup):**
- Participantes: Leads de Marketing, Vendas e CS
- Agenda: Blockers, handoffs urgentes, alertas críticos

**Weekly (60min: Pipeline Review):**
- Participantes: Revenue Team completo
- Agenda:
  [ ] Estado do funil (Marketing → Vendas → CS)
  [ ] Qualidade de MQLs da semana
  [ ] Deals em risco de não fechar
  [ ] Alertas de churn (CS)
  [ ] KPIs vs meta semanal

**Monthly (90min: Revenue Board):**
- Participantes: Revenue Team + C-Level
- Agenda:
  [ ] KPIs do mês vs meta
  [ ] Análise da trava atual do ciclo 90d
  [ ] Ajustes estratégicos
  [ ] Decisões de investimento

**Quarterly (3h: Trava Review):**
- Participantes: Revenue Team completo
- Agenda:
  [ ] Resultado do ciclo de 90 dias
  [ ] ROI calculado
  [ ] Diagnóstico da próxima trava
  [ ] Planejamento do próximo ciclo
```

---

### PASSO 5: Plano de Implementação

```markdown
#### ROADMAP DE INTEGRAÇÃO:

**MÊS 1: Fundação:**
[ ] North Star Metric definida e comunicada
[ ] Definições de MQL/SQL alinhadas
[ ] Primeiro handoff document criado
[ ] Primeiros rituais implementados

**MÊS 2: Operação:**
[ ] SLAs em produção com monitoramento
[ ] Dashboard compartilhado de funil
[ ] Primeiro Revenue Board realizado
[ ] Ajustes nos processos

**MÊS 3: Otimização:**
[ ] Review dos SLAs (estão sendo cumpridos?)
[ ] Otimização dos rituais
[ ] Loop de feedback CS → Marketing funcionando
[ ] Revenue Team operando como um sistema único
```

---

## Outputs

- Score atual de integração dos times
- Estrutura do Revenue Team com North Star unificado
- SLAs documentados para cada handoff
- Calendário de rituais de sincronização
- Roadmap de implementação em 3 meses
