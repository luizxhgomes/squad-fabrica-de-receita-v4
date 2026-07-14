---
task: Gerar Artefato
responsavel: "@ops-dr"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - trava_confirmada: Trava confirmada no Board 1 (T1-T8)
  - diagnostico: Contexto do diagnostico e dados do cliente
  - inputs_especificos: Inputs especificos por tipo de trava (CRM, ads, ICP, etc)
Saida: |
  - artefato: Artefato de solucao especifico para a trava (conforme template padrao)
  - plano_implementacao: Plano de implementacao com semanas e responsaveis
  - kpis_sucesso: KPIs de sucesso acordados com o cliente
Checklist:
  - "[ ] Artefato gerado conforme template padrao (contexto, solucao, implementacao, metricas)"
  - "[ ] Implementacao com responsavel e prazo definidos"
  - "[ ] KPIs de sucesso acordados com o cliente"
  - "[ ] Artefato aprovado no Board 1 ou Board 2"
---

# Task: gerar-artefato

## Metadata
```yaml
task_id: gerar-artefato
agent: ops-dr
squad: destrava
version: 1.0.0
estimated_time: 45-90min (varia por trava)
prerequisite: diagnosticar-trava
```

## Objetivo
Gerar o artefato de solução específico para a trava confirmada no Board 1.

## Seleção do Artefato por Trava

| Trava Confirmada | Artefato | Agente Responsável |
|------------------|----------|--------------------|
| T1: Cegueira | Dashboard de Decisão | ops-dr |
| T2: Invisibilidade | Setup de Mídia Otimizado | fabricante-aquisicao |
| T3: Irrelevância | Pack de Criativos | fabricante-aquisicao |
| T4: Rejeição | Landing Page | fabricante-aquisicao |
| T5: Ruído | Playbook de Qualificação (SPICED) | fabricante-aquisicao |
| T6: Compromisso | Kit Anti-No-Show | maquina-comercial |
| T7: Persuasão | Arsenal de Fechamento | maquina-comercial |
| T8: Infidelidade | Régua de Retenção | guardiao-retencao |

## Estrutura Padrão de Artefato

Todo artefato deve conter:

```markdown
## ARTEFATO: [Nome]
### Trava: T[X]: [Nome da Trava]
### Data: [data] | Empresa: [nome] | DRI: [responsável]

### 1. CONTEXTO
- Situação identificada: [diagnóstico]
- Métrica-alvo: [atual] → [meta em 90 dias]

### 2. SOLUÇÃO
[Conteúdo específico do artefato]

### 3. IMPLEMENTAÇÃO
**Semana 1:** [ações]
**Semana 2:** [ações]
**Semana 3-4:** [ações]

### 4. MÉTRICAS DE SUCESSO
- KPI primário: [métrica] → meta: [valor]
- KPI secundário: [métrica] → meta: [valor]

### 5. CRITÉRIOS DE DONE
- [ ] [critério 1]
- [ ] [critério 2]
- [ ] [critério 3]
```

## Processo por Trava

### T1: Dashboard de Decisão
```
Inputs necessários:
- Acesso ao CRM (dados de funil)
- Acesso ao Google Analytics / GA4
- Acesso ao Business Manager

Deliverable:
- Planilha Google Sheets com:
  - CAC por canal
  - LTV médio
  - Taxas de conversão por etapa
  - Dashboard automático (atualização semanal)
```

### T2: Setup de Mídia Otimizado
```
Inputs necessários:
- Acesso ao Google Ads
- Acesso ao Meta Ads Manager
- ICP definido
- Budget mensal disponível

Deliverable:
- Estrutura de campanhas recomendada
- Configuração de públicos (Custom + Lookalike)
- Copy de anúncios (3 variações por formato)
- KPIs e metas por canal
```

### T3: Pack de Criativos
```
Inputs necessários:
- ICP + dores validadas
- Prova social disponível (cases, depoimentos)
- Identidade visual da empresa

Deliverable:
- 5 variações de criativo com estrutura:
  HOOK → PROBLEMA → SOLUÇÃO → PROVA → CTA
- Formatos: feed, stories, reels (adaptações)
- Guia de uso e teste A/B
```

### T4: Landing Page
```
Inputs necessários:
- PUV validada
- Prova social (3+ depoimentos)
- Oferta clara com garantia

Deliverable:
- Wireframe completo com estrutura PAS
- Copy de todas as seções
- Critérios técnicos de implementação
```

### T5: Playbook de Qualificação
```
Inputs necessários:
- ICP definido
- Critérios de MQL/SAL/SQL atuais
- Processo de vendas atual

Deliverable:
- Framework SPICED personalizado
- Script de qualificação (perguntas por etapa)
- Critérios objetivos de MQL, SAL, SQL
- Playbook para o time comercial
```

### T6: Kit Anti-No-Show
```
Inputs necessários:
- Canal de comunicação preferido (WhatsApp/Email/Ligação)
- Tom de voz da empresa
- Taxa de no-show atual

Deliverable:
- Régua completa T=0 até T-5min (7 pontos)
- Scripts por canal
- Protocolo de reagendamento
- Métricas de controle
```

### T7: Arsenal de Fechamento
```
Inputs necessários:
- Top 10 objeções recebidas
- Ticket médio e condições comerciais
- Concorrentes principais

Deliverable:
- Scripts de 10 objeções (LAER + resposta)
- Battle Card (nós vs concorrentes)
- Sequência de fechamento em 5 passos
- Follow-up pós-reunião (3 variações)
```

### T8: Régua de Retenção
```
Inputs necessários:
- Churn rate atual
- Perfil dos clientes que cancelam
- Canal de comunicação pós-venda

Deliverable:
- Cadência D+0 a D+90 (pós-venda)
- Critérios de health score
- Alertas de churn iminente
- Scripts de reativação de inativos
```

## Critérios de Sucesso
- [ ] Artefato gerado conforme template padrão
- [ ] Implementação com responsável e prazo definidos
- [ ] KPIs de sucesso acordados com o cliente
- [ ] Artefato aprovado no Board 1 ou Board 2