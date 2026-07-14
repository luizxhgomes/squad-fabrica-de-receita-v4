---
name: spiced-framework
description: |
  Framework SPICED de qualificação comercial (Situation, Pain, Impact,
  Critical Event, Decision). Transforma notas de discovery em canvas
  SPICED preenchido, com score de qualificação auditado por dimensão.
  Regra de ouro: nunca prescrever sem diagnosticar. O SPICED É o
  diagnóstico.
inputs:
  - notas_discovery: "anotações brutas das conversas de discovery com o lead"
outputs:
  - canvas_spiced: "5 dimensões preenchidas (S, P, I, C, D) com dados concretos"
  - score_qualificacao: "escala 1-10 por dimensão + checklist de auditoria"
wraps:
  - templates/spiced-template.md
applies_to_qg: QG-002
agent_origin: especialista-spiced
---

# Skill: SPICED Framework

## Purpose

Framework de qualificação comercial que estrutura o diagnóstico do cliente antes de qualquer proposta. Cada letra representa uma dimensão essencial:

| Letra | Componente | Pergunta-guia |
|-------|------------|---------------|
| **S** | Situação | O que preciso saber para entender se este cliente tem o perfil certo? |
| **P** | Pain (Dor) | Por que o cliente parou o que estava fazendo para falar comigo? |
| **I** | Impacto | O que muda na vida ou no bolso do cliente? |
| **C** | Critical Event | Existe algo que obriga o cliente a decidir AGORA? |
| **D** | Decisão | Quem dá a palavra final e como avaliam sucesso? |

### Filosofia central: a analogia médica

```
PACIENTE → MÉDICO RUIM vs MÉDICO BOM

Paciente: "Doutor, preciso de remédio para dor de cabeça"
Médico ruim: prescreve analgésico
Médico bom: investiga → descobre estresse crônico → trata a causa

VENDAS FUNCIONA IGUAL:
Sintoma = o que o cliente DIZ ("preciso de mais leads")
Doença = a dor REAL ("não consigo converter os leads que já tenho")
Remédio = a solução CERTA (otimizar conversão, não gerar mais tráfego)
```

> **Regra de ouro:** nunca prescreva sem diagnosticar. O SPICED É o diagnóstico.

## Procedure

### Passo 1, S: Situação

**Objetivo:** mapear o cenário atual do cliente ANTES de qualquer proposta.

**Pergunta de ouro:** "Me conta um pouco sobre como funciona a operação de marketing de vocês hoje?"

| Dimensão | Perguntas |
|----------|-----------|
| **Investimento** | Quanto investe em marketing/mídia? Qual % do faturamento? |
| **Equipe** | Quantas pessoas na equipe? Tem gestor dedicado? |
| **Canais** | Quais canais usa? Google, Meta, orgânico, indicação? |
| **Histórico** | Já trabalhou com agência? Como foi a experiência? |
| **Maturidade** | Tem CRM? Processo comercial estruturado? |
| **Números** | Faturamento, ticket médio, quantidade de clientes? |

**Exercício de síntese:** preencha: _"[Empresa] é do segmento [X], fatura R$[Y]/mês, tem [Z] pessoas no marketing, investe R$[W]/mês em mídia paga em [canais]. Já trabalhou com [agência] e a experiência foi [resultado porque...]."_

**Red flags na Situação:**
- Cliente não sabe quanto investe → maturidade baixa, venda mais educacional
- Já trocou de agência 3x em 2 anos → expectativa desalinhada ou problema interno
- Não tem CRM → precisa de infraestrutura antes de performance

### Passo 2, P: Pain (Dor)

**Objetivo:** encontrar a DOR REAL, não a necessidade superficial.

**Pergunta de ouro:** "O que te fez buscar ajuda externa agora? O que mudou?"

**Necessidade vs. Dor Real:**

| Necessidade (superficial) | Dor (real) |
|---------------------------|------------|
| "Preciso de mais leads" | "Equipe comercial ociosa, custo fixo me corroendo" |
| "Quero melhorar meu site" | "Perco vendas porque abandonam no checkout" |
| "Preciso de uma agência" | "Tentei sozinho e perdi R$[X] sem resultado" |
| "Quero redes sociais" | "Concorrente está roubando meus clientes no Instagram" |

