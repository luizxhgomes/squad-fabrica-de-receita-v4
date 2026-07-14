---
task: Growth Experiment Framework
responsavel: "@growth-strategist"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - pilar_v4: Pilar onde o experimento se encaixa
  - hipotese: Hipótese do experimento
  - metrica_primaria: Métrica principal de sucesso
Saida: |
  - experiment_brief: Brief completo do experimento
  - ice_score: Pontuação ICE de prioridade
  - execution_plan: Plano de execução
  - success_criteria: Critérios de sucesso mensuráveis
Checklist:
  - "[ ] Hipotese formulada no formato Se/Entao/Porque"
  - "[ ] ICE Score calculado (Impact, Confidence, Ease)"
  - "[ ] Criterios de sucesso mensuraveis definidos"
  - "[ ] Plano de execucao com duracao e sample size"
elicit: true
---

# *experiment: Criar Experimento de Growth

Framework científico para criação, priorização e execução de experimentos
baseado na metodologia do Cientista do Marketing.

## Template de Experimento

```markdown
# Experimento #[ID]: [Nome Curto]

## Hipótese
**Se** [mudança proposta]
**Então** [resultado esperado]
**Porque** [raciocínio baseado em dados/teoria]

## Pilar
[ ] Tráfego [ ] Engajamento [ ] Conversão [ ] Retenção

## ICE Score
- Impact (1-10): [Qual o impacto se der certo?]
- Confidence (1-10): [Quão confiante estamos na hipótese?]
- Ease (1-10): [Quão fácil é executar?]
- **ICE Total: [média] → Prioridade: Alta/Média/Baixa**

## Métricas
- **Primária:** [Métrica que define sucesso/fracasso]
- **Secundárias:** [Métricas de suporte]
- **Guardrails:** [Métricas que não podem piorar]

## Critério de Sucesso
**WIN se:** [métrica primária] melhora X% com significância ≥ 95%
**FAIL se:** [métrica primária] piora ou não melhora com X dias de dados

## Execução
- **Duração:** [mínimo para significância estatística]
- **Sample size:** [cálculo de tamanho de amostra]
- **Variante A (controle):** [o que existe hoje]
- **Variante B (teste):** [o que vamos testar]
- **Responsável:** [@agente]
- **Launch date:** [data]

## Resultado
- **Data de análise:** [data]
- **Resultado:** WIN / FAIL / INCONCLUSIVO
- **Dados:** [números]
- **Decisão:** [escalar / descartar / iterar]
- **Aprendizado:** [insight para próximos experimentos]
```

## ICE Scoring para Priorização

```
Backlog de Experimentos ordenado por ICE Score:

| Rank | Experimento | Impact | Confidence | Ease | ICE | Pilar |
|------|-------------|--------|------------|------|-----|-------|
| 1 | [nome] | 9 | 8 | 7 | 8.0 | Conversão |
| 2 | [nome] | 8 | 6 | 9 | 7.7 | Tráfego |
...

Regra: Sempre atacar top 3 do backlog. Nunca ter mais de 3 experimentos simultâneos.
```