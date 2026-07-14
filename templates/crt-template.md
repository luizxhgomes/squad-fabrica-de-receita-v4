# Template: Current Reality Tree (CRT)

## Uso
A CRT mapeia a realidade atual do sistema de receita, conectando Efeitos Indesejáveis (EIs) à causa-raiz (a Trava governante).

## Estrutura

```
EFEITO INDESEJÁVEL CENTRAL (EIC)
"[O principal sintoma que o cliente relata]"
         ↑ causado por
    ┌────┴────────────────────────────────────┐
    │ │
EI-1: [sintoma secundário 1] EI-2: [sintoma secundário 2]
         ↑ causado por ↑ causado por
    ┌────┴────┐ ┌────┴────┐
    │ │ │ │
EI-1a EI-1b EI-2a EI-2b
         ↑ causado por ─────────────────┘
    TRAVA GOVERNANTE: T[X]: [Nome]
    "[Causa-raiz identificada]"
         ↑ causado por
    ┌────┴────────────────────────────────────┐
    │ │ │
CAUSA-RAIZ 1 CAUSA-RAIZ 2 CAUSA-RAIZ 3
"[causa]" "[causa]" "[causa]"
```

## Preenchimento

### 1. Efeito Indesejável Central (EIC)
```
O que o cliente reclama com mais frequência?
→ [descrever em linguagem do cliente, não técnica]

Impacto financeiro: R$ [valor]/mês
```

### 2. Efeitos Indesejáveis Secundários (EI-1 a EI-N)
```
EI-1: [nome]
  Evidência: [dado ou observação]
  Conexão com EIC: [explicar causalidade]

EI-2: [nome]
  Evidência: [dado ou observação]
  Conexão com EIC: [explicar causalidade]

EI-3: [nome]
  Evidência: [dado ou observação]
  Conexão com EIC: [explicar causalidade]
```

### 3. Trava Governante
```
TRAVA: T[X]: [Nome]
Definição: [descrição técnica da trava]

3 Testes de Confirmação:
  Teste 1 (Evidência Direta): [resultado] [pts]
  Teste 2 (Causa-Raiz): [resultado] [pts]
  Teste 3 (Custo de Inação): R$ [valor]/mês perdido
  Total: [X]/6 pts
```

### 4. Causas-Raiz da Trava
```
CR-1: [causa operacional/tática]
  Por que existe? [resposta]

CR-2: [causa de processo]
  Por que existe? [resposta]

CR-3: [causa estrutural/estratégica]
  Por que existe? [resposta]
```

### 5. Subordinação: O Que NÃO Atacar
```
Com base na CRT, as seguintes travas são CONSEQUÊNCIA da T[X],
não causas. Atacá-las sem resolver a trava governante é desperdício:

- T[X]: [nome]: consequência, não causa
- T[X]: [nome]: consequência, não causa
```

## Exemplo Preenchido: T6 Compromisso

```
EIC: "As pessoas agendam reunião mas não aparecem"
  Impacto: 45 mil reais por mês em oportunidades perdidas

EI-1: Taxa de no-show de 40% (meta: <15%)
  Evidência: CRM mostra 40 de 100 reuniões agendadas sem comparecimento

EI-2: Time comercial desmotivado, rotatividade alta
  Conexão: Esforço desperdiçado em leads que não aparecem

EI-3: Meta mensal não atingida há 3 meses consecutivos
  Conexão: Com 40% de no-show, impossível atingir meta com volume atual

TRAVA: T6: Compromisso (Falta de Urgência)
  Teste 1: Se reduzir no-show de 40% para 15%, +25 reuniões/mês = +45 mil reais de potencial (2pts)
  Teste 2: EI-2 e EI-3 são consequência direta (2pts)
  Teste 3: 45 mil reais por mês perdidos (2pts)
  Total: 6/6 pts: CONFIRMADA

CR-1: Ausência de régua de confirmação pós-agendamento
CR-2: Lead não percebe valor da reunião (sem ancoragem de benefício)
CR-3: Processo de qualificação fraco: agendando leads não-ideais

SUBORDINAÇÃO:
- T7 (Persuasão) é consequência: mesmo que o SDR melhore o pitch, sem a reunião não há como fechar
- T5 (Ruído) é consequência: mesmo qualificando melhor, o no-show continuará sem a régua
```

## Validação da CRT
```
[ ] Pelo menos 3 EIs identificados e conectados ao EIC
[ ] Trava governante com pontuação ≥4/6 nos 3 testes
[ ] Mínimo 3 causas-raiz da trava identificadas
[ ] Subordinação documentada (o que NÃO atacar)
[ ] CRT aprovada pelo cliente no Board 1
```