**As 3 Dores Universais:**
1. **Falta de resultado:** não está crescendo como deveria
2. **Falta de previsibilidade:** não sabe de onde vem o próximo cliente
3. **Falta de controle:** depende de 1 pessoa/canal e isso é arriscado

**Técnica de aprofundamento (5 Porquês adaptado):**

```
Cliente: "Preciso de mais leads"
→ "Por que mais leads é prioridade agora?"
Cliente: "Porque as vendas caíram"
→ "Caíram quanto? Desde quando?"
Cliente: "30% nos últimos 3 meses"
→ "O que mudou 3 meses atrás?"
Cliente: "Nosso melhor vendedor saiu e levou a carteira"

DOR REAL: dependência de pessoa-chave, não falta de leads
SOLUÇÃO CERTA: processo comercial escalável, não mais tráfego
```

**Perguntas de aprofundamento:**
- "O que acontece se você NÃO resolver isso?"
- "Há quanto tempo isso é um problema?"
- "Já tentou resolver antes? O que aconteceu?"
- "Se eu entendi bem, o principal problema é... certo?"

### Passo 3, I: Impacto

**Objetivo:** quantificar o que muda se resolver (ou não resolver) o problema.

**Pergunta de ouro:** "Você consegue estimar quanto está deixando na mesa por não ter resolvido isso?"

**Framework G-E-M:**

| Tipo | Pergunta | Exemplo |
|------|----------|---------|
| **Ganhar** | Quanto de receita/clientes a mais? | "Se dobrássemos leads qualificados, quanto a mais de faturamento?" |
| **Economizar** | Quanto perde hoje? | "Quanto custa cada mês sem resolver?" |
| **Melhorar** | O que melhora na operação? | "Como seria sua rotina se estivesse resolvido?" |

**Impacto Racional vs. Emocional:**

| Racional (justifica a compra) | Emocional (motiva a compra) |
|-------------------------------|----------------------------|
| R$[X]/mês em receita potencial | CEO frustrado com estagnação |
| 30% de redução no CAC | Medo de perder mercado para concorrente |
| ROI de 3x em 6 meses | Pressão do board/investidores |
| 40h/mês economizadas em operação | Noites mal dormidas com caixa |

> **Insight:** o emocional vende mais que o racional, mas o racional justifica a compra. Você precisa dos 2.

**Fórmula de quantificação:**
```
Impacto mensal = (Receita potencial perdida) + (Custo operacional do problema)
Impacto anual = Impacto mensal × 12
ROI da solução = Impacto anual / Investimento proposto

Ex: "Cada mês sem resolver custa R$[A] em leads desperdiçados + R$[B]
em hora ociosa da equipe. São R$[A+B]/mês, R$[12 × (A+B)]/ano. Nosso
investimento de R$[I]/mês retorna [ROI]x."
```

### Passo 4, C: Critical Event (Evento Crítico)

**Objetivo:** identificar o que torna a decisão URGENTE.

**Pergunta de ouro:** "Tem alguma data ou evento que faz isso ser prioridade agora?"

**Tipos de evento crítico:**

| Tipo | Exemplos |
|------|----------|
| **Data comercial** | Black Friday, Natal, Dia das Mães, volta às aulas |
| **Corporativo** | Reunião de board, apresentação a investidores, planejamento anual |
| **Contratual** | Fim de contrato com agência/fornecedor atual |
| **Meta** | Deadline de meta trimestral/anual, OKR review |
| **Mercado** | Concorrente lançou produto, nova regulação do setor |
| **Pessoal** | Novo CEO/CMO quer mostrar resultado rápido, promoção em jogo |

**Se NÃO há evento crítico, crie urgência com dados:**

```
"A cada mês sem resolver, são R$[X] deixados na mesa"
"Seu concorrente [Y] já está fazendo isso desde [data]"
"A temporada de [Z] começa em [N] semanas. Se começar agora, dá tempo"
"O custo de NÃO decidir é R$[X]/mês acumulando"
```

