---
task: Diagnosticar Trava
responsavel: "@diagnosticador"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - faturamento_atual: Faturamento atual (R$/mes)
  - meta_faturamento: Meta de faturamento (R$/mes)
  - dados_funil: Visitantes, leads, SQLs, reunioes, clientes/mes
  - ticket_medio: Ticket medio (R$)
  - cac_por_canal: CAC por canal (R$)
  - churn_rate: Churn rate (%)
  - ciclo_venda: Ciclo de venda medio (dias)
  - respostas_apex: Respostas ao questionario de diagnostico
Saida: |
  - laudo_diagnostico: Laudo de diagnostico com trava identificada
  - funil_mapeado: Funil mapeado com taxas de perda por etapa
  - crt: Current Reality Tree com causas-raiz
  - impacto_financeiro: Quantificacao do impacto financeiro
Checklist:
  - "[ ] Funil mapeado com dados reais (nao estimativas)"
  - "[ ] Trava candidata identificada com 4+ pts de confirmacao"
  - "[ ] CRT construida com minimo 3 causas-raiz"
  - "[ ] Impacto financeiro quantificado (perda mensal + ROI 90d)"
  - "[ ] Laudo produzido e pronto para Board 1"
---

# Task: diagnosticar-trava

## Metadata
```yaml
task_id: diagnosticar-trava
agent: diagnosticador
squad: destrava
version: 1.0.0
estimated_time: 60-90min
```

## Objetivo
Identificar matematicamente qual das 8 Travas é a restrição governante do sistema de receita do cliente, aplicando a metodologia TOC.

## Inputs Necessários

```
1. Faturamento atual (R$/mês)
2. Meta de faturamento (R$/mês)
3. Dados do funil: visitantes, leads, SQLs, reuniões, clientes/mês
4. Ticket médio (R$)
5. CAC por canal (R$)
6. Churn rate (%)
7. Ciclo de venda médio (dias)
8. Respostas ao questionário de diagnóstico (5 perguntas do Apex)
```

## Processo de Execução

### Etapa 1: Mapeamento do Funil (15min)
```
EXPOSIÇÃO → taxa → INTERESSE → taxa → SQL → taxa → REUNIÃO → taxa → CLIENTE
```
Calcular percentual de perda em cada etapa.

### Etapa 2: Identificação da Trava Candidata (10min)
Qual etapa tem a maior perda percentual?

| Etapa com maior perda | Trava Candidata |
|----------------------|-----------------|
| Exposição → Lead | T2 Invisibilidade |
| Lead → SQL | T3/T5 Irrelevância/Ruído |
| SQL → Reunião | T6 Compromisso |
| Reunião → Fechamento | T7 Persuasão |
| Pós-venda / Churn alto | T8 Infidelidade |
| Funil inexistente | T1 Cegueira |
| Lead → Interesse | T4 Rejeição |

### Etapa 3: 3 Testes de Confirmação (20min)

Para cada trava candidata, aplicar os 3 testes:

**TESTE 1: Evidência Direta**
> Se [melhorar métrica da trava], o faturamento aumenta diretamente?
- SIM (2 pts) / PARCIAL (1 pt) / NAO (0 pts)

**TESTE 2: Causa-Raiz**
> Outros problemas são consequência desta trava?
- Listar 3 consequências. SIM se ≥2 confirmadas.

**TESTE 3: Custo de Inação**
> Quanto custa cada mês que passa sem resolver esta trava?
- Calcular: [(receita potencial - receita atual) × taxa de conversão perdida]

**Pontuação:** ≥4 pts = trava confirmada | 2-3 pts = revisar | <2 pts = trava errada

### Etapa 4: CRT (Current Reality Tree) (15min)
Construir árvore de causa-efeito:
```
EFEITO INDESEJÁVEL RAIZ
    ← causa (trava identificada)
        ← causa-raiz 1
        ← causa-raiz 2
        ← causa-raiz 3
```

### Etapa 5: Quantificação do Impacto (10min)
```
Perda mensal estimada = (faturamento potencial - faturamento atual)
Payback da injeção = investimento ÷ ganho mensal estimado
ROI 90 dias = [(ganho × 3) - investimento] ÷ investimento × 100
```

## Output: Laudo de Diagnóstico

```markdown
## LAUDO DE DIAGNÓSTICO: [Nome da Empresa]
Data: [data]

### TRAVA IDENTIFICADA: T[X]: [Nome]
Confirmação: [X/6 pts nos 3 testes]

### EVIDÊNCIAS
- Métrica-gargalo: [nome] = [valor atual] (meta: [valor])
- Taxa de perda: [%] acima da média saudável
- Custo mensal estimado: R$ [valor]

### CAUSA-RAIZ
[Descrição da causa em 2-3 frases baseada nos dados]

### PRÓXIMO PASSO: ARTEFATO INICIAL
[Nome do artefato]: implementar em D+15
Impacto estimado em 90 dias: R$ [valor]
```

## Critérios de Sucesso
- [ ] Funil mapeado com dados reais (não estimativas)
- [ ] Trava candidata identificada com ≥4 pts de confirmação
- [ ] CRT construída com mínimo 3 causas-raiz
- [ ] Impacto financeiro quantificado
- [ ] Laudo produzido e aprovado pelo cliente no Board 1
