---
name: toc-aplicada
description: |
  Teoria das Restrições (TOC) aplicada ao sistema de receita. Recebe o
  funil mapeado com métricas e devolve a hipótese de constraint (trava
  governante) com os 5 focusing steps aplicados, usando as ferramentas
  CRT, Evaporating Cloud, FRT e Negative Branch, e a lógica de
  subordinação de todo o sistema à trava ativa.
inputs:
  - funil_mapeado: "etapas do funil de receita com volumes por etapa"
  - metricas: "métricas atuais por etapa (conversões, taxas, custos)"
outputs:
  - hipotese_constraint: "trava governante candidata com justificativa"
  - focusing_steps_aplicados: "os 5 passos do focusing process com ações por passo"
wraps:
  - templates/crt-template.md
  - data/8-travas.md
applies_to_qg: QG-002
agent_origin: goldratt
---

# Skill: TOC Aplicada à Receita

## Purpose

Desenvolvida por Eliyahu Goldratt, a TOC parte de uma premissa simples:

> **Todo sistema tem EXATAMENTE 1 restrição que governa seu throughput.**

No contexto de receita: o sistema de vendas tem sempre 1 trava que limita o faturamento. Atacar as demais sem resolver a governante é desperdício. Esta skill aplica o focusing process e as ferramentas lógicas da TOC ao funil mapeado para produzir a hipótese de constraint e o plano de ataque.

## Procedure (5 passos do Focusing Process, adaptado para receita)

```
1. IDENTIFICAR a restrição governante
   → Qual das 8 travas tem o maior impacto?

2. EXPLORAR a restrição ao máximo
   → Extrair tudo que é possível sem investimento adicional

3. SUBORDINAR tudo à restrição
   → Todas as outras áreas servem à resolução da trava

4. ELEVAR a restrição
   → Investir na injeção que remove a trava

5. VOLTAR ao passo 1
   → Após resolver, a restrição muda. Novo ciclo de 90 dias
```

## Ferramentas TOC no DR-X

### CRT, Current Reality Tree
**Objetivo:** mapear a realidade atual (sintomas → causas → causa-raiz)
**Quando:** fase Identificar (D8 a D14), antes do Board 1
**Output:** trava governante confirmada com 4/6 pts ou mais

### Evaporating Cloud (EC)
**Objetivo:** identificar o conflito central que mantém a trava
**Quando:** fase Otimizar (D16 a D21), durante experimentos
**Output:** assunções invalidáveis que liberam a injeção

### FRT, Future Reality Tree
**Objetivo:** mapear como será o sistema APÓS a injeção
**Quando:** Board 2 (D35), antes do GO/NO-GO
**Output:** injeção validada sem Negative Branches

### Negative Branch
**Objetivo:** identificar efeitos indesejáveis da injeção proposta
**Quando:** durante validação da FRT (Board 2)
**Output:** injeções complementares para neutralizar efeitos negativos

## Lógica de Subordinação

Uma vez identificada a trava, as demais áreas DEVEM servir a ela:

```
TRAVA ATIVA: T4 Compromisso (no-show alto)

SUBORDINAÇÃO CORRETA:
  ✓ Marketing foca em qualidade dos leads (para reduzir no-shows)
  ✓ SDRs confirmam fit SPICED antes de agendar (para reduzir no-shows)
  ✓ CS prioriza retenção de clientes atuais (não depende do comercial)

SUBORDINAÇÃO ERRADA (desperdiça recursos):
  ✗ Contratar mais vendedores (não resolve o no-show)
  ✗ Criar novos criativos (tráfego não é o problema)
  ✗ Abrir novo canal de vendas (multiplica o no-show)
```

## Throughput vs Custo Operacional

No DR-X, a lógica de decisão prioriza:
1. **Aumentar Throughput** (receita por cliente × volume): SEMPRE primeira opção
2. **Reduzir Inventário** (leads acumulados sem progresso): segunda opção
3. **Reduzir Custo Operacional:** última opção (corte não resolve trava)

> "Você não resolve um problema de fluxo cortando recursos. Você resolve identificando e removendo o gargalo."

## Output Schema

```yaml
hipotese_constraint:
  trava_candidata: T4
  nome: Compromisso
  evidencia: "show-rate de 55% com pipeline saudável nas etapas anteriores"
  confirmacao_crt: "5/6 pts nos 3 testes"
focusing_steps_aplicados:
  identificar: "CRT construída, trava T4 confirmada"
  explorar: "régua de confirmação ativada sem investimento adicional"
  subordinar: "marketing e SDRs subordinados ao show-rate; lista do que PARA"
  elevar: "injeção definida (investimento aprovado só após explorar)"
  voltar_ao_passo_1: "gatilho: platô do KPI ou trava resolvida"
ferramentas_usadas: [CRT, EC, FRT, negative_branch]
```

## Verdict Logic

- CONSTRAINT_CONFIRMADA: CRT com trava governante pontuando 4/6 ou mais nos 3 testes; seguir para o ciclo de 90 dias
- HIPOTESE_FRACA: pontuação abaixo de 4/6; coletar mais dados antes do Board 1 (se faltam dados, a trava é a T1 Cegueira)
- NOVO_CICLO: trava resolvida ou KPI em platô; voltar ao passo 1 sem assumir que o diagnóstico anterior continua válido

## Usage

```
@goldratt use skill toc-aplicada {funil}
```

Usar na fase de diagnóstico, antes de qualquer plano de execução ou investimento.

## Reference

- Template da CRT com exemplo preenchido e validação: `templates/crt-template.md`
- Taxonomia das 8 travas + 3 testes de confirmação: `data/8-travas.md`
- Aprofundamento do método (LTP, IOMAP, vacinação): skill `ltp-arvores-logicas`
- Handoff: constraint confirmada → skill `ciclo-90-dias`