**Timeline reversa:**
```
Evento: Black Friday (29/Nov)
- Campanhas precisam rodar há 30 dias → 29/Out
- Setup e otimização levam 15 dias → 14/Out
- Onboarding leva 7 dias → 7/Out
- Decisão e contrato: 3 dias → 4/Out

→ "Para estar pronto na Black Friday, a decisão precisa acontecer até 4/Out"
```

### Passo 5, D: Decisão

**Objetivo:** mapear COMO a decisão será tomada e por QUEM.

**Pergunta de ouro:** "Como funciona o processo de decisão de vocês para esse tipo de investimento?"

**Mapa de stakeholders:**

| Papel | Pergunta para identificar | Interesse principal |
|-------|--------------------------|---------------------|
| **Decisor** | "Quem assina o contrato?" | ROI, resultado, crescimento |
| **Influenciador** | "Quem opina tecnicamente?" | Qualidade, método, viabilidade |
| **Campeão** | "Quem vai defender isso internamente?" | Reconhecimento, resultado pessoal |
| **Bloqueador** | "Alguém pode vetar?" | Risco, compliance, budget |
| **Financeiro** | "Quem controla o orçamento?" | Custo, prazo de retorno |

**Processo decisório típico:**

```
1. Apresentação → Campeão/Influenciador
2. Proposta formal → Decisor
3. Análise financeira → Financeiro
4. Aprovação jurídica → Bloqueador (se houver)
5. Assinatura → Decisor
```

**Critérios comuns de decisão:**
1. **Preço/investimento:** cabe no budget?
2. **Cases de sucesso:** tem resultado no meu segmento?
3. **Tempo para resultado:** quando vejo o primeiro retorno?
4. **Metodologia:** o que diferencia de outras opções?
5. **Garantias:** tem cláusula de performance? SLA?

**Red flags no processo decisório:**

| Sinal | Significado real | Ação |
|-------|-----------------|------|
| "Vou pensar e te retorno" | Não mapeou todos os stakeholders | Pergunte: "Além de você, quem precisa aprovar?" |
| "Me manda uma proposta" | Não demonstrou valor suficiente | Volte ao Impacto antes de propor |
| "Preciso consultar meu sócio" | O decisor real não está na mesa | Peça reunião com ambos |
| "Estou comparando com outros" | Não diferenciou suficientemente | Use battle card, mostre cases |
| "O preço está alto" | Não conectou preço ao impacto | Reframe: "R$[investimento] vs R$[impacto perdido]/mês" |

### Passo 6: Auditoria do canvas SPICED

**Escala de qualidade (1-10):**

| Nota | Nível | Descrição |
|------|-------|-----------|
| 1-3 | Fraco | Superficial, genérico, sem dados concretos |
| 4-6 | Adequado | Tem informações mas falta profundidade ou quantificação |
| 7-8 | Bom | Dados específicos, insights relevantes, quantificado |
| 9-10 | Excelente | Diagnóstico completo, quantificado, stakeholders mapeados |

**Checklist de auditoria rápida:**

```
□ S: Tem dados quantitativos? (faturamento, equipe, investimento)
□ P: Diferencia necessidade vs. dor real? Aprofundou além do sintoma?
□ I: Quantificou em R$ ou %? Tem impacto racional E emocional?
□ C: Identificou data/evento específico? Tem deadline real?
□ D: Mapeou 2 ou mais stakeholders? Identificou processo decisório?
□ GERAL: A dor conecta logicamente com a situação?
□ GERAL: O impacto é consequência direta da dor?
□ GERAL: A solução proposta resolve a doença, não o sintoma?
```

**Erros comuns:**

| Erro | Exemplo | Correção |
|------|---------|----------|
| Situação vaga | "Empresa de tecnologia" | "SaaS B2B, 50 func., R$[Y] de MRR, 15% churn" |
| Dor = necessidade | "Precisa de mais leads" | "Equipe ociosa, CAC subiu 40% em 6 meses" |
| Impacto não quantificado | "Está perdendo dinheiro" | "R$[X]/mês em receita potencial perdida" |
| Sem evento crítico | (campo vazio) | "Board review em 45 dias, precisa de plano" |
| Decisor não mapeado | "O marketing decide" | "CEO (final) + CFO (budget) + CMO (campeão)" |

