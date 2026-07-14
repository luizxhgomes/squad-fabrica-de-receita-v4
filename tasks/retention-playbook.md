---
task: Retention Playbook
responsavel: "@retention-architect"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - empresa: Empresa e segmento
  - churn_mensal: Churn rate atual (%)
  - ltv_atual: LTV medio atual (R$)
  - cac_atual: CAC medio atual (R$)
  - nps_atual: NPS atual (se medido)
  - principais_motivos_churn: Motivos de saida dos clientes
  - tempo_cliente: Tempo medio de relacionamento
Saida: |
  - diagnostico_retencao: Diagnostico completo com custo do churn
  - playbook_onboarding: Playbook de onboarding (30 dias)
  - health_score: Sistema de health score configurado
  - playbook_resgate: Playbook de resgate para clientes em risco
  - estrategia_expansao: Estrategia de expansao e indicacao
  - dashboard_kpis: Dashboard de KPIs do Pilar de Retencao
Checklist:
  - "[ ] Metricas de saude mapeadas (churn, LTV, LTV:CAC, NPS)"
  - "[ ] Playbook de onboarding estruturado (30 dias)"
  - "[ ] Health score configurado com indicadores e pesos"
  - "[ ] Playbook de resgate documentado para clientes em risco"
  - "[ ] Estrategia de expansao (upsell/cross-sell) definida"
---

# Task: retention-playbook

**Agent:** @retention-architect
**Trigger:** `*retention-playbook`
**Objetivo:** Criar playbook completo de retenção: Pilar 4: maximizar LTV e transformar clientes em promotores

---

## Inputs

```yaml
elicit: true
fields:
  - empresa: "Empresa e segmento"
  - churn_mensal: "Churn rate atual (%)"
  - ltv_atual: "LTV médio atual (R$)"
  - cac_atual: "CAC médio atual (R$)"
  - nps_atual: "NPS atual (se medido)"
  - principais_motivos_churn: "Por que os clientes estão saindo?"
  - tempo_cliente: "Tempo médio de relacionamento com o cliente"
```

---

## Execução

### FASE 1: Diagnóstico de Retenção

```markdown
#### MÉTRICAS DE SAÚDE:
| Métrica | Atual | Benchmark | Gap | Impacto |
|---------|-------|-----------|-----|---------|
| Churn mensal | | <2% | | |
| LTV | R$ | | | |
| LTV:CAC ratio | | >3:1 | | |
| NPS | | >40 | | |
| Receita de expansão | | | | |
| Taxa de recompra | | | | |

#### ANÁLISE DE COORTE:
- Clientes que ficaram: o que têm em comum?
- Clientes que saíram: o que têm em comum?
- Momento de churn mais frequente: [mês X do relacionamento]
- Principal motivo declarado: [motivo]

#### CUSTO DO CHURN ATUAL:
Clientes perdidos por mês: [X]
Receita perdida por mês: R$ [X × ticket médio]
Custo adicional de aquisição para repor: R$ [X × CAC]
Custo total do churn: R$ [soma] /mês
```

---

### FASE 2: Playbook de Onboarding

```markdown
#### ONBOARDING ESTRUTURADO (Primeiros 30 Dias):

[O onboarding é onde a retenção começa: cliente que não atinge
o primeiro momento de valor vai embora cedo]

SEMANA 1: Ativação:
[ ] Welcome call com cliente (dentro de 24h do fechamento)
[ ] Entrega do "guia de início rápido"
[ ] Setup inicial concluído
[ ] Primeiro resultado rápido entregue

SEMANA 2: Engajamento:
[ ] Check-in de progresso
[ ] Resolver primeiros obstáculos
[ ] Conectar cliente com cases similares

SEMANA 3-4: Consolidação:
[ ] Primeiro resultado mensurável demonstrado
[ ] NPS de onboarding (survey de 30 dias)
[ ] Plano de sucesso definido junto com o cliente

**Critério de Onboarding Completo:**
→ Cliente atingiu [X] marcos de produto/serviço
→ NPS de onboarding ≥ [Y]
→ Próxima reunião de check-in agendada
```

