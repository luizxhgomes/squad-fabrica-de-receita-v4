# Template: Forecast Anual: Revenue Constraint Engine

## Princípio
O forecast NÃO nasce da meta. Nasce da **matemática do sistema atual**. A meta é validada depois.

## Inputs: Preencher com Dados Reais

```
=== SITUAÇÃO ATUAL ===
Faturamento últimos 12 meses:  R$ ___________
Faturamento mês atual:         R$ ___________
Meta próximos 12 meses:        R$ ___________
Ticket médio:                  R$ ___________
Ciclo de venda médio:          ___ dias
Modelo:                        [ ] B2C  [ ] B2B  [ ] Híbrido

=== FUNIL ATUAL ===
Exposição (visitantes/mês):    ___________
Taxa Exposição → Lead:         ___%
Leads/mês:                     ___________
Taxa Lead → SQL:               ___%
SQLs/mês:                      ___________
Show rate:                     ___%
Reuniões realizadas/mês:       ___________
Taxa de fechamento:            ___%
Novos clientes/mês:            ___________

=== RECEITA RECORRENTE (se aplicável) ===
Base de clientes ativos:       ___________
Churn rate mensal:             ___%
Clientes perdidos/mês:         ___________
Expansão mensal (upsell):      R$ ___________
```

## Cálculo Base: Situação Atual

```
RECEITA NOVA/MÊS:
  Novos clientes × Ticket médio = R$ [resultado]

RECEITA TOTAL/MÊS (com recorrência):
  Receita nova + (Base × Ticket × (1 - Churn)) = R$ [resultado]

DIAGNÓSTICO:
  Meta mensal necessária: R$ [meta ÷ 12]
  Receita atual/mês:      R$ [resultado acima]
  GAP:                    R$ [diferença]
  GAP%:                   [%]
```

## Identificação da Restrição (Trava Governante)

```
ANÁLISE DE PERDA POR ETAPA:

Etapa                 | Entrada | Saída | Perda% | Benchmark | Status
----------------------|---------|-------|--------|-----------|-------
Exposição → Lead      |         |       |        | <95%      |
Lead → SQL            |         |       |        | <60%      |
SQL → Reunião         |         |       |        | <15%      |
Reunião → Fechamento  |         |       |        | <50%      |

RESTRIÇÃO IDENTIFICADA: Etapa [nome]: Perda de [X]%
TRAVA CANDIDATA: T[X]: [Nome]
```

## Simulação de Injeção (Cenários)

### Cenário Base (Sem Mudança)
```
Mês 1-3:   R$ [faturamento atual × 3]
Mês 4-6:   R$ [faturamento × crescimento orgânico estimado]
Mês 7-12:  R$ [projeção]
Total:      R$ [soma]
```

### Cenário Otimista (Injeção T[X]: sucesso pleno)
```
Premissa: [métrica da trava] melhora de [X%] para [Y%]

Impacto:
  Novos clientes/mês: [atual] → [projetado]
  Receita nova/mês:   R$ [atual] → R$ [projetado]
  Crescimento:        +[X]%

Projeção mensal após injeção (D+30 a D+90):
  Mês 1 (efeito parcial):  R$ [50% do ganho]
  Mês 2 (efeito crescendo): R$ [75% do ganho]
  Mês 3 (efeito pleno):    R$ [100% do ganho]

Total 12 meses (c/ injeção): R$ ___________
vs Meta declarada:            R$ ___________
Viabilidade da meta:          [ ] SIM  [ ] NÃO  [ ] PARCIAL
```

### Cenário Conservador (Injeção: resultado mínimo)
```
Premissa: [métrica] melhora 50% do previsto no cenário otimista

Total 12 meses: R$ ___________
ROI da injeção: [((ganho total - investimento) / investimento) × 100]%
```

## Payback Analysis

```
Investimento DR-X:        R$ ___________
Ganho mensal estimado:    R$ ___________
Payback period:           ___ meses

Break-even: Mês [X]
  Acumulado investimento: R$ [investimento]
  Acumulado ganho:        R$ [ganho × meses]

ROI 90 dias:  [(ganho × 3 - investimento) / investimento × 100]%
ROI 12 meses: [(ganho × 12 - investimento) / investimento × 100]%
```

## Validação da Meta

```
META DECLARADA: R$ [meta]/ano

A matemática do sistema atual suporta essa meta?
  Com injeção otimista:    [ ] SIM  [ ] NÃO
  Com injeção conservadora: [ ] SIM  [ ] NÃO

Se NÃO: Para atingir a meta, seria necessário:
  - Melhorar [métrica] de [X%] para [Y%] (possível / improvável)
  - E/ou aumentar volume de leads em [X]%
  - E/ou reduzir ciclo de venda para [X] dias

Conclusão: Meta [ ] REALISTA  [ ] AMBICIOSA MAS POSSÍVEL  [ ] IRREALISTA
```
