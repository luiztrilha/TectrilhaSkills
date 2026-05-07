# Agent-Forward Repository Template

Este guia registra como adaptar, de forma publica e segura, ideias de templates
de repositorios preparados para trabalho com agentes.

Referencia avaliada:
[`xklob/codex-repo-template`](https://github.com/xklob/codex-repo-template).

## Decisao Para Este Ambiente

Use como referencia de padrao, nao como dependencia direta.

Promova:

- documentos raiz que mantenham produto, arquitetura, design, estilo e planos
  fora do historico efemero de chat;
- `AGENTS.md` pequeno, com precedencia de regras, limites de edicao e comandos
  de validacao;
- planos executaveis para mudancas amplas;
- revisao visual com screenshots quando a mudanca afetar UI;
- bootstrap guiado para novos repositorios;
- vetting antes de copiar skills, scripts ou configuracoes de terceiros.

Nao promova automaticamente:

- `.codex/config.toml` externo;
- `approval_policy = "never"`;
- `sandbox_mode = "danger-full-access"`;
- comandos que instalem pacotes ou usem rede sem revisao;
- keys como `STITCH_API_KEY`, OAuth tokens ou `.env`;
- skills externas que leem credenciais, perfis de navegador ou estado local;
- scripts grandes sem revisao de licenca, rede, filesystem e entrada externa.

## Estrutura Recomendada

Para um novo repo que deve ser operavel por humanos e agentes, comece com:

```text
AGENTS.md
PRODUCT.md
ROADMAP.md
ARCHITECTURE.md
DESIGN.md
CODESTYLE.md
PLANS.md
docs/
plans/
src/
tests/
assets/
```

Use [`../templates/repository-guidance/`](../templates/repository-guidance/)
como starter publico desses arquivos.

## Contrato Dos Documentos

| Arquivo | Funcao |
|---|---|
| `AGENTS.md` | Regras ativas para agentes: escopo, arquivos protegidos, validacao, docs e handoff. |
| `PRODUCT.md` | Verdade atual do produto: usuarios, workflows, limites e comportamento visivel. |
| `ROADMAP.md` | Direcao futura, prioridades e nao-prioridades explicitas. |
| `ARCHITECTURE.md` | Mapa tecnico: modulos, dados, integracoes e decisoes. |
| `DESIGN.md` | Linguagem visual, UX, componentes, estados e evidencias esperadas. |
| `CODESTYLE.md` | Estilo de codigo, organizacao, testes, comentarios e tamanho de arquivos. |
| `PLANS.md` | Formato e regras para planos executaveis. |

## Quando Criar Um Plano

Crie um plano executavel quando a mudanca:

- atravessar varios arquivos ou modulos;
- alterar comportamento publico;
- mexer em runtime, seguranca, deploy, dados ou integracoes;
- exigir comparacao de alternativas;
- precisar de QA visual;
- tiver risco de regressao relevante.

Nao crie plano pesado para ajuste pequeno, bug obvio com teste claro ou edicao
documental pontual.

## QA Visual

Para mudancas de UI, o plano deve registrar:

- superficie afetada;
- viewport(s) relevantes;
- estados testados;
- screenshots ou evidencia equivalente;
- defeitos encontrados e corrigidos;
- defeitos adiados com motivo.

Esse padrao pode ser combinado com Playwright, screenshots do sistema ou outra
ferramenta local ja aprovada. A ferramenta e secundaria; a evidencia e
obrigatoria quando a mudanca visual e material.

## Bootstrap Seguro De Novo Repo

1. Copie apenas os templates documentais necessarios.
2. Substitua placeholders por informacao real do projeto.
3. Escreva primeiro regras de seguranca e arquivos protegidos.
4. Liste comandos reais de setup, build, teste e lint.
5. Defina quando o manual/docs precisam ser atualizados.
6. Adicione um primeiro plano em `plans/` se a proxima mudanca for ampla.
7. Rode `git diff --check` e a validacao minima do repo.

## Vetting De Terceiros

Antes de copiar uma skill, script ou config de um repo externo:

- leia todos os arquivos que seriam copiados;
- procure rede, secrets, execucao dinamica, acesso a credenciais e caminhos
  locais;
- confirme licenca e autoria;
- classifique risco como baixo, medio, alto ou rejeitado;
- copie comportamento reutilizavel, nao estado nem config do autor;
- documente o motivo da absorcao.

## Aplicacao No Tectrilha

Este padrao deve ser usado como guia para novos repos publicos ou privados. Em
repos existentes, aplique seletivamente: nao substitua regras locais nem reduza
aproval/sandbox sem autorizacao explicita.
