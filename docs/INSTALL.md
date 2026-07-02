# Instalação

O Squad Fábrica de Receita V4 roda dentro do Claude Code. Há 2 formas de usar: trabalhar direto no repositório clonado (Modo A) ou instalar o squad dentro de um projeto seu (Modo B). Escolha uma.

---

## Pré-requisitos

- **Claude Code** instalado e autenticado. É o ambiente onde o squad é acionado.
- **git** para clonar o repositório e receber atualizações.
- **bash** para rodar os scripts de validação e o instalador. Já vem no macOS e Linux. No Windows, use o WSL ou o Git Bash.

Opcional: **Python 3.12** com `pyyaml`, apenas se você quiser rodar a validação estrutural completa localmente (é a mesma que o CI roda).

---

## Modo A, uso direto ao clonar

O caminho mais rápido. Você clona o repositório e trabalha dentro dele. O Claude Code descobre a config local do próprio squad por descoberta ascendente de diretórios.

```bash
git clone https://github.com/luizxhgomes/squad-fabrica-de-receita-v4.git
cd squad-fabrica-de-receita-v4
claude
```

Dentro do Claude Code, acione o squad:

```
/fdr-v4 quero diagnosticar onde minha receita está travando
```

Use o Modo A quando o objetivo é explorar o squad, estudar o método ou tocar uma missão de receita de forma isolada.

---

## Modo B, instalar em outro projeto (install.sh)

Use quando você quer o squad disponível **dentro de um projeto seu**, ao lado do seu próprio código, sem virar uma cópia manual. O `install.sh` copia os componentes do squad para o diretório de destino e registra o comando.

Rode a partir do repositório clonado, apontando para o seu projeto:

```bash
bash install.sh --target ~/meu-projeto
```

### Flags

| Flag | O que faz |
|------|-----------|
| `--target <caminho>` | Diretório de destino onde o squad será instalado. Obrigatório. |
| `--with-agents` | Instala também os arquivos de persona dos agents no destino, e não apenas o comando e a config. Use quando quiser as personas versionadas junto ao seu projeto. |
| `--check` | Modo de verificação. Não escreve nada: apenas reporta o que seria instalado e se o destino está apto. Rode antes de instalar de verdade. |
| `--uninstall` | Remove do destino os artefatos que o instalador criou, sem tocar no resto do projeto. |

### Fluxo recomendado

```bash
# 1. Verifique antes (nada é escrito)
bash install.sh --target ~/meu-projeto --check

# 2. Instale, com as personas junto
bash install.sh --target ~/meu-projeto --with-agents

# 3. Se precisar reverter
bash install.sh --target ~/meu-projeto --uninstall
```

Depois de instalar, abra o Claude Code no seu projeto e o comando `/fdr-v4` estará disponível ali.

---

## Configurando suas chaves

O squad opera **sem nenhuma integração externa**. As integrações são opcionais e servem apenas quando a sua missão precisa consumir dados de anúncios, analytics ou CRM (sempre via MCP dentro do Claude Code, nunca pelo squad diretamente).

Se você for usar alguma integração, configure as chaves localmente:

```bash
cp .env.example .env
```

Abra o `.env` e preencha apenas as chaves que a sua operação usa. Regras de segurança:

- **Preencha local, nunca no repositório.** As chaves ficam só na sua máquina.
- **O `.gitignore` já protege o `.env`.** Ele nunca é commitado. Só o `.env.example` (com placeholders) vive no repositório.
- **Nunca commite chave, token ou senha.** Nem em código, nem em texto, nem em issue.
- **Se uma chave vazar, rotacione imediatamente** no painel do provedor. Trocar a chave é mais barato que investigar o vazamento.

---

## FAQ

### Por que os subagents têm prefixo `fdr-`?

Alguns agents da camada meta usam o prefixo `fdr-` (por exemplo `fdr-quality-monitor`) para evitar colisão de nome quando o squad convive com outros squads no mesmo workspace. O prefixo é um namespace: garante que `fdr-quality-monitor` não seja confundido com um monitor de qualidade de outro contexto. Os nomes internos do squad permanecem estáveis, o prefixo só resolve unicidade global.

### Como atualizo o squad?

No Modo A, um `git pull` traz a versão mais recente:

```bash
cd squad-fabrica-de-receita-v4
git pull
```

No Modo B, atualize o repositório clonado com `git pull` e rode o `install.sh` de novo apontando para o mesmo destino. Rode `--check` antes para ver o diff do que muda.

### O squad funciona sem as integrações MCP?

Sim. O núcleo do squad (diagnóstico das travas, hierarquia de comando, frameworks, geração de plano e artefatos) funciona 100% sem nenhuma integração. As integrações MCP (analytics, mídia paga, CRM) enriquecem missões que precisam de dados reais da sua operação, mas não são requisito para usar o método. Sem elas, o squad opera normalmente e pede os dados que precisar como entrada.
