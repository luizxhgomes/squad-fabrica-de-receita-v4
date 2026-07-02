---
task: Trava Identificacao
responsavel: "@diagnosticador"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - dados_diagnostico: Resumo dos dados disponiveis ou resultado do diagnostico
  - restricao_recursos: Capacidade de execucao do time (alta/media/baixa)
  - urgencia: Pressao de prazo (captacao, temporada, evento)
Saida: |
  - declaracao_trava: Declaracao formal da trava critica com justificativa
  - simulacao_impacto: Simulacao de impacto financeiro em 3 cenarios
  - kpi_sucesso: KPI de sucesso definido para o ciclo de 90 dias
  - lista_nao_fazer: Lista explicita do que NAO sera atacado
  - input_step: Input para step-plan e ciclo-90d
Checklist:
  - "[ ] Hierarquia das 8 travas aplicada corretamente"
  - "[ ] 3 filtros de decisao verificados (causalidade, capacidade, mensurabilidade)"
  - "[ ] Impacto estimado em 3 cenarios (conservador, moderado, otimista)"
  - "[ ] Trava critica declarada com evidencias e KPI de sucesso"
---

# Task: trava-identificacao

**Agent:** @fabrica-de-receita-master (Fabio)
**Trigger:** `*trava-critica`
**Objetivo:** Identificar a ÚNICA trava crítica a atacar no ciclo atual: com rigor científico

---

## Pré-requisito

Idealmente executar após `*diagnostico`. Se não houver diagnóstico prévio,
coletar dados mínimos para a análise.

```yaml
elicit: true
fields:
  - dados_diagnostico: "Resumo dos dados disponíveis (ou resultado do *diagnostico)"
  - restricao_recursos: "Qual a capacidade de execução do time? (alta/média/baixa)"
  - urgencia: "Existe pressão de prazo? (captação, temporada, evento)"
```

---

## Execução

### PASSO 1: Aplicar a Hierarquia das Travas

```
Regra de Ouro: Resolver sempre da trava de MAIOR impacto para MENOR.

Hierarquia obrigatória (da mais crítica para a menos crítica):
1. CEGUEIRA: Se não há dados, nada mais funciona
2. RETENÇÃO: Perder clientes caros é dupla penalidade
3. DECISÃO: Todo investimento em funil se perde aqui
4. COMPROMISSO: Intenção existia, foi perdida por fricção
5. QUALIFICAÇÃO: Eficiência do pipeline
6. INTERESSE: Topo do funil qualificado
7. ATENÇÃO: Engajamento com a mensagem
8. EXPOSIÇÃO: Visibilidade básica

NUNCA pule uma trava de maior impacto para atacar uma de menor.
Exemplo: Otimizar Exposição quando o problema é Retenção = desperdício.
```

### PASSO 2: Aplicar Filtros de Decisão

Para a trava candidata identificada, verificar:

**Filtro 1: Causalidade confirmada?**
```
→ A trava tem evidências de dados (não de feeling)?
→ Pelo menos 2 dos 3 métodos de diagnóstico confirmam?
Se NÃO → Precisamos de mais dados antes de confirmar
```

**Filtro 2: Capacidade de execução?**
```
→ O time tem recursos para atacar essa trava agora?
→ As ferramentas necessárias existem ou são acessíveis?
Se NÃO → Avaliar a próxima trava na hierarquia
```

**Filtro 3: Impacto mensurável?**
```
→ É possível definir uma métrica clara de sucesso?
→ Conseguimos medir a melhoria em 90 dias?
Se NÃO → Refinar a definição antes de prosseguir
```

### PASSO 3: Calcular Impacto Estimado

```
Para a trava identificada, simular:

Cenário Conservador (20% de melhoria na métrica da trava):
→ Nova taxa de conversão nessa etapa = [atual + 20%]
→ Impacto em receita adicional = [cálculo em R$]

Cenário Moderado (40% de melhoria):
→ Nova taxa = [atual + 40%]
→ Impacto = [cálculo em R$]

Cenário Otimista (dobrar a métrica):
→ Nova taxa = [atual × 2]
→ Impacto = [cálculo em R$]
```

### PASSO 4: Declarar a Trava Crítica

**Formato de Declaração:**

```markdown
## Trava Crítica do Ciclo: [NOME DA TRAVA]

**Por que esta trava agora:**
[Argumento baseado em dados e hierarquia]

**Evidências que confirmam:**
- [Evidência 1: dado concreto]
- [Evidência 2: benchmark comparado]
- [Evidência 3: teste de impulso controlado]

**Impacto estimado ao destravar:**
- Conservador: +R$ [X]/mês
- Moderado: +R$ [Y]/mês
- Otimista: +R$ [Z]/mês

**Métrica de sucesso do ciclo 90 dias:**
[KPI específico] de [baseline atual] para [meta]

**O que NÃO faremos neste ciclo:**
[Listar outras travas que ficam para depois: manter foco]
```

---

## Outputs

- Declaração formal da trava crítica com justificativa baseada em dados
- Simulação de impacto financeiro em 3 cenários
- KPI de sucesso definido para o ciclo de 90 dias
- Lista explícita do que NÃO será atacado (gestão do foco)
- Input para `*step-plan` e `*ciclo-90d`
