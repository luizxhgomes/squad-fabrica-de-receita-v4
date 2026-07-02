---
task: Trava Diagnostico
responsavel: "@diagnosticador"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - empresa: Nome da empresa
  - segmento: Setor de atuacao
  - faturamento_mensal: Faturamento medio mensal (R$)
  - periodo_analise: Periodo de dados disponiveis
  - dados_disponiveis: CAC, LTV, churn rate, taxa de conversao, NPS
  - principal_dor: Maior dor percebida hoje
Saida: |
  - diagnostico_8_travas: Diagnostico completo das 8 travas com scores
  - ranking_travas: Ranking de travas por impacto no sistema de receita
  - trava_critica: Identificacao da trava critica atual
  - impacto_receita: Estimativa de impacto na receita ao destravar
  - base_step: Base para step-plan e ciclo-90d
Checklist:
  - "[ ] Fluxo de receita mapeado etapa por etapa"
  - "[ ] 8 travas diagnosticadas com score 0-10"
  - "[ ] 3 metodos de verificacao aplicados"
  - "[ ] Trava critica identificada com impacto financeiro estimado"
---

# Task: trava-diagnostico

**Agent:** @fabrica-de-receita-master (Fabio)
**Trigger:** `*diagnostico`
**Objetivo:** Conduzir diagnóstico científico completo das 8 Travas de Receita de uma empresa

---

## Inputs Necessários

```yaml
elicit: true
fields:
  - empresa: "Nome da empresa"
  - segmento: "Setor de atuação"
  - faturamento_mensal: "Faturamento médio mensal (R$)"
  - periodo_analise: "Período de dados disponíveis (ex: últimos 3 meses)"
  - dados_disponiveis:
      - "CAC atual (se tiver)"
      - "LTV atual (se tiver)"
      - "Churn rate"
      - "Taxa de conversão de lead"
      - "Taxa de fechamento de vendas"
      - "NPS"
  - principal_dor: "Qual a maior dor percebida hoje?"
```

---

## Execução

### FASE 1: Mapeamento do Fluxo de Receita

```
Construir o mapa completo de receita, etapa por etapa:

EXPOSIÇÃO
  └─ Volume de impressões/alcance por canal
  └─ Share of voice estimado

ATENÇÃO
  └─ CTR por canal
  └─ CPM / CPC
  └─ Engajamento com conteúdo

INTERESSE
  └─ Volume de visitas (site/LP)
  └─ Taxa de conversão visita → lead
  └─ Custo por lead

QUALIFICAÇÃO
  └─ Volume de MQLs
  └─ Taxa de MQL → SQL
  └─ Tempo médio de qualificação

COMPROMISSO
  └─ No-show rate em reuniões
  └─ Abandono de checkout/formulário
  └─ Taxa de proposta enviada

DECISÃO
  └─ Taxa de fechamento de vendas
  └─ Ciclo médio de vendas
  └─ Motivos de perda

RETENÇÃO
  └─ Churn rate mensal
  └─ NPS / CSAT
  └─ Receita de expansão
  └─ Taxa de recompra

CEGUEIRA
  └─ Quais métricas acima não têm dados?
  └─ Qualidade dos dados existentes
```

### FASE 2: Diagnóstico das 8 Travas

Para cada trava, avaliar de 0 a 10 (0 = trava crítica, 10 = sem problema):

| Trava | Score (0-10) | Evidências | Sintomas Identificados |
|-------|-------------|------------|----------------------|
| CEGUEIRA | ? | | |
| RETENÇÃO | ? | | |
| DECISÃO | ? | | |
| COMPROMISSO | ? | | |
| QUALIFICAÇÃO | ? | | |
| INTERESSE | ? | | |
| ATENÇÃO | ? | | |
| EXPOSIÇÃO | ? | | |

**Critérios de Score:**
- 0-3: Trava crítica: impacto imediato na receita
- 4-6: Trava significativa: atenção no próximo ciclo
- 7-9: Funcionando bem: manutenção
- 10: Excelência: pode ser referência

### FASE 3: Os 3 Métodos de Verificação

**Método 1: Acúmulo de Fluxo**
```
Mapear onde o volume congestionado está:
→ Identifique a etapa com maior volume sem conversão
→ Calcule a taxa de conversão entre etapas adjacentes
→ A pior taxa = localização do gargalo principal
```

**Método 2: Comparação de Benchmark**
```
Comparar métricas chave vs padrões de mercado:
→ CVR Landing Page: <1% (ruim) | 2-5% (mercado) | >8% (excelente)
→ Email Open Rate: <15% (ruim) | 25-35% (mercado) | >45% (excelente)
→ Taxa de Fechamento: <10% (ruim) | 20-30% (mercado) | >40% (excelente)
→ Churn Mensal: >5% (ruim) | 2-3% (mercado) | <1% (excelente)
→ LTV:CAC: <2:1 (ruim) | 3:1 (mercado) | 5:1+ (excelente)
```

**Método 3: Impulso Controlado**
```
Simular o que aconteceria se dobrássemos o volume em cada etapa:
→ Se dobrar tráfego mas leads não dobram → trava em INTERESSE ou ATENÇÃO
→ Se leads dobram mas SQLs não → trava em QUALIFICAÇÃO
→ Se SQLs dobram mas fechamentos não → trava em DECISÃO
→ Se clientes dobram mas receita não cresce proporcionalmente → trava em RETENÇÃO
```

### FASE 4: Síntese do Diagnóstico

**Formato de Entregável:**

```markdown
## Diagnóstico Fábrica de Receita: [Nome da Empresa]
Data: [data]

### Resumo Executivo
[2-3 parágrafos descrevendo o estado geral do sistema de receita]

### Fluxo de Receita Atual
[Visualização do funil com volumes e taxas em cada etapa]

### As 8 Travas: Ranking por Impacto
1. [Trava mais crítica]: Score [X]: [Impacto estimado em R$]
2. [Segunda mais crítica]: Score [X]: [Impacto estimado em R$]
...

### Trava Crítica Atual
**[Nome da Trava]**
- Por que é a crítica: [razão baseada em dados]
- Evidências: [dados que confirmam]
- Impacto se destravada: [projeção conservadora de receita]

### Próximos Passos Recomendados
[Framework STEP aplicado à trava crítica identificada]
```

---

## Outputs

- Diagnóstico completo das 8 travas com scores e evidências
- Ranking de travas por impacto no sistema de receita
- Identificação da trava crítica atual
- Estimativa de impacto na receita ao destravar
- Base para `*trava-critica` e `*step-plan`