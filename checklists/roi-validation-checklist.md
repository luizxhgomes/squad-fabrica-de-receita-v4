# ROI Validation Checklist: ROI-first Standard

Checklist baseado na metodologia ROI-first da a assessoria.
Toda ação de marketing passa por este filtro antes de ser aprovada ou escalada.

## Pré-Lançamento

### Viabilidade Financeira
- [ ] O CAC estimado é menor que LTV/3? (para LTV:CAC mínimo de 3:1)
- [ ] O payback period projetado é < 12 meses?
- [ ] O ROAS mínimo está definido? (E-commerce: 3x | Serviços: 2x | SaaS: 2x)
- [ ] O budget tem margem de erro? (+30% de contingência?)
- [ ] A contribution margin do produto/serviço suporta o CAC projetado?

### Mensuração
- [ ] Todos os pixels/tags de conversão estão funcionando?
- [ ] O modelo de atribuição está definido e documentado?
- [ ] Há pelo menos 2 fontes de dados para cruzar os resultados?
- [ ] O período mínimo de análise foi definido antes do lançamento?
- [ ] Os baselines foram capturados (situação atual antes da ação)?

## Durante a Execução

### Monitoramento Semanal (ROI-first Review)
- [ ] CAC desta semana vs semana anterior: está estável ou melhorando?
- [ ] ROAS por canal: algum abaixo do mínimo?
- [ ] Há anomalias nos dados? (queda súbita, spike anormal?)
- [ ] Os experimentos ativos têm dados suficientes para análise?
- [ ] O budget está bem distribuído entre canais performando?

### Alertas de Emergência
- [ ] CAC > 120% do target → Pausar e investigar
- [ ] ROAS < 1.5x → Pausar campanha imediatamente
- [ ] Churn rate > 150% do histórico → Escalação imediata
- [ ] Custo por MQL > 2x histórico → Revisão de segmentação

## Pós-Análise (30/60/90 dias)

### Validação de Resultado
- [ ] O ROI realizado está próximo do ROI projetado? (±20%)
- [ ] O experimento atingiu significância estatística (95%+)?
- [ ] O resultado é incremental? (não seria obtido sem a ação?)
- [ ] Há efeito colateral positivo (halo effect) não esperado?
- [ ] Há efeito colateral negativo (canibalizações) não esperado?

### Decisão de Escala (Filtro ROI-first)
- [ ] WIN confirmado com dados? → Documentar, preparar escala
- [ ] LTV:CAC acima de 3:1? → Aprovado para escala
- [ ] Payback < 12 meses? → Aprovado para escala
- [ ] ROAS acima do mínimo com volume? → Aprovado para escala

**Se TODOS os 4 acima forem SIM → ESCALAR COM CONFIANÇA**
**Se qualquer um for NÃO → Investigar antes de escalar**

## Documentação Obrigatória

Após cada análise:
- [ ] Resultados documentados no template ROI Report
- [ ] Aprendizados registrados no knowledge base do squad
- [ ] Decisão (escalar/pausar/iterar) documentada com justificativa
- [ ] Próxima hipótese adicionada ao backlog de experimentos
