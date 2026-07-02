---
task: Executar Board 1
responsavel: "@ops-dr"
responsavel_type: agent
atomic_layer: task
Entrada: |
  - diagnostico_trava: Resultado do diagnosticar-trava (laudo completo)
  - fluxo_receita: Planilha do Fluxo de Receita preenchida
  - slides_diagnostico: Slides com diagnostico das 8 travas
  - crt_visual: CRT visual (whiteboard ou Miro)
  - artefato_proposto: Proposta do Artefato Inicial
Saida: |
  - trava_confirmada: Trava governante confirmada pelo cliente
  - crt_validada: CRT validada com cliente
  - subordinacao: Definicao do que NAO atacar agora
  - artefato_aprovado: Artefato inicial aprovado com responsavel e prazo
  - board_2_agendado: Data do Board 2 confirmada
  - ata_assinada: Ata do Board 1 assinada
Checklist:
  - "[ ] Cliente confirmou a trava governante por escrito"
  - "[ ] CRT aprovada com minimo 3 causas-raiz"
  - "[ ] Subordinacao documentada (o que NAO fazer)"
  - "[ ] Artefato inicial aprovado e responsavel definido"
  - "[ ] Board 2 agendado (D35)"
---

# Task: executar-board-1

## Metadata
```yaml
task_id: executar-board-1
agent: dr-chief
squad: destrava-v4
version: 1.0.0
estimated_time: 120min
prerequisite: diagnosticar-trava
```

## Objetivo
Conduzir o Board 1: Confirmar a Trava com o cliente, obtendo aprovação formal da trava governante e do artefato inicial.

## Quando Executar
- Dia 14 do cronograma DR-X (D14)
- Após Semana 2 completa (dados coletados + diagnóstico realizado)

## Agenda do Board 1 (120min)

### Bloco 1: Contexto e Dados (20min)
```
Apresentar:
1. Fluxo de Receita mapeado (funil completo com números)
2. Árvore de Objetivos (Goal Tree)
3. Sizing de Mercado (TAM/SAM/SOM)
```

### Bloco 2: Diagnóstico das 8 Travas (30min)
```
Para cada trava:
- Status: [ ] Saudável [!] Atenção [X] Bloqueada
- Métrica atual vs benchmark
- Evidência objetiva

Apresentar resultado dos 3 testes de confirmação.
```

### Bloco 3: Trava Confirmada + CRT (30min)
```
1. Apresentar trava candidata com pontuação dos 3 testes
2. Construir CRT ao vivo com o cliente
3. Obter confirmação verbal + escrita
4. Apresentar Subordinação (o que NÃO fazer agora)
```

### Bloco 4: Artefato Inicial + Próximos Passos (30min)
```
1. Apresentar artefato inicial proposto
2. Definir responsável pela implementação
3. Confirmar cronograma semanas 3-5
4. Agendar Board 2 (D35)
```

### Bloco 5: Q&A e Alinhamento (10min)

## Materiais Necessários

- [ ] Planilha do Fluxo de Receita preenchida
- [ ] Slides com diagnóstico das 8 travas
- [ ] CRT visual (whiteboard ou Miro)
- [ ] Proposta do Artefato Inicial
- [ ] Template de Ata para assinatura

## Outputs do Board 1

```yaml
saidas_obrigatorias:
  - trava_confirmada: "T[X]: [Nome]"
  - pontuacao_confirmacao: "[X]/6"
  - crt_validada: true
  - subordinacao_definida: "[o que não atacar agora]"
  - artefato_inicial:
      nome: "[nome do artefato]"
      responsavel: "[nome]"
      prazo: "D+15"
  - board_2_agendado: "[data]"
  - ata_assinada: true
```

## Critérios de Sucesso (Definition of Done)
- [ ] Cliente confirmou a trava governante por escrito
- [ ] CRT aprovada com mínimo 3 causas-raiz
- [ ] Subordinação documentada (o que NÃO fazer)
- [ ] Artefato inicial aprovado e responsável definido
- [ ] Ata assinada pelo cliente e pelo consultor
- [ ] Board 2 agendado (D35)

## Protocolos de Contingência

**Se cliente discordar da trava:**
1. Não debate: pede evidências contrárias
2. Aplica teste 1 com dados do cliente
3. Se ainda diverge: agenda sessão extra de dados (D17)

**Se dados insuficientes:**
1. Conduz Board 1 com dados disponíveis
2. Marca hipóteses com asterisco (*)
3. Solicita dados faltantes com prazo de 48h
4. Confirma trava em reunião complementar