---

### FASE 3: Health Score e Churn Prediction

```markdown
#### SISTEMA DE HEALTH SCORE:

Definir indicadores de saúde do cliente:

| Indicador | Peso | Verde (Saudável) | Amarelo (Atenção) | Vermelho (Risco) |
|-----------|------|-----------------|-------------------|-----------------|
| Uso/Engajamento | 30% | [parâmetro] | [parâmetro] | [parâmetro] |
| Resultados vs metas | 30% | [parâmetro] | [parâmetro] | [parâmetro] |
| Relacionamento | 20% | [parâmetro] | [parâmetro] | [parâmetro] |
| Pagamentos | 20% | Em dia | [parâmetro] | Atrasado |

**Score Geral:**
- 🟢 Verde (70-100): Saudável, foco em expansão
- 🟡 Amarelo (40-69): Atenção, ação preventiva
- 🔴 Vermelho (0-39): Risco crítico, ação imediata

#### AUTOMAÇÃO DE CHURN PREDICTION (IA):
[ ] Alert automático quando health score < 40
[ ] Identificação de padrões pré-churn
[ ] Trigger automático para playbook de resgate
```

---

### FASE 4: Playbook de Resgate

```markdown
#### PROTOCOLO DE RESGATE (Cliente em Risco 🔴):

ALERTA VERMELHO → CS deve agir em 24h:

DIA 1:
[ ] CS faz contato imediato (telefone, não email)
[ ] Diagnóstico do problema real (escutar sem defender)
[ ] Entender o que ele precisa que ainda não está recebendo

DIA 2-7:
[ ] Criar plano de resgate personalizado
[ ] Envolver stakeholder interno (gestor/especialista)
[ ] Propor solução concreta com prazo

DIA 8-30:
[ ] Implementar solução acordada
[ ] Check-in semanal de progresso
[ ] Demonstrar resultados com dados

SE RESGATE BEM-SUCEDIDO:
[ ] Documentar caso como playbook
[ ] Atualizar health score
[ ] Planejar expansão

SE CHURN INEVITÁVEL:
[ ] Exit interview: entender causa-raiz real
[ ] Documentar aprendizado
[ ] Criar "rescue window" para retorno futuro
```

---

### FASE 5: Estratégia de Expansão (Upsell + Cross-sell)

```markdown
#### MAPA DE EXPANSÃO:

Identificar oportunidades por tipo de cliente:
| Segmento | Upsell Natural | Cross-sell | Momento Ideal |
|---------|----------------|------------|---------------|
| [Segmento A] | [produto/upgrade] | [complemento] | [após X resultado] |
| [Segmento B] | | | |

#### PROGRAMA DE INDICAÇÃO:
[ ] Incentivo para indicação definido (desconto, benefício, cash)
[ ] Processo de indicação simplificado (1 link, 1 mensagem)
[ ] Tracking de indicações por cliente
[ ] Meta: [X]% dos novos clientes via indicação

#### NPS COMO SISTEMA OPERACIONAL:
- NPS 9-10 (Promotores): → Pedir indicação imediatamente
- NPS 7-8 (Neutros): → Entender o que falta para virar 9
- NPS 0-6 (Detratores): → Acionar resgate, alta prioridade
```

---

### FASE 6: KPIs e Metas

```markdown
#### DASHBOARD DE RETENÇÃO:
| KPI | Baseline | Meta 30d | Meta 60d | Meta 90d |
|-----|---------|---------|---------|---------|
| Churn mensal | | | | <2% |
| LTV | R$ | | | +30% |
| LTV:CAC | | | | >3:1 |
| NPS | | | | +10 pts |
| Receita de expansão | R$ | | | |
```

---

## Outputs

- Diagnóstico completo de retenção com custo do churn calculado
- Playbook de onboarding (30 dias)
- Sistema de health score configurado
- Playbook de resgate para clientes em risco
- Estratégia de expansão e indicação
- Dashboard de KPIs do Pilar de Retenção