# Repository Template Catalog

Catalogo de padroes publicamente seguros para iniciar ou organizar repositorios
que serao mantidos com apoio de agentes.

## Agent-Forward Repo Starter

Fonte de inspiracao avaliada:

- [`xklob/codex-repo-template`](https://github.com/xklob/codex-repo-template)

Status neste ambiente:

- `reference-only`
- util para documentos raiz, planos executaveis e QA visual;
- nao deve ser copiado inteiro;
- configs de Codex com `approval_policy = "never"` ou
  `sandbox_mode = "danger-full-access"` devem ser rejeitadas por padrao.

Material local promovido:

- [`../docs/agent-forward-repository-template.md`](../docs/agent-forward-repository-template.md)
- [`../templates/repository-guidance/`](../templates/repository-guidance/)

## Uso Recomendado

Use o starter quando:

- criar um novo repo que agentes vao operar com frequencia;
- organizar um repo existente que nao tem `AGENTS.md`, docs de produto,
  arquitetura ou plano;
- preparar um projeto publico para receber contribuicoes humanas e de agentes.

Evite quando:

- a tarefa for uma edicao pequena;
- o repo ja tiver regras locais suficientes;
- copiar o template criaria conflito com seguranca, sandbox ou fluxo de
  aprovacao existente.
