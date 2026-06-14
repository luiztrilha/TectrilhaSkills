# TectrilhaSkills

Guia público para projetar, revisar, instalar e operar skills de agentes,
MCPs, padrões de plugins, prompts, comandos e fluxos reutilizáveis de agentes.

Este repositório é um manual, não um snapshot de runtime. Ele explica padrões
reutilizáveis para skills no estilo Codex, Agents e Superpowers sem expor estado
local da máquina, memórias, sessões, segredos, estado de broker ou helpers de
projetos privados.

## Conteúdo

| Área | O Que Contém |
|---|---|
| `docs/` | Guias práticos para skills, MCPs, desenvolvimento de plugins, limites de runtime, comandos seguros e padrões de ambiente. |
| `catalog/` | Inventários publicamente seguros de skills, MCPs, marketplaces de plugins, prompts, comandos, exemplos e checagens de cobertura. |
| `templates/` | Material inicial seguro para criar novas skills públicas e orientar novos repositórios agent-forward. |
| `examples/` | Pequenos exemplos públicos que podem ser copiados ou adaptados após revisão. |
| `AGENTS.md` | Regras locais do repositório para manter este guia público, seguro e atualizado. |
| `AGENT-USAGE.md` | Instruções neutras de runtime para Codex, Claude, Gemini, OpenCode e outros agentes que leem este repositório. |

## Skills Cobertas

O catálogo de skills inclui:

- Skills de sistema do Codex, como geração de imagem, documentação da OpenAI,
  criação de plugins, criação de skills e instalação de skills.
- Skills de workflow do Codex para revisão, debugging, planejamento, documentos,
  automação de navegador, screenshots, orientação de segurança, vetting e
  verificação.
- Skills de design de Agents para frontend, layout, animação, tipografia,
  crítica, polimento, adaptação responsiva, performance e escrita de UX.
- Skills de workflow Superpowers para brainstorming, planejamento, TDD,
  debugging sistemático, code review, worktrees, verificação e fluxos com
  subagentes.
- Referências presentes apenas no snapshot para OpenCode/GitNexus e skills de
  marketplaces de plugins Claude.

Arquivo principal: [`catalog/skills.md`](catalog/skills.md).

## MCPs Cobertos

O catálogo de MCPs documenta padrões de uso publicamente seguros para:

- `serena`: navegação semântica de código e suporte de edição com contexto de
  projeto.
- `github`: operações de repositórios, issues, pull requests, busca de código e
  arquivos.
- `playwright`: automação de navegador, screenshots, snapshots, formulários e
  debugging de console.
- `filesystem`: acesso local a arquivos com escopos definidos por allowlists
  explícitas.
- `brave-search`: provedor opcional de busca web, ativado por configuração.
- `megamemory`: padrão de banco de memória por repositório, documentado apenas
  como referência de estado privado.

Arquivos principais:

- [`catalog/mcps.md`](catalog/mcps.md)
- [`docs/mcp-usage-patterns.md`](docs/mcp-usage-patterns.md)

## Padrões De Plugins E Marketplaces

O snapshot `local-runtime-profile` continha um grande corpus de marketplace
Claude/plugins. Este repositório absorve as partes publicamente seguras como
catálogos e padrões:

- estrutura de diretórios de plugin e `.claude-plugin/plugin.json`
- comandos, agentes, skills, hooks, scripts e `.mcp.json`
- integração de MCP dentro de plugins
- segurança de hooks e regras de publicação
- padrões de comandos de plugin companion do Codex
- referências de PR review, desenvolvimento de features, LSP, playground e
  plugin-dev

Arquivos principais:

- [`catalog/plugin-marketplaces.md`](catalog/plugin-marketplaces.md)
- [`catalog/prompts-and-commands.md`](catalog/prompts-and-commands.md)
- [`docs/plugin-development-patterns.md`](docs/plugin-development-patterns.md)
- [`docs/goal-oriented-agent-workflows.md`](docs/goal-oriented-agent-workflows.md)

