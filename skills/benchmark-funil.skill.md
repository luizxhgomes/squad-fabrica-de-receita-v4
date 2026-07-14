---
name: benchmark-funil
description: |
  Comparação das métricas atuais do funil contra os benchmarks de
  referência da knowledge base e os benchmarks (mentalidade ROI
  Hunters). Devolve os gaps por métrica com severidade e as travas
  candidatas associadas a cada gap, como entrada para o diagnóstico
  das 8 travas.
inputs:
  - metricas_atuais: "métricas do funil por etapa (CVR de LP, CTR, open rate, fechamento, churn, LTV, CAC, ROAS, payback)"
outputs:
  - gaps: "por métrica: valor atual, benchmark, desvio e severidade"
  - travas_candidatas: "travas associadas aos maiores gaps"
wraps:
  - data/fabrica-de-receita-kb.md
  - data/revenue-principles.md
applies_to_qg: QG-001
business_rule: BR-007
agent_origin: roi-analyst
---

# Skill: Benchmark de Funil

## Purpose

Operacionaliza o Método 2 de diagnóstico científico (Comparação de Benchmark): comparar as métricas do funil contra padrões de mercado revela onde a operação está abaixo. Qualquer métrica significativamente abaixo do benchmark = trava identificada como candidata. Os benchmarks são referência, não veredito (BR-007, non-blocking): a confirmação da trava governante exige os 3 testes com regra 2 de 3.

## Procedure

### Passo 1: Coletar as métricas por pilar

| Pilar | KPIs essenciais |
|-------|-----------------|
| Tráfego | CAC, ROAS, CTR, CPC, CPL |
| Engajamento | email open rate e CTR, engajamento em redes, tempo médio no site, páginas por sessão, MQL score |
| Conversão | CVR geral, CPA, abandono de carrinho/formulário, lead para cliente rate, receita por visitante |
| Retenção | churn rate, LTV, NPS, NRR, expansion revenue |

### Passo 2: Comparar contra os benchmarks de referência

| Métrica | Abaixo | Mercado | Excelente |
|---------|--------|---------|-----------|
| CVR Landing Page | <1% | 2-5% | >8% |
| Email Open Rate | <15% | 25-35% | >45% |
| Taxa de Fechamento | <10% | 20-30% | >40% |
| Churn Mensal | >5% | 2-3% | <1% |
| LTV:CAC | <2:1 | 3:1 | 5:1+ |

### Passo 3: Aplicar os benchmarks (mentalidade ROI-first)

- LTV:CAC ratio: 3:1 saudável, 5:1 excelente
- Payback period: menos de 12 meses saudável, menos de 6 meses excelente
- ROAS mínimo: 3x para e-commerce, 2x para serviços

Princípios ROI-first que regem a leitura:
- ROI é a única métrica que importa no final
- Toda decisão de marketing precisa ser justificada por dados
- Se o ROAS está abaixo do mínimo, a campanha morre, sem exceções
- Escala o que funciona, mata o que não funciona rapidamente
- Testes contínuos são a única vantagem sustentável

### Passo 4: Classificar a severidade de cada gap

- CRÍTICO: métrica na faixa "Abaixo" do benchmark (ou ROAS abaixo do mínimo)
- ATENÇÃO: métrica na faixa de mercado mas distante do "Excelente"
- SAUDÁVEL: métrica na faixa de mercado ou acima

### Passo 5: Mapear cada gap para a trava candidata

| Gap identificado | Trava candidata |
|------------------|-----------------|
| Menos de 4 métricas disponíveis para o comparativo | T1 Cegueira |
| Churn, LTV:CAC, NPS, NRR | T2 Retenção |
| Taxa de fechamento | T3 Decisão |
| Show-rate, abandono de formulário/checkout | T4 Compromisso |
| MQL para SQL, qualidade de lead | T5 Qualificação |
| CVR de landing page | T6 Interesse |
| CTR, hook rate, engajamento | T7 Atenção |
| Alcance, share of voice | T8 Exposição |

### Passo 6: Priorizar pela matemática da receita

```
Receita = Tráfego × Taxa de Engajamento × Taxa de Conversão × LTV

Para dobrar a receita:
- 2x o Tráfego (mais caro)
- 2x o Engajamento (médio)
- 2x a Conversão (muito impactante)
- 2x o LTV (altamente impactante e mais barato que adquirir)
```

Em empate de severidade, priorizar gaps de Conversão e LTV: são as alavancas de maior impacto por real investido.

## Output Schema

```yaml
gaps:
  - metrica: cvr_landing_page
    valor_atual: "0.8%"
    benchmark_mercado: "2-5%"
    severidade: CRITICO
    trava_candidata: T6
  - metrica: ltv_cac
    valor_atual: "2.4:1"
    benchmark_mercado: "3:1"
    severidade: ATENCAO
    trava_candidata: T2
travas_candidatas: [T6, T2]
cobertura_de_dados: "9 de 12 métricas disponíveis"
```

## Verdict Logic

- GAPS_IDENTIFICADOS: 1 ou mais métricas em faixa CRÍTICO; encaminhar as travas candidatas para a skill `diagnostico-8-travas` (benchmark aponta, não confirma: BR-007 é non-blocking)
- FUNIL_SAUDAVEL: nenhum gap crítico; monitorar e reavaliar no próximo ciclo
- DADOS_INSUFICIENTES: menos de 4 métricas disponíveis para o comparativo; a trava é a T1 Cegueira, recomendar Dashboard de Decisão antes de qualquer outra ação

## Usage

```
@roi-analyst use skill benchmark-funil {cliente}
```

Executar na fase de diagnóstico (Identificar) e nos check-ins do ciclo de 90 dias.

## Reference

- Benchmarks de referência e Método 2 de diagnóstico: `data/fabrica-de-receita-kb.md`
- Benchmarks, princípios ROI-first e as 9 Leis do Marketing (Cientista de Marketing): `data/revenue-principles.md`
- BR-007 (benchmarks de funil como referência, non-blocking): `squad.yaml` business_rules
- Handoff: travas candidatas → skill `diagnostico-8-travas` (confirmação com regra 2 de 3)
