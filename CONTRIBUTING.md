# Contribuindo com o Squad Fábrica de Receita V4

Obrigado pelo interesse em contribuir. Este squad é uma infraestrutura de orquestração de agentes
de IA para Claude Code, e a qualidade do conteúdo é o que o torna útil.

Criador principal e mantenedor: **Luiz Henrique** ([@luizhenriquexpro](https://instagram.com/luizhenriquexpro)).

## Antes de começar

1. Leia `docs/ARCHITECTURE.md` para entender a hierarquia de comando e os fluxos estratégicos.
2. Rode a validação local em 1 comando: `bash scripts/validate-squad.sh`.
3. Todo componente novo (agent, task, workflow, skill) precisa passar na validação e no CI.

## Padrões de conteúdo (inegociáveis)

Este squad segue regras de estilo estritas, verificadas pelo CI:

- **Português impecável.** Acentuação completa e correta em todo texto. Nunca substitua caracteres
  acentuados por equivalentes ASCII (jamais "nao" por "não").
- **Zero travessão.** O travessão (o traço longo usado para aposto ou intervalo) é proibido em texto
  renderizável. Use vírgula, dois-pontos, ponto ou parênteses. O hífen comum em palavras compostas e
  slugs é permitido.
- **Números como dígitos.** Em copy, escreva "4 gatilhos", não "quatro gatilhos".
- **Sem segredos.** Nunca commite chave, token ou senha. Use `.env.example` com placeholders. O
  `.gitignore` protege `.env`.
- **Sem dados de terceiros.** Não inclua PII, nome de cliente real ou credencial.

## Como propor um componente

- **Agent:** siga o formato canônico (frontmatter nativo, ACTIVATION, persona_profile, conhecimento
  profundo, dependencies, integration, quality_gates_applied). Veja `agents/goldratt.md` como referência.
- **Task:** frontmatter com `task`, `titulo`, `responsavel`, `elicit`, `entrada`, `saida`, `checklist`,
  `quality_gates`, `usado_por_workflows`.
- **Workflow:** `.yaml` com `workflow`, `phases`, `quality_gates_applied`, `cross_squad_handoffs`.
- **Skill:** `.skill.md` com frontmatter (`name`, `description`, `inputs`, `outputs`, `wraps`,
  `applies_to_qg`) e corpo com Purpose, Procedure, Output Schema, Verdict Logic, Usage, Reference.

Sempre registre o componente novo no `squad.yaml` (bloco `components`) e regenere o índice com
`bash scripts/build-components-index.sh`.

## Fluxo de PR

1. Faça um fork e crie uma branch descritiva.
2. `bash scripts/validate-squad.sh` deve retornar exit 0.
3. Abra o PR preenchendo o template. O CI (`validate`) precisa ficar verde.

## Atribuição e método

O método Fábrica de Receita e a metodologia V4 permanecem com atribuição aos seus titulares. As
personas nomeadas (Goldratt, Dener Lippert, Baziotti) são representações educacionais baseadas em
obra e material público. Este repositório não representa afiliação oficial.
