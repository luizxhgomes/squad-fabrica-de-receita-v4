---
name: ltp-arvores-logicas
description: |
  Aplicação do LTP (Lean Thinking Process) com as árvores lógicas da
  TOC. Recebe o objetivo do cliente e os fatores críticos e devolve o
  IOMAP (Árvore de Realidade Atual), a Árvore de Realidade Futura
  (simulação com efeitos desejados e indesejados) e o plano de
  vacinação (prevenção de conflitos antes da implementação).
inputs:
  - objetivo_cliente: "objetivo macro (ponto B) declarado, destilado até a raiz"
  - fatores_criticos: "fatores que, se não acontecerem, fazem o objetivo falhar"
outputs:
  - iomap: "árvore de realidade atual (objetivo + fatores críticos + condições necessárias)"
  - arvore_realidade_futura: "simulação da implementação com efeitos desejados e indesejados"
  - plano_vacinacao: "conflitos resolvidos antecipadamente + pré-requisitos condicionados"
wraps:
  - data/toc-ltp-fieldbook.md
  - templates/crt-template.md
applies_to_qg: QG-002
agent_origin: goldratt
---

# Skill: LTP e Árvores Lógicas

## Purpose

O LTP é ferramenta e metodologia (não filosofia) para construir o caminho que leva a empresa do ponto A ao ponto B. A TOC responde **o que** resolver (identifica a restrição); o LTP responde **como** resolver (constrói o caminho da solução). São complementares e andam lado a lado: quando se define o objetivo no LTP, define-se ao mesmo tempo a restrição da TOC. O rigor nos detalhes importa: são as vírgulas que separam um bom profissional de um excelente profissional.

## Procedure

### Etapa 0: Destilar o pedido com a técnica do "Para quê?"

O cliente pede o que **acha** que precisa, não o que **realmente** precisa. Perguntar repetidamente "para quê?" até a causa raiz:

```
"Quero contratar um produtor de vídeo." Para quê?
"Quero investir mais em tráfego." Para quê?
"Quero gerar mais leads." Para quê?
Raiz: quase sempre, lucrar mais.
```

O diagnóstico só começa quando o pedido superficial foi destilado até a raiz. É na raiz que a restrição aparece. Classificar então a causa por domínio (o domínio determina o tipo de alavanca):
1. **Interno:** problema dentro de casa (ex.: poucos criativos)
2. **Mercado:** fator externo (ex.: concorrência investindo mais)
3. **Ambiente político:** regulação, leis, mudanças de plataforma
4. **Paradigmas sociais:** crenças limitantes da equipe ou do mercado
5. **Ação gerencial:** falta de atenção ou de priorização do gestor

### Etapa 1: IOMAP (Árvore de Realidade Atual)

- Mapear o **objetivo** do cliente (Objetivo 1, o macro)
- Identificar os **fatores críticos**: se não acontecerem, o objetivo falha
- Definir as **condições necessárias** para cada fator crítico
- Alinhar expectativas e priorizar ações junto com o cliente

### Etapa 2: Árvore de Realidade Futura

- **Simulação** da implementação proposta antes de executar
- Projetar efeitos **desejados e indesejados**
- Toda ação tem uma reação padrão: mapear as reações antes de implementar
- Avaliar cada implementação pelos 3 aspectos:
  1. **Causa e efeito:** tudo que for implementado terá um efeito. Qual?
  2. **Comportamento humano:** como as pessoas vão reagir à mudança?
  3. **Capacidade de sistematização:** dá para sistematizar e pautar em dados?

### Etapa 3: Vacinação (prevenção)

- Vacina é prevenção, não resolução
- Resolver conflitos **antecipadamente**, antes da implementação
- Proteger o trabalho da equipe e o investimento do cliente
- Condicionar a venda quando necessário (a entrega B só acontece depois do pré-requisito A)
- Regra do método: se uma implementação gera efeito conhecido, ela precisa de uma injeção e, antes dela, de uma vacina
- Diante de resistência, tratar a camada certa:

| Camada | Descrição | Tratamento |
|--------|-----------|------------|
| Negligência | Sabe fazer, pode fazer, não faz | Consequências progressivas |
| Medo | Teme exposição, vigilância ou perda | Reposicionar a narrativa (oportunidade de ganho, não caça ao erro) |
| Falta de adaptabilidade | Não consegue acompanhar a mudança | Treino; em alguns casos, a pessoa não deveria estar na equipe |

### Etapa 4: Implementação

- Somente após mapear, simular e vacinar
- A implementação é um **meio**, não o objetivo em si
- Validar: comparar métricas antes e depois. Se aplicar algo, valide se resolveu

Resumo canônico da sequência: mapear o objetivo (IOMAP), simular a aplicação (Árvore de Realidade Futura), resolver os conflitos (vacinação) e, finalmente, implementar.

## Ferramentas complementares

| Ferramenta | Uso no método |
|------------|---------------|
| IOMAP (Árvore de Realidade Atual) | Mapeamento de objetivo, fatores críticos e condições |
| Árvore de Realidade Futura | Simulação de implementação e efeitos colaterais |
| Vacinação | Prevenção de efeitos indesejados antes da execução |
| Análise SWOT | Leitura de forças, fraquezas, oportunidades e ameaças |
| 5W2H | Detalhamento operacional de planos de ação |
| Diagrama de Ishikawa | Aprofundar problemas de causa não evidente |
| Tabela Risco x Impacto x Custo | Comparar opções de decisão entre caminhos |

Princípio de uso: tudo funciona junto, tudo é colaborativo; uma ferramenta jamais exclui a outra.

## Output Schema

```yaml
iomap:
  objetivo_macro: "NRR acima de 100% em 12 meses"
  dominio_da_causa: interno | mercado | politico | paradigma | gerencial
  fatores_criticos:
    - fator: "expansão de receita recorrente na base"
      condicoes_necessarias: ["time de sucesso do cliente ativo", "dados de uso por conta"]
arvore_realidade_futura:
  efeitos_desejados: []
  efeitos_indesejados:
    - efeito: "equipe percebe CRM como vigilância"
      vacina: "reposicionar narrativa como oportunidade de ganho"
plano_vacinacao:
  - conflito: ""
    vacina: ""
    pre_requisito_condicionado: "entrega B só após pré-requisito A"
```

## Verdict Logic

- PRONTO_PARA_IMPLEMENTAR: IOMAP validado com o cliente + ARF sem efeito indesejado órfão (todos com vacina) + 3 aspectos de avaliação respondidos
- SIMULAR_NOVAMENTE: existe efeito indesejado sem vacina correspondente; voltar à etapa 2
- REDESTILAR: o objetivo ainda está no nível do pedido superficial (não sobreviveu ao "para quê?"); voltar à etapa 0

## Usage

```
@goldratt use skill ltp-arvores-logicas {objetivo}
```

Usar após a identificação da restrição (skill `toc-aplicada`) e antes de qualquer implementação ou proposta de injeção.

## Reference

- Fieldbook completo TOC + LTP (etapas, princípios, casos aplicados): `data/toc-ltp-fieldbook.md`
- Estrutura de árvore causal com exemplo preenchido: `templates/crt-template.md`
- Benefícios do LTP: protege o trabalho, reduz overdelivery, alinha equipe e cliente na mesma língua
- Handoff: plano vacinado → skill `ciclo-90-dias` (execução por fases)
