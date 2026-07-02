---
name: objections-arsenal
description: |
  Arsenal de fechamento com as 10 objeções mais comuns do DR-X, tratadas
  pelo framework LAER (Listen, Acknowledge, Explore, Respond). Recebe a
  objeção e o contexto SPICED do lead e devolve a resposta estruturada
  com evidência conectada ao diagnóstico, mais o follow-up de fechamento.
inputs:
  - objecao: "texto da objeção levantada pelo lead"
  - contexto_spiced: "canvas SPICED do lead (dor, impacto quantificado, evento crítico, decisores)"
outputs:
  - resposta_estruturada: "sequência LAER completa para a objeção"
  - follow_up: "próximo passo concreto + script de fechamento"
wraps:
  - templates/spiced-template.md
applies_to_qg: QG-003
agent_origin: maquina-comercial
---

# Skill: Objections Arsenal

## Purpose

Tratar objeções de fechamento do DR-X sem improviso. Cada objeção é classificada contra as 10 mais comuns e respondida pelo framework LAER, sempre ancorando a resposta em dados do SPICED do lead (dor confirmada + impacto quantificado). Sem SPICED preenchido, a resposta vira argumento genérico e perde força.

## Procedure

### Passo 1: Aplicar o framework LAER

```
L, Listen      (Ouvir sem interromper)
A, Acknowledge (Reconhecer sem concordar)
E, Explore     (Explorar a objeção com perguntas)
R, Respond     (Responder com evidência)
```

### Passo 2: Classificar a objeção contra as 10 do arsenal e responder

#### Objeção 1: "É muito caro"
```
A: "Faz sentido querer ter certeza que o investimento vale a pena."
E: "Quando você diz caro, você está comparando com o quê? Com outras consultorias?
    Ou com o orçamento que tinha em mente?"
R: "Veja o que calculamos juntos: você perde R$[X]/mês com [trava identificada].
    Em 3 meses o DR-X se paga sozinho com o resultado mínimo esperado.
    O risco real é continuar onde está."
```

#### Objeção 2: "Já tentei consultoria e não funcionou"
```
A: "Entendo. É frustrante investir e não ver resultado."
E: "O que a consultoria anterior fez? Qual era a proposta dela?"
R: "O que torna o DR-X diferente é a abordagem: não fazemos tudo ao mesmo tempo.
    Identificamos matematicamente UMA trava e atacamos só ela por 90 dias.
    Sem isso, você atira para todo lado e não sai do lugar, que é o que
    parece ter acontecido antes."
```

#### Objeção 3: "Preciso pensar / falar com meu sócio"
```
A: "Claro, decisões assim precisam de alinhamento."
E: "O que você precisa ver ou entender para se sentir seguro para avançar?
    E seu sócio, qual é a maior preocupação dele normalmente?"
R: "Posso te enviar um resumo de 1 página com os pontos principais para você
    apresentar para ele. E se fizer sentido, a gente pode fazer uma chamada
    rápida com ele também: 15 minutos resolve."
```

#### Objeção 4: "Não tenho tempo para implementar"
```
A: "Tempo é o recurso mais escasso de quem está crescendo, faz todo sentido."
E: "Quanto tempo por semana você ou sua equipe poderiam dedicar se soubessem
    que isso vai gerar resultado?"
R: "O GT (Grupo de Trabalho) do DR-X exige em média 2h por semana do líder
    e 4-6h da equipe. A maior parte da execução é nossa.
    Você precisa aprovar, não executar."
```

#### Objeção 5: "Agora não é o momento certo"
```
A: "Timing é tudo em negócio, entendo."
E: "O que precisaria mudar para o momento ser certo? O que está impedindo agora?"
R: "A questão é: [trava identificada] vai custar R$[X] esse mês também.
    E no mês que vem. O melhor momento para resolver um gargalo é antes que
    ele custe mais. Qual seria um momento melhor matematicamente?"
```

#### Objeção 6: "Quero ver resultado antes de pagar"
```
A: "Querer segurança faz todo sentido, especialmente com experiências anteriores."
E: "Que tipo de resultado em que prazo te daria segurança para avançar?"
R: "É por isso que temos a garantia incondicional: se em 90 dias não identificarmos
    matematicamente sua trava governante e entregarmos o plano, devolvemos 100%.
    Zero risco do seu lado."
```

