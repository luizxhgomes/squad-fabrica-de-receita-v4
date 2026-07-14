# Uso

Este documento mostra como acionar o squad em missões reais. Você descreve o problema em linguagem natural, o Chief monta o plano, e a execução acontece pelos fluxos estratégicos certos.

---

## Como toda missão funciona

O comando é sempre `/fdr-` seguido da sua missão em texto livre:

```
/fdr- <descreva o problema de receita>
```

**Toda missão abre com o plano do Chief antes de executar.** Isso é o protocolo Prioridade 0 (chief-first): o comando carrega o Chief, o Chief roda o Protocolo de Consultoria de 5 passos e apresenta o PLANO DE AÇÃO (quais especialistas entram, com quais tasks, em que ordem). Só depois a execução delegada começa. O comando nunca dispara uma task solta pulando o Chief.

Quanto mais contexto você der (faturamento, funil por etapa, canais ativos, métricas atuais), mais afiado é o diagnóstico. Se faltar dado crítico, o Chief pede antes de supor.

---

## 6 missões de exemplo

Cada missão mapeia para um fluxo estratégico. Você não precisa saber qual: o Chief decide. Os exemplos abaixo mostram o comando e o que esperar de saída.

### 1. Diagnóstico de trava (fluxo Diagnóstico)

```
/fdr- minha receita estagnou há 8 meses e não sei onde está o gargalo
```

**O que esperar:** o Master Advisor aplica a Teoria das Restrições, o fluxo de Diagnóstico roda o teste 2 de 3 sobre as 8 travas e a qualificação SPICED. Saída: a trava confirmada (por exemplo Retenção, T2), a evidência que a confirma, e o próximo passo com 1 ação, 1 teste e 1 prazo.

### 2. Estratégia de tráfego com CAC alvo (fluxo Aquisição)

```
/fdr- preciso escalar aquisição mantendo o CAC abaixo do meu alvo, hoje gasto em Meta e Google
```

**O que esperar:** o fluxo de Aquisição (Pilar Tráfego) desenha a estratégia de mídia cobrindo as travas de Exposição, Atenção e Interesse. Saída: plano de canais, hipóteses de criativo, estrutura de campanha e as metas de CAC, ROAS e CPL a monitorar. Tudo comparado aos benchmarks canônicos.

### 3. Funil de conversão (fluxo Engajamento e Conversão)

```
/fdr- tenho tráfego bom mas a landing page converte abaixo de 2 por cento
```

**O que esperar:** o fluxo de Conversão ataca as travas de Interesse e Decisão. Saída: auditoria de fricção da página e do checkout, hipóteses de teste priorizadas, e a matemática de quanto cada ponto de conversão vale em receita.

### 4. Playbook de retenção (fluxo Retenção)

```
/fdr- meu churn mensal passou de 3 por cento e o LTV está caindo
```

**O que esperar:** o fluxo de Retenção (Pilar LTV) trabalha a trava de Retenção (T2), a mais próxima do caixa. Saída: régua de retenção, gatilhos de reativação, desenho de onboarding e as metas de churn, NPS e NRR (a meta é NRR acima de 100 por cento).

### 5. Análise de ROI (fluxo Inteligência e Performance)

```
/fdr- quero entender o ROI real das minhas frentes de marketing e onde cortar
```

**O que esperar:** o fluxo de Inteligência e Performance calcula unit economics, LTV por CAC, payback e atribuição. Saída: dashboard de ROI com a leitura de cada frente, o que escalar, o que matar, e a regra de ouro aplicada (LTV por CAC maior ou igual a 3 para 1).

### 6. Ciclo de 90 dias (fluxo Diagnóstico e orquestração completa)

```
/fdr- monte meu ciclo de 90 dias para atacar a trava que você diagnosticar
```

**O que esperar:** o Chief orquestra o ciclo completo com o framework STEP (Saber, Ter, Executar, Performar). Saída: o plano de 90 dias com 1 trava por ciclo, owners definidos, marcos por fase (identificar, otimizar, alinhar, expandir, recomeçar) e o baseline contra o qual o resultado será medido no fim.

---

## Comandos internos do Chief

Depois que o Chief está carregado, você pode usar comandos internos para navegar o squad sem descrever uma missão inteira. Eles usam o prefixo `*`.

| Comando | O que faz |
|---------|-----------|
| `*help` | Lista os comandos disponíveis e como usá-los |
| `*specialists` | Mostra os especialistas do squad e a especialidade de cada um |
| `*flows` | Lista os fluxos estratégicos e as travas ou pilares que cada um cobre |
| `*advise` | Aciona o Master Advisor (Goldratt) para uma leitura de Teoria das Restrições sobre a situação atual |

Use `*specialists` e `*flows` para entender o mapa antes de decidir a missão, e `*advise` quando quiser a leitura de constraint pura, antes do plano de execução.

---

## Dica de qualidade

O squad enforça padrões de escrita em todo output: português impecável com acentuação completa, zero travessão, e brand compliance nas peças visuais. Se você notar qualquer desvio, aponte: o agente reconhece, reescreve a resposta inteira aplicando a regra e registra a ocorrência. Isso faz parte do gate de Qualidade de Saída (QG-004).