## SPICED no Funil do DR-X

### Quando aplicar

| Etapa do funil | SPICED usado | Profundidade |
|---------------|--------------|-------------|
| **SDR/BDR** (prospecção) | S + P parcial | Superficial, qualifica fit |
| **Closer** (reunião 1) | S + P + I completos | Profundo, diagnóstico completo |
| **Closer** (reunião 2) | C + D | Decisório, urgência e processo |
| **Proposta** | SPICED completo revisado | Validação final antes de propor |
| **Onboarding** | SPICED como briefing | Transferência de contexto para operação |

### SPICED → Proposta

O SPICED bem feito gera a proposta sozinho:

```
SITUAÇÃO → Seção "Sobre o cliente" da proposta
DOR → Seção "Diagnóstico / Desafios identificados"
IMPACTO → Seção "Oportunidade / ROI projetado"
EVENTO CRÍTICO → Seção "Timeline / Urgência"
DECISÃO → Seção "Próximos passos / Processo"
```

## Exercícios Práticos

### Exercício 1: Traduza necessidade em dor
Para cada frase do cliente, encontre a dor real:
1. "Preciso de um site novo" →?
2. "Quero investir em Google Ads" →?
3. "Preciso contratar uma agência" →?
4. "Quero mais seguidores no Instagram" →?

### Exercício 2: Quantifique o impacto
Para um cliente que fatura R$[F]/mês:
- Se resolver a dor, quanto ele GANHA a mais? →?
- Se NÃO resolver, quanto PERDE por mês? →?
- Qual a MELHORIA operacional? →?

### Exercício 3: Roleplay de discovery
Simule uma call de 15 minutos usando SPICED:
- 3 min → Situação (rapport + mapeamento)
- 5 min → Dor (aprofundamento, 5 porquês)
- 3 min → Impacto (quantificação G-E-M)
- 2 min → Evento Crítico (urgência)
- 2 min → Decisão (stakeholders + processo)

## Output Schema

```yaml
canvas_spiced:
  situacao:
    faturamento: "R$[Y]/mês"
    ticket_medio: "R$[T]"
    equipe: 0
    canais: []
    crm: sim | nao
    historico_agencias: ""
  dor:
    dor_real: ""
    etapa_maior_perda: ""
    tentativas_anteriores: ""
    consequencia_inacao: ""
  impacto:
    mensal: "R$[X]/mês"
    anual: "R$[12X]/ano"
    racional: ""
    emocional: ""
  evento_critico:
    tipo: data_comercial | corporativo | contratual | meta | mercado | pessoal
    data: ""
    deadline_decisao: ""
  decisao:
    decisor: ""
    influenciadores: []
    campeao: ""
    bloqueador: ""
    processo: ""
score_qualificacao:
  s: 1-10
  p: 1-10
  i: 1-10
  c: 1-10
  d: 1-10
  media: 0.0
checklist_auditoria: "8 itens (aprovado/reprovado por item)"
```

## Verdict Logic

- Média 9-10 (EXCELENTE): diagnóstico completo e quantificado; avançar para proposta
- Média 7-8 (BOM): revisar as dimensões abaixo de 7 antes de propor
- Média 4-6 (ADEQUADO): aprofundar com as perguntas de ouro antes de qualquer proposta
- Média 1-3 (FRACO): refazer o discovery; PROIBIDO propor (regra de ouro: nunca prescrever sem diagnosticar)
- Qualquer item GERAL do checklist reprovado: canvas inconsistente, revisar a cadeia situação → dor → impacto

## Usage

```
@especialista-spiced use skill spiced-framework {lead}
```

Aplicar após toda call de discovery e antes de qualquer proposta ou recomendação de produto.

## Reference

- Script de qualificação, scorecard de 15 pontos e critérios MQL/SAL/SQL: `templates/spiced-template.md`
- Trava T5 Qualificação (leads sem perfil, capacidade ou intenção): `data/8-travas.md`
- Handoff: canvas preenchido → skill `objections-arsenal` (fechamento) e skill `pricing-tiers-dr` (recomendação de produto)
