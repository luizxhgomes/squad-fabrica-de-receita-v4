---
task: Executar Board 2
responsavel: "@ops-dr"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - resultado_board_1: Trava confirmada e artefato inicial do Board 1
  - resultados_artefato: Resultados do artefato inicial (D15-D35)
  - evaporating_cloud: Conflito central identificado com assuncoes
  - frt: Future Reality Tree com injecao proposta
Saida: |
  - evaporating_cloud_aprovada: Evaporating Cloud validada pelo cliente
  - injecao_definida: Injecao principal com metricas e prazos
  - frt_validada: FRT validada sem Negative Branches criticos
  - go_no_go: Decisao GO/NO-GO documentada
  - plano_acao: Plano de acao aprovado com DRIs
  - board_3_agendado: Data do Board 3 / Entrega Final confirmada
Checklist:
  - "[ ] Evaporating Cloud aprovada pelo cliente"
  - "[ ] Injecao definida com metricas e prazos"
  - "[ ] FRT validada sem Negative Branches criticos"
  - "[ ] GO/NO-GO documentado com justificativa"
  - "[ ] Plano de acao aprovado com DRIs definidos"
---

# Task: executar-board-2

## Metadata
```yaml
task_id: executar-board-2
agent: dr-chief
squad: destrava-v4
version: 1.0.0
estimated_time: 120min
prerequisite: executar-board-1
```

## Objetivo
Conduzir o Board 2: Definir a Injeção, validar os experimentos da fase Otimizar e obter GO/NO-GO para implementação completa.

## Quando Executar
- Dia 35 do cronograma DR-X (D35)
- Após semanas 3-5 (fase Otimizar concluída)

## Agenda do Board 2 (120min)

### Bloco 1: Recap e Resultados do Artefato Inicial (20min)
```
1. Revisão do que foi definido no Board 1
2. Resultados do Artefato Inicial (D+15 a D+35):
   - Métrica-alvo: [resultado atual vs previsto]
   - Variação: +/-[X]%
   - Lições aprendidas
```

### Bloco 2: Evaporating Cloud (30min)
```
Apresentar o conflito central identificado:

[OBJETIVO]
    ←── [NECESSIDADE A] ←── [CONDIÇÃO 1]
    ←── [NECESSIDADE B] ←── [CONDIÇÃO 2]
              ↑
         [CONFLITO]

Apresentar as assunções que sustentam o conflito.
Apresentar os experimentos de invalidação das assunções.
```

### Bloco 3: FRT (Future Reality Tree) + Injeção (30min)
```
1. Apresentar FRT: como será o sistema após a injeção
2. Definir a INJEÇÃO principal:
   - O que muda no sistema
   - Métricas que serão afetadas
   - Efeitos em cascata esperados
3. Validar que a injeção não cria novos conflitos (Negative Branch)
```

### Bloco 4: GO/NO-GO + Plano de Ação (30min)
```
CRITÉRIOS GO:
- [ ] Injeção definida e validada
- [ ] Experimentos confirmaram pelo menos 2 assunções
- [ ] Métricas do artefato inicial melhoraram
- [ ] Plano de implementação viável em D35-D45

Se GO: Aprovação do Plano de Ação Final
Se NO-GO: Identificar bloqueio e replanejar
```

### Bloco 5: Próximos Passos (10min)
```
- Agendar Board 3 / Entrega Final (D45)
- Confirmar responsáveis por cada ação
- Definir métricas de sucesso da entrega final
```

## Outputs do Board 2

```yaml
saidas_obrigatorias:
  - evaporating_cloud_aprovada: true
  - injecao_definida:
      descricao: "[injeção principal]"
      metricas_impactadas: ["[metrica1]", "[metrica2]"]
      prazo_efeito: "[X semanas]"
  - frt_validada: true
  - resultado_go_no_go: "GO | NO-GO"
  - plano_de_acao:
      acoes: ["[acao1]", "[acao2]", "[acao3]"]
      responsaveis: ["[resp1]", "[resp2]"]
      prazos: ["[D36]", "[D40]", "[D43]"]
  - board_3_agendado: "[data D45]"
  - ata_assinada: true
```

## Critérios de Sucesso (Definition of Done)
- [ ] Evaporating Cloud aprovada pelo cliente
- [ ] Injeção definida com métricas e prazos
- [ ] FRT validada sem Negative Branches críticos
- [ ] GO/NO-GO documentado com justificativa
- [ ] Plano de Ação aprovado com DRIs definidos
- [ ] Board 3 / Entrega Final agendada
