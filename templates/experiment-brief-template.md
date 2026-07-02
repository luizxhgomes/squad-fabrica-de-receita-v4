# Template: Experiment Brief

> Use este template para documentar qualquer experimento de growth antes de iniciar.
> Preencher ANTES de executar: nunca depois.

---

## Experiment Brief: [NOME DO EXPERIMENTO]

**Data:** [YYYY-MM-DD]
**Autor:** [@agente]
**Status:** Planejando | Em Execução | Concluído | Cancelado
**Pilar V4:** Tráfego | Engajamento | Conversão | Retenção

---

## 1. Hipótese

```
SE [mudança específica]
ENTÃO [resultado esperado]
PORQUE [mecanismo/razão]
```

**Exemplo:**
```
SE trocarmos o CTA da landing page de "Fale Conosco" para "Quero Meu Diagnóstico Gratuito"
ENTÃO a taxa de conversão vai aumentar em ≥20%
PORQUE o CTA específico comunica o valor imediato melhor que o genérico
```

---

## 2. Contexto e Motivação

**Problema identificado:**
[O que está acontecendo hoje que motivou este experimento]

**Dados que motivaram:**
[Métricas atuais que mostram o problema / oportunidade]

**Hipóteses alternativas consideradas:**
1. [Alternativa que foi descartada + motivo]
2. [Alternativa que foi descartada + motivo]

---

## 3. Critérios de Sucesso

**Métrica principal:**
- KPI: [nome da métrica]
- Baseline atual: [valor]
- Meta mínima (sucesso): [valor: mínimo para considerar válido]
- Meta ideal: [valor ideal]

**Métricas de guarda:**
(Métricas que não podem piorar durante o experimento)
- [KPI de guarda 1]: não deve cair abaixo de [threshold]
- [KPI de guarda 2]: não deve cair abaixo de [threshold]

**Critério de falha:**
- O experimento será pausado se: [condição específica]

---

## 4. Setup do Experimento

**Tipo:** A/B Test | Multivariate | Before/After | Cohort
**Tamanho da amostra necessário:** [X usuários / leads / clientes]
**Duração prevista:** [X dias]
**Split:** [50/50 | 70/30 | outro]

**Grupo de Controle:**
[Descrição do que permanece igual / versão atual]

**Grupo de Tratamento:**
[Descrição da mudança testada]

**Ferramentas:**
- Plataforma de teste: [Google Optimize / VWO / Hotjar / outra]
- Analytics: [GA4 / Amplitude / Mixpanel]
- Dashboard de acompanhamento: [link]

---

## 5. Plano de Execução

| Etapa | Responsável | Prazo |
|-------|------------|-------|
| Setup técnico | | |
| Ativação | | |
| Análise intermediária (50% do prazo) | | |
| Análise final | | |
| Documentação do resultado | | |

---

## 6. Resultados (Preencher após conclusão)

**Período de execução:** [data início] → [data fim]
**Amostra final:** [N usuários / leads]

### Resultados:
| Métrica | Controle | Tratamento | Variação | Significância |
|---------|---------|-----------|---------|--------------|
| [KPI principal] | [baseline] | [resultado] | [+/-X%] | [p-value] |
| [KPI guarda 1] | [baseline] | [resultado] | [+/-X%] | |

**Resultado:** ✅ Sucesso | ❌ Fracasso | ⚠️ Inconclusivo

---

## 7. Aprendizados e Próximos Passos

**O que aprendemos:**
[Insight principal: mesmo que o experimento tenha falhado]

**Próximos passos:**

Se SUCESSO:
- [ ] Implementar permanentemente em produção
- [ ] Escalar para outros canais/segmentos
- [ ] Documentar como best practice

Se FRACASSO:
- [ ] Motivo provável do fracasso: [hipótese]
- [ ] Próximo experimento derivado: [o que testar a seguir]

Se INCONCLUSIVO:
- [ ] O que faltou: [dados, amostra, tempo]
- [ ] Próxima rodada: [ajustes no setup]

---

**ICE Score deste experimento:**
- Impact (1-10): [X]: _[justificativa]_
- Confidence (1-10): [X]: _[justificativa]_
- Ease (1-10): [X]: _[justificativa]_
- **ICE Total:** [média]