## Templates De Repositório Agent-Forward

Este repositório também documenta como iniciar ou reorganizar projetos para que
humanos e agentes trabalhem com contexto versionado, planos claros e validação
explícita.

Padrão absorvido seletivamente de templates externos, sem copiar configs de
runtime arriscadas:

- documentos raiz: `AGENTS.md`, `PRODUCT.md`, `ROADMAP.md`, `ARCHITECTURE.md`,
  `DESIGN.md`, `CODESTYLE.md` e `PLANS.md`
- planos executáveis para mudanças amplas
- QA visual com evidência quando UI muda
- vetting antes de copiar skills, scripts ou configs de terceiros
- rejeição padrão de configs como `approval_policy = "never"` e
  `sandbox_mode = "danger-full-access"`

Arquivos principais:

- [`docs/agent-forward-repository-template.md`](docs/agent-forward-repository-template.md)
- [`catalog/repository-templates.md`](catalog/repository-templates.md)
- [`templates/repository-guidance/`](templates/repository-guidance/)

## Absorção Do Runtime Profile

O snapshot público `local-runtime-profile` tinha centenas de arquivos Markdown.
Eles não foram copiados em massa. Foram agrupados, revisados e representados
como catálogos publicamente seguros e padrões reutilizáveis.

Grupos absorvidos atualmente:

| Grupo | Tratamento |
|---|---|
| Skills e prompts Codex | Catalogados e resumidos. |
| Skills de design Agents | Catalogadas. |
| Skills, planos, specs e comandos Superpowers | Catalogados e resumidos como padrões de workflow. |
| Material de marketplace de plugins Claude | Catalogado e resumido como padrões de plugins. |
| Skills OpenCode/GitNexus | Catalogadas como referência. |
| Orientação e exclusões da raiz do profile | Resumidas como regras de limite de runtime. |

Arquivo principal: [`docs/local-runtime-profile-absorption.md`](docs/local-runtime-profile-absorption.md).

## Padrões E Regras

O guia captura padrões operacionais reutilizáveis:

- usar skills apenas quando a tarefa corresponder ao gatilho delas
- preferir skills estreitas em vez de pacotes amplos
- manter overrides locais de repositório apenas quando eles mudarem comportamento
- verificar antes de afirmar conclusão
- usar saída bruta de comandos para decisões operacionais, a menos que um
  sumarizador seja explicitamente solicitado
- não usar `distill` automaticamente
- manter allowlists de MCP estreitas
- tratar automação de navegador e escrita no filesystem como capacidades
  sensíveis
- promover padrões publicamente seguros, não artefatos privados de runtime

Arquivos principais:

- [`docs/environment-usage-patterns.md`](docs/environment-usage-patterns.md)
- [`docs/goal-oriented-agent-workflows.md`](docs/goal-oriented-agent-workflows.md)
- [`docs/runtime-profile-boundaries.md`](docs/runtime-profile-boundaries.md)
- [`docs/windows-powershell-recipes.md`](docs/windows-powershell-recipes.md)

## Modelo De Segurança

Este repositório é intencionalmente seguro para publicação. Ele documenta como
usar e projetar skills/MCPs sem publicar o runtime privado do usuário.

Este repositório não deve conter:

- tokens, credenciais, estado OAuth, perfis de navegador ou arquivos de config
  crus
- memórias de runtime, logs de sessão, histórico de shell, telemetria ou bancos
  locais
- helpers de projetos privados, scripts de banco, estado de empresa ou estado
  de broker
- caminhos específicos de uma máquina
- exportações amplas de um runtime vivo

Alguns itens são intencionalmente catalogados, mas não copiados:

- helpers privados de banco de dados
- bancos locais de memória
- config crua de MCP ou Codex
- árvores de código de plugins de terceiros que precisam de revisão separada de
  licença e segurança
- planos/specs históricos úteis como referência, mas não como regras ativas

## Workflow Recomendado

