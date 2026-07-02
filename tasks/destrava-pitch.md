---
task: Destrava Pitch
responsavel: "@destrava-receita-consultant"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - empresa: Nome da empresa e segmento
  - diagnostico_resumo: Principais travas identificadas e dados-chave
  - faturamento_mensal: Faturamento atual (R$)
  - produto_recomendado: DR-X, DR-O, DR-T ou DR-E
  - audiencia_pitch: Para quem sera apresentado (CEO, CMO, board)
Saida: |
  - deck_diagnostico: Deck de diagnostico formatado para apresentacao
  - calculo_roi: Calculo de ROI personalizado para a empresa
  - proposta: Proposta clara com produto, investimento e entregaveis
  - material_followup: Material de follow-up pos-apresentacao
Checklist:
  - "[ ] Diagnostico apresentado com dados e fluxo visual"
  - "[ ] Trava critica destacada com impacto financeiro calculado"
  - "[ ] Proposta com produto recomendado e ROI projetado"
  - "[ ] Material de follow-up preparado"
---

# Task: destrava-pitch

**Agent:** @fabrica-de-receita-master (Fabio) | @destrava-receita-consultant (Dara)
**Trigger:** `*destrava-pitch`
**Objetivo:** Apresentar diagnóstico e recomendação no estilo Destrava Receita para uma empresa

---

## Pré-requisito

Discovery ou diagnóstico prévio da empresa (via `*diagnostico` ou `*discovery`).

```yaml
elicit: true
fields:
  - empresa: "Nome da empresa e segmento"
  - diagnostico_resumo: "Principais travas identificadas e dados-chave"
  - faturamento_mensal: "Faturamento atual (R$)"
  - produto_recomendado: "DR-X, DR-O, DR-T ou DR-E?"
  - audiencia_pitch: "Para quem será apresentado? (CEO, CMO, board?)"
```

---

## Execução

### ABERTURA: O Diagnóstico do Médico

```markdown
**Formato:** Começar com dados, não com produto.

Script de abertura:
"Analisei o seu negócio. Vou ser direto sobre o que encontrei.

Vocês têm uma empresa com [potencial/produto/mercado] forte.
Mas existe uma trava que está limitando o crescimento.

Deixa eu mostrar o que os dados estão dizendo."
```

---

### BLOCO 1: O Estado da Fábrica

```markdown
## O Estado da sua Fábrica de Receita

[Nome da Empresa] hoje:
- Faturamento: R$ [X]/mês
- O fluxo de receita de vocês parece assim:

[EXPOR O FLUXO VISUAL]
[10.000 impressões] → [500 visitas] → [50 leads] → [10 MQLs] → [3 clientes]

O que chama atenção:
→ [Etapa com maior acúmulo]
→ [Taxa pior vs benchmark]
→ [Principal anomalia nos dados]
```

---

### BLOCO 2: As Travas Identificadas

```markdown
## As 8 Travas: Diagnóstico

[Apresentar score de cada trava como termômetro visual]

🔴 CRÍTICA: [NOME DA TRAVA]: Score [X]/10
🟡 ATENÇÃO: [NOME DA TRAVA]: Score [X]/10
🟢 SAUDÁVEL: [TRAVAS]: Score [X]/10

[Destaque visual na trava crítica]
```

---

### BLOCO 3: A Trava que Está Cobrando o Pior Preço

```markdown
## A Trava Crítica: [NOME]

Evidência 1: [dado concreto]
Evidência 2: [comparação com benchmark]
Evidência 3: [resultado do impulso controlado]

**O que isso significa em dinheiro:**
Hoje, com a Trava de [NOME] ativa, vocês estão perdendo:

Cenário conservador: R$ [X]/mês em receita não capturada
Cenário moderado: R$ [Y]/mês
Cenário otimista: R$ [Z]/mês

Em 12 meses, isso representa R$ [X × 12] deixados na mesa.
```

---

### BLOCO 4: O Que Acontece se Destravar

```markdown
## O Que Acontece ao Destravar a [TRAVA]

[Antes vs Depois no funil]

HOJE:
[X leads] → [Y vendas] → R$ [faturamento atual]

COM A TRAVA RESOLVIDA (cenário moderado):
[X leads] → [Y×1.5 vendas] → R$ [faturamento + 40%]

Não é magia. É método científico aplicado a um gargalo específico.
```

---

### BLOCO 5: A Metodologia (Como Chegamos Aqui)

```markdown
## Como a V4 Destrava Receita

Não é consultoria tradicional. É ciência aplicada:

1. DIAGNOSTICAMOS as 8 travas do seu sistema de receita
2. IDENTIFICAMOS a trava de maior impacto agora
3. APLICAMOS o Framework STEP para destravá-la
4. EXECUTAMOS em ciclos de 90 dias com metas claras
5. RECOMEÇAMOS para a próxima trava

Em 12 meses: 4 travas resolvidas.
Em 36 meses: seu sistema de receita transformado.
```

---

### BLOCO 6: A Proposta

```markdown
## O Que Recomendo para Vocês

[Produto recomendado: DR-X / DR-O / DR-T / DR-E]

**Por que este produto:**
[Justificativa baseada no diagnóstico e no perfil da empresa]

**O que vocês recebem:**
[Listar entregáveis específicos do produto recomendado]

**Investimento:**
R$ [valor] por [período]

**ROI projetado:**
Investimento: R$ [X]
Receita adicional conservadora: R$ [Y]
ROI: [Y/X × 100]%
Payback: [X / (Y/12)] meses

**Garantia V4:**
→ Garantia de Entrada: validamos se você está pronto antes de começar
→ Cashback de Crescimento: se as metas não forem atingidas, devolvemos
```

---

### FECHAMENTO: A Decisão

```markdown
## A Escolha de Vocês

Opção A: Continuar como está:
A Trava de [NOME] continuará cobrando R$ [X]/mês.
Em 12 meses: R$ [X × 12] deixados na mesa.
Não há custo imediato, mas há custo de oportunidade.

Opção B: Destrava Receita:
Investimento: R$ [produto]
Retorno esperado: R$ [ROI calculado]
Prazo para ver resultado: [X dias/meses]

A pergunta não é "podemos pagar isso?"
A pergunta é: "podemos nos dar ao luxo de não resolver isso?"

[PRÓXIMOS PASSOS SE ACEITAR]
```

---

## Outputs

- Deck de diagnóstico completo formatado para apresentação
- Cálculo de ROI personalizado para a empresa
- Proposta clara com produto, investimento e entregáveis
- Material de follow-up pós-apresentação
