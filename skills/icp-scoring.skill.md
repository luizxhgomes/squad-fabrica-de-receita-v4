---
name: icp-scoring
description: |
  Scoring de ICP do Destrava Receita. Recebe dados firmográficos e
  situacionais do prospect, pontua 7 critérios de 0 a 2 pontos (score
  final de 0 a 14), classifica o fit e sinaliza flags de anti-ICP que
  desqualificam o avanço independente do score.
inputs:
  - dados_firmograficos: "faturamento, setor, tamanho, tempo de mercado, maturidade digital"
  - dados_situacionais: "estrutura de vendas, investimento em marketing, dados de funil, decisor, urgência, budget"
outputs:
  - score: "0-14"
  - classificacao: "ICP_PERFEITO | BOM_FIT | MAU_FIT"
  - flags_anti_icp: "lista de critérios de exclusão acionados"
wraps:
  - data/icp-destrava.md
applies_to_qg: QG-001
agent_origin: especialista-spiced
---

# Skill: ICP Scoring

## Purpose

Qualificar o prospect contra o perfil de cliente ideal do Destrava Receita antes de investir tempo comercial. O scoring evita a trava T5 (Ruído) dentro do próprio funil DR: comercial gastando energia com curiosos e leads fora do perfil.

## Procedure

### Check 1: Coletar o perfil contra o ICP de referência (DR-X)

Firmográfico:
- Faturamento mensal: de 100 mil a 2 milhões de reais por mês
- Modelo de negócio: B2B ou híbrido (B2B + B2C)
- Setor: Serviços, SaaS, Educação, Saúde, Consultoria, E-commerce B2B
- Tamanho: de 5 a 100 funcionários
- Maturidade digital: 3-4/5 (presença digital, CRM básico ou planilha)
- Tempo no mercado: mínimo 2 anos (produto/serviço validado)

Situacional:
- Estágio: scale-up ou empresa estabelecida estagnada
- Estrutura de vendas: de 1 a 10 vendedores (SDR + closers ou inside sales)
- Investimento mensal em marketing: de 5 mil a 100 mil reais (tem budget, não está começando)
- Situações típicas: "gastamos em tráfego mas as vendas não crescem no mesmo ritmo", "temos leads mas não convertemos", "os vendedores reclamam da qualidade dos leads", "não sabemos onde está o gargalo"

### Check 2: Flags anti-ICP (blocking, desqualificam independente do score)

- Faturamento abaixo de 50 mil reais por mês (não tem escala para as travas)
- Está no 1º ano de operação (produto não validado)
- Modelo 100% indicação (sem processo comercial)
- Quer terceirizar execução (DR-X não é body shop)
- CEO quer resultado sem envolvimento (DR-X requer GT ativo)
- Budget incompatível com o tier de entrada
- Setor: MLM, esquema de pirâmide, gambling

### Check 3: Pontuar os 7 critérios (0 a 2 pontos cada)

| Critério | 0 pts | 1 pt | 2 pts |
|----------|-------|------|-------|
| Faturamento | abaixo de 50 mil reais/mês | de 50 mil a 100 mil reais/mês | acima de 100 mil reais/mês |
| Tempo no mercado | < 1 ano | 1-2 anos | > 2 anos |
| Tem time comercial | Não | 1 vendedor | 2+ vendedores |
| Tem dados do funil | Não | Parcial | Sim (CRM) |
| Decisor na reunião | Não | Influenciador | CEO/CSO |
| Urgência identificada | Não | Média | Alta (evento crítico) |
| Budget disponível | Não | A confirmar | Confirmado |

### Check 4: Classificar o score

```
Score 10-14: ICP PERFEITO, prioridade máxima
Score 6-9:   BOM FIT, avançar com qualificação adicional
Score < 6:   MAU FIT, não avançar, redirecionar
```

### Check 5: Registrar dor e trava provável

- Sintomas típicos do ICP: faturamento estagnado há 3-6+ meses apesar de investimento; CAC crescendo sem crescimento proporcional de receita; time de vendas frustrado com a qualidade dos leads; alta rotatividade em vendas ou CS; "já tentei de tudo e nada resolve"
- Trava mais comum no ICP: T5 Qualificação (apelido Ruído) ou T4 Compromisso (no-show)
- Impacto financeiro médio da dor: de 50 mil a 500 mil reais por ano em oportunidades perdidas

## Output Schema

```yaml
score: 12
detalhe_criterios:
  faturamento: 2
  tempo_mercado: 2
  time_comercial: 2
  dados_funil: 1
  decisor_na_reuniao: 2
  urgencia: 2
  budget: 1
classificacao: ICP_PERFEITO
flags_anti_icp: []
trava_provavel: T5
gatilho_compra: "alta temporada chegando | sócio pressionando | perdeu cliente grande | VP comercial novo"
```

## Verdict Logic

- ICP_PERFEITO (10 a 14): prioridade máxima, agendar discovery imediato
- BOM_FIT (6 a 9): avançar com qualificação adicional (SPICED completo) antes de propor
- MAU_FIT (abaixo de 6): não avançar, redirecionar
- Qualquer flag anti-ICP acionada: DESQUALIFICADO independente do score

## Usage

```
@especialista-spiced use skill icp-scoring {prospect}
```

Executar na triagem de prospecção, antes do discovery SPICED completo.

## Reference

- ICP principal (DR-X), secundário (DR-O), terciário (DR-T), anti-ICP e tabela de scoring: `data/icp-destrava.md`
- Objeções típicas do ICP para preparação do closer: "já tentei consultoria", "não tenho equipe", "o preço é alto", "preciso ver resultado antes" (skill `objections-arsenal`)
- Handoff: score + classificação → skill `pricing-tiers-dr` (recomendação de tier) e skill `spiced-framework` (discovery)
