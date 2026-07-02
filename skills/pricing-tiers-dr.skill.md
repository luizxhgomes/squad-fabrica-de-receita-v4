---
name: pricing-tiers-dr
description: |
  Recomendação de produto do portfólio Destrava Receita (DR-X, DR-O,
  DR-T, DR-E) por fit e tier, a partir do score de ICP, da dor e da
  urgência do prospect. Zero preços neste repositório: investimento é
  sempre "sob consulta comercial". Devolve o produto recomendado, a
  justificativa e o próximo passo comercial.
inputs:
  - score_icp: "score 0-14 vindo da skill icp-scoring"
  - dor: "dor primária identificada (sintoma + trava mais provável)"
  - urgencia: "gatilho de urgência (critical event) identificado"
outputs:
  - produto_recomendado: "DR-X | DR-O | DR-T | DR-E"
  - justificativa: "fit do prospect com a ficha do produto"
  - proximo_passo: "ação comercial concreta"
wraps:
  - data/fabrica-de-receita-kb.md
  - data/icp-destrava.md
applies_to_qg: QG-002
agent_origin: destrava-receita-consultant
---

# Skill: Pricing Tiers DR

## Purpose

Mapear o prospect qualificado para o produto certo do portfólio Destrava Receita. A recomendação é por fit e tier, nunca por preço: valores não fazem parte deste repositório (BR-006, blocking). Toda resposta sobre investimento é "sob consulta comercial, definido em proposta".

## Fichas dos 4 produtos (tiers)

### DR-X, Destrava Raio-X (tier de entrada)
- **Formato:** projeto de diagnóstico de 45 dias
- **Elimina:** T1 Cegueira
- **Entregáveis:** diagnóstico completo das 8 travas, mapeamento do fluxo de receita, estratégia posicionada (onde atacar primeiro), plano de ação de 90 dias
- **Garantia de valor:** se ao final da apresentação do plano o cliente não enxergar valor superior ao investimento, devolução de 100%
- **Para quem:** empresas que precisam de clareza antes de escalar
- **Resultado esperado:** clareza total sobre onde está o gargalo principal

### DR-O, Destrava Operacional (tier operacional)
- **Formato:** recorrência anual
- **Recursos:** Community Manager + 4 grupos de trabalho + 12 encontros síncronos
- **Ritmo:** 1 trava por ciclo de 90 dias, 4 travas por ano
- **Para quem:** empresas que querem estrutura de accountability para execução (tipicamente quem já fez o DR-X)

### DR-T, Destrava Tático (tier tático)
- **Formato:** recorrência anual
- **Recursos:** tudo do DR-O + Growth Planner dedicado + SLA de resposta de 24h
- **Diferencial:** ritmo 50% mais rápido que o DR-O
- **Para quem:** empresas que concluíram ciclo DR-O e precisam de velocidade com direção estratégica dedicada

### DR-E, Destrava Estratégico (tier estratégico)
- **Formato:** recorrência anual
- **Recursos:** tudo do DR-T + acesso C-Level + especialistas opcionais + SLA de resposta de 12h
- **Diferencial:** ritmo 75% mais rápido que o DR-O
- **Para quem:** scale-ups e empresas com faturamento acima de 200 mil reais por mês

## Procedure

### Check 1: Gate anti-ICP (blocking)
Desqualificar imediatamente se qualquer flag estiver presente:
- Faturamento abaixo de 50 mil reais por mês (não tem escala para as travas)
- Está no 1º ano de operação (produto não validado)
- Modelo 100% indicação (sem processo comercial)
- Quer terceirizar execução (DR-X não é body shop)
- CEO quer resultado sem envolvimento (DR-X requer GT ativo)
- Budget incompatível com o tier de entrada
- Setor: MLM, esquema de pirâmide, gambling

### Check 2: Classificar o score de ICP
- 10 a 14: ICP perfeito, prioridade máxima
- 6 a 9: bom fit, avançar com qualificação adicional
- Abaixo de 6: mau fit, não avançar, redirecionar

### Check 3: Mapear dor e histórico para o tier
- Dor de direção ("não sabemos onde está o gargalo", nunca fez diagnóstico estruturado) → **DR-X**
- Já fez DR-X e precisa de accountability para implementar as injeções → **DR-O**
- Concluiu ciclo DR-O e precisa de velocidade com Growth Planner dedicado → **DR-T**
- Scale-up que exige acesso C-Level, especialistas e SLA agressivo → **DR-E**

### Check 4: Urgência define o próximo passo
- Alta (evento crítico em menos de 60 dias): agendar reunião de proposta imediata com o decisor presente
- Média: enviar case do segmento + reunião em até 2 semanas
- Baixa: nutrição, reavaliar no próximo trimestre

### Check 5: Política de investimento (BR-006)
- Nunca informar valores, nem estimativas, nem faixas
- Resposta padrão: "investimento sob consulta comercial, definido em proposta"
- Ancoragem permitida: garantia de valor do DR-X e custo de inação da trava (quantificado no SPICED)

## Output Schema

```yaml
produto_recomendado: DR-X
tier: entrada
justificativa: "score ICP 12/14; dor de direção (não sabe o gargalo); nunca fez diagnóstico estruturado"
investimento: "sob consulta comercial"
proximo_passo: "agendar reunião de proposta com decisor presente (evento crítico em 45 dias)"
flags_anti_icp: []
```

## Verdict Logic

- RECOMENDADO: score 10 ou mais + dor mapeada para 1 tier único + zero flags anti-ICP
- FIT_CONDICIONAL: score de 6 a 9; completar o SPICED (dor e impacto quantificados) antes de propor o tier
- DESQUALIFICADO: score abaixo de 6 OU qualquer flag anti-ICP acionada; não avançar, redirecionar

## Usage

```
@destrava-receita-consultant use skill pricing-tiers-dr {prospect}
```

Executar após o `icp-scoring` e o `spiced-framework`, antes da proposta comercial.

## Reference

- Fichas técnicas dos produtos DR e garantias: `data/fabrica-de-receita-kb.md`
- ICP principal, secundário, terciário e anti-ICP: `data/icp-destrava.md`
- BR-006 (zero preço de produto no repositório, blocking): `squad.yaml` business_rules
- Upstream: skill `icp-scoring` (score) e skill `spiced-framework` (dor + impacto)
