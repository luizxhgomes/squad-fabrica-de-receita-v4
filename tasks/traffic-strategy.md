---
task: Traffic Strategy
responsavel: "@traffic-hunter"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - empresa: Empresa e segmento
  - icp: Perfil do cliente ideal (ICP) atual
  - canais_ativos: Canais ja utilizados (Meta, Google, LinkedIn, Organico)
  - budget_mensal: Budget de midia disponivel
  - cac_atual: CAC atual por canal
  - objetivo_90d: Meta de novos clientes em 90 dias
Saida: |
  - audit_canais: Audit completo de canais com benchmark
  - alocacao_budget: Estrategia de alocacao de budget por canal
  - tatica_por_canal: Tatica detalhada por canal com automacoes de IA
  - plano_90d: Plano de 90 dias com sprints semanais
  - dashboard_kpis: Dashboard de KPIs (CAC, ROAS, CPL por canal)
Checklist:
  - "[ ] Canais ativos mapeados com metricas de eficiencia"
  - "[ ] Alocacao de budget definida (regra 70/20/10)"
  - "[ ] Tatica por canal documentada com automacoes"
  - "[ ] Plano de 90 dias com metas mensais"
---

# Task: traffic-strategy

**Agent:** @traffic-hunter
**Trigger:** `*traffic-strategy`
**Objetivo:** Criar estratégia completa de tráfego para o Pilar 1 V4: mínimo CAC, máximo volume qualificado

---

## Inputs

```yaml
elicit: true
fields:
  - empresa: "Empresa e segmento"
  - icp: "Perfil do cliente ideal (ICP) atual"
  - canais_ativos: "Quais canais já utiliza (Meta, Google, LinkedIn, Orgânico...)"
  - budget_mensal: "Budget de mídia disponível"
  - cac_atual: "CAC atual por canal (se disponível)"
  - objetivo_90d: "Meta de novos clientes em 90 dias"
```

---

## Execução

### FASE 1: Audit de Canais

```markdown
#### MAPEAMENTO DE CANAIS:
Para cada canal ativo, levantar:
| Canal | Investimento/mês | Volume Leads | CPC/CPL | CAC | ROAS | Status |
|-------|-----------------|-------------|---------|-----|------|--------|
| Meta Ads | R$ | | | | | |
| Google Ads | R$ | | | | | |
| LinkedIn Ads | R$ | | | | | |
| Orgânico/SEO | R$ | | | | | |
| Indicação | R$ | | | | | |
| Outbound | R$ | | | | | |

#### ANÁLISE DE EFICIÊNCIA:
→ Melhor CAC: [canal]
→ Maior volume: [canal]
→ Melhor LTV:CAC por canal: [análise]
→ Canais abaixo do benchmark: [listar]
```

---

### FASE 2: Estratégia de Canais

```markdown
#### ALOCAÇÃO ESTRATÉGICA DE BUDGET (Regra 70/20/10):
- 70% nos canais COMPROVADOS com melhor CAC
- 20% em canais em TESTE (alto potencial)
- 10% em EXPERIMENTOS (canais novos)

#### TÁTICA POR CANAL:

**Meta Ads:**
- Segmentação: [audiências prioritárias]
- Lookalike: [fonte de dados para lookalike]
- Criativos: [formatos e testes]
- Bid strategy: [objetivo da campanha]

**Google Ads:**
- Palavras-chave prioritárias: [lista]
- Negative keywords: [lista]
- Landing pages por intent: [estrutura]

**Orgânico/Conteúdo:**
- Temas prioritários: [baseado em ICP]
- Formato: [blog, vídeo, social]
- Frequência: [cadência]

**Canais de Teste (20%):**
- [Canal 1]: Hipótese + critério de sucesso
- [Canal 2]: Hipótese + critério de sucesso
```

---

### FASE 3: AI-First para Tráfego

```markdown
#### AUTOMAÇÕES DE IA PARA TRÁFEGO:
[ ] Lookalike audiences baseado em lista de melhores clientes
[ ] Bid optimization automático por conversão
[ ] Dynamic creative optimization (DCO)
[ ] Retargeting segmentado por estágio do funil
[ ] Lead scoring automático na entrada

#### CREATIVE TESTING SYSTEM:
- Testar [N] criativos por semana
- Critério de kill: CTR < [X]% após [Y] dias e [Z] impressões
- Critério de escala: CTR > [X]% e CPL < [Y]
```

---

### FASE 4: Plano de 90 Dias

```markdown
#### SPRINT DE TRÁFEGO:

MESES 1 (Otimização Base):
[ ] Implementar tracking completo (pixel, UTMs, GA4)
[ ] Subir estrutura de campanhas otimizada
[ ] Ativar lookalike audiences
[ ] Baseline de KPIs

MÊS 2 (Escala dos Vencedores):
[ ] Dobrar budget nos canais com melhor CAC
[ ] Criar 10 novos criativos baseados nos top performers
[ ] Testar 2 novos canais (os 20%)
[ ] Review semanal de performance

MÊS 3 (Consolidação):
[ ] Consolidar aprendizados
[ ] Escalar o que funciona
[ ] Documentar playbook de tráfego
[ ] Projetar budget ótimo para o quarter seguinte

**Meta:** Reduzir CAC em [X]% ou aumentar volume qualificado em [Y]% mantendo CAC
```

---

## Outputs

- Audit completo de canais com benchmark
- Estratégia de alocação de budget por canal
- Tática detalhada por canal com automações de IA
- Plano de 90 dias com sprints semanais
- Dashboard de KPIs: CAC, ROAS, CPL por canal