1. Decida se o comportamento pertence a uma skill, regra de repositório ou
   documentação normal.
2. Escreva a skill com um gatilho estreito e um contrato de saída claro.
3. Faça vetting dos arquivos em busca de segredos, caminhos locais e comandos de
   risco.
4. Teste a skill em um runtime local descartável ou em um pequeno fixture de
   repositório.
5. Promova apenas as partes reutilizáveis.

## Workflow De Manutenção

Quando uma nova skill, MCP, prompt, comando, padrão de plugin ou regra de
ambiente for adicionada localmente:

1. Decida se ela é segura para publicação.
2. Adicione ao catálogo correspondente.
3. Promova o comportamento reutilizável para um guia em `docs/`.
4. Marque itens privados, externos sem vetting completo ou com estado como `reference-only` ou
   `excluded-private`.
5. Rode checagens de formatação, segredos e paths antes de publicar.

Para checar se o ambiente local e este guia ainda estão alinhados, rode:

```powershell
.\scripts\tectrilha-env-sync-preview.ps1
```

Essa checagem é apenas prévia: ela não instala, copia, sobrescreve ou aplica
mudanças no runtime.

## Regra De Atualização

Mantenha este repositório atualizado sempre que conhecimento reutilizável sobre
skills mudar em um repositório público ou no ambiente global
Codex/Agents/Superpowers. Promova o padrão publicamente seguro, não o artefato
privado de runtime.

## Comece Aqui

- [Guia de uso para agentes](AGENT-USAGE.md)
- [Anatomia de skill](docs/skill-anatomy.md)
- [Instalação de skills](docs/installing-skills.md)
- [Criação de skills públicas](docs/creating-public-skills.md)
- [Vetting de skills](docs/vetting-skills.md)
- [Codex, Agents e Superpowers](docs/codex-agents-superpowers.md)
- [Padrões de uso do ambiente](docs/environment-usage-patterns.md)
- [Workflows orientados a objetivos](docs/goal-oriented-agent-workflows.md)
- [Limites de runtime profile](docs/runtime-profile-boundaries.md)
- [Padrões de uso de MCP](docs/mcp-usage-patterns.md)
- [Padrões de desenvolvimento de plugins](docs/plugin-development-patterns.md)
- [Padrões de orientação por repositório](docs/repository-guidance-patterns.md)
- [Padrões de testes em camadas (front + API + Sonar)](docs/layered-testing-patterns.md)
- [Padrões de arquitetura de frontend](docs/frontend-architecture-patterns.md)
- [Padrões de relatório de code review](docs/code-review-report-patterns.md)
- [Template de repositório agent-forward](docs/agent-forward-repository-template.md)
- [Absorção do local runtime profile](docs/local-runtime-profile-absorption.md)
- [Receitas Windows PowerShell](docs/windows-powershell-recipes.md)
- [Catálogo de skills](catalog/skills.md)
- [Catálogo de MCPs](catalog/mcps.md)
- [Catálogo de marketplaces de plugins](catalog/plugin-marketplaces.md)
- [Catálogo de templates de repositório](catalog/repository-templates.md)
- [Catálogo de prompts e comandos](catalog/prompts-and-commands.md)
- [Scan do ambiente](catalog/environment-scan.md)
- [Checagem de cobertura](catalog/coverage-check.md)

## Limitações

- Este não é um runtime profile instalável.
- Ele não garante que uma skill ou MCP esteja instalado em qualquer máquina.
- Ele não inclui segredos, estado, paths privados ou bancos locais.
- Ele cataloga parte do material upstream/plugin como `reference-only`, em vez
  de versionar a fonte.
- Ele prioriza orientação pública durável em vez de reprodução exata de uma
  máquina privada.

## Relação Com DunderIA

`dunderia-public-export` pode apontar para este repositório como guia
reutilizável de skills. Snapshots de runtime profile devem permanecer pequenos e
sanitizados; este repositório carrega a orientação longa.
