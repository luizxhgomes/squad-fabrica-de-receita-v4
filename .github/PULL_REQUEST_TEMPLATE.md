## O que muda

Descreva a mudança em 1 ou 2 frases.

## Tipo

- [ ] Novo componente (agent, task, workflow, skill)
- [ ] Correção de componente existente
- [ ] Documentação
- [ ] Infraestrutura (scripts, CI)

## Checklist

- [ ] `bash scripts/validate-squad.sh` retorna exit 0
- [ ] `bash scripts/check-public-safety.sh .` retorna exit 0
- [ ] Sem travessão em texto renderizável (vírgula, dois-pontos ou parênteses)
- [ ] Acentuação pt-BR completa e correta
- [ ] Números como dígitos em copy
- [ ] Nenhum segredo, PII ou dado de terceiro
- [ ] Componente novo registrado no `squad.yaml` e índice regenerado (`build-components-index.sh`)