#### Objeção 7: "Meu problema é único / meu mercado é diferente"
```
A: "Cada negócio tem suas particularidades, concordo."
E: "O que você acredita que é específico do seu negócio que tornaria o método diferente?"
R: "A TOC é baseada em princípios universais de sistemas: funciona para manufatura,
    saúde, SaaS, serviços. O que muda é qual das 8 travas está ativa no seu caso
    e qual artefato resolve. O diagnóstico revela exatamente isso."
```

#### Objeção 8: "Posso fazer isso internamente"
```
A: "Ter autonomia para resolver problemas internamente é valioso."
E: "Você tem alguém no time com expertise em TOC aplicada à receita?
    Alguém que já fez esse diagnóstico antes em outras empresas?"
R: "O valor do DR-X é exatamente trazer olho externo com dados de [N] empresas
    e um método que elimina o viés interno. É difícil enxergar o rótulo
    de dentro da garrafa."
```

#### Objeção 9: "Prefiro contratar um vendedor/gestor de tráfego"
```
A: "Ampliar o time é uma solução que faz sentido quando o gargalo é capacidade."
E: "Qual é o problema que você espera resolver contratando essa pessoa?"
R: "Se o gargalo for, por exemplo, taxa de no-show ou landing page que não converte,
    mais um vendedor ou mais tráfego vai ampliar o problema, não resolver.
    O diagnóstico revelaria se é isso ou outra coisa. Você quer ter certeza antes
    de contratar, não depois."
```

#### Objeção 10: "Vou esperar o próximo mês/trimestre"
```
A: "Planejar o timing do investimento é responsável."
E: "O que muda no próximo mês/trimestre que torna esse investimento mais adequado?"
R: "Calculamos que você perde R$[X] por mês com [trava]. Esperar 3 meses = R$[3X]
    a mais de custo de oportunidade. O que muda é que você começa 3 meses mais tarde,
    não mais preparado."
```

### Passo 3: Script de Fechamento (sequência final)

```
Após responder todas as objeções:

"[Nome], você concordou que [dor é real] e calculamos juntos que isso custa
R$[X]/mês. Temos 90 dias para resolver isso com garantia incondicional.

Existe alguma razão para não avançarmos hoje?"

→ Se SIM: explorar a objeção (voltar ao LAER)
→ Se NÃO: "Perfeito. O próximo passo é [ação concreta]. Você prefere [opção A] ou [opção B]?"
```

## Output Schema

```yaml
objecao_classificada:
  id: 1-10
  nome: "É muito caro"
resposta_estruturada:
  listen: "objeção ouvida na íntegra, sem interrupção"
  acknowledge: "frase de reconhecimento sem concordância"
  explore: ["pergunta de exploração 1", "pergunta de exploração 2"]
  respond: "resposta com evidência ancorada no SPICED (impacto R$[X]/mês)"
follow_up:
  proximo_passo: "ação concreta com 2 opções de agenda"
  script_fechamento: "Existe alguma razão para não avançarmos hoje?"
```

## Verdict Logic

- TRATADA: LAER completo + Respond ancorado em dado do SPICED (impacto quantificado da trava)
- REABRIR_DISCOVERY: mesma objeção retorna 2 ou mais vezes, ou o impacto não está quantificado no SPICED; voltar ao passo I (Impacto) do SPICED antes de responder de novo
- AVANCAR: nenhuma objeção restante; executar o script de fechamento com 2 opções concretas

## Usage

```
@maquina-comercial use skill objections-arsenal {objecao}
```

Pré-requisito: canvas SPICED do lead preenchido (skill `spiced-framework`).

## Reference

- Framework de qualificação e scorecard: `templates/spiced-template.md`
- Trava T3 Decisão (fechamento abaixo de 20%, objeções repetidas sem tratamento): `data/8-travas.md`
- Artefato de solução canônico da T3: Arsenal de Fechamento
- Handoff: objeção de no-show recorrente → skill `anti-no-show`
