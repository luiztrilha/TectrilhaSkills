# Frontend Architecture Patterns

Public-safe, framework-agnostic model for organizing SPA frontends (Vue or React)
and the cross-cutting best practices that travel with it. Use placeholders
(`<Domain>`) instead of any private product names.

## Hybrid architecture

Don't force pure Atomic Design or pure feature-folders. Use three axes:

- **Atomic Design** only for shared UI with no business rule.
- **Domain organization** for components that carry business rules.
- **`views`** as the entry point for routes/screens.

This avoids ornamental refactors and preserves the project's real shape.

## Decision rule (before creating a component)

1. Does it know a domain's business rule?
2. Is it reusable across different flows?
3. Does it represent a screen/route or a smaller piece?

Then: business rule → its domain; purely visual + reusable → shared UI;
route page → `views`.

## Recommended structure

```text
src/
  views/                 # route pages (entry points)
  components/
    shared/
      ui/{atoms,molecules,organisms}/
      layout/            # shell, nav, footer, empty/forbidden states
    <Domain1>/           # business components per domain
    <Domain2>/
  classes/ | services/   # logic, adapters, API clients
  composables/ | hooks/  # reusable stateful logic
  router/  utils/  assets/
```

## Per-component structure

One component = one self-contained folder:

```text
<Component>/
  index.*           # implementation + export
  interfaces|types  # typed props/contract in its own file
  styles            # co-located, component-scoped (no global leakage)
  components/        # subparts when composed
  *-context         # local context when state is shared
```

Compose with subcomponents instead of one giant file driven by flags.

## Creation rules

- A new component doesn't get dropped loose without reason.
- Real reuse across modules → pull into `shared`.
- Reuse only inside one domain → keep in the domain.
- Don't create atom/molecule/organism by naming; classification reflects
  responsibility, not a label.

## Routing

- Router points to `views` at page level.
- Child routes may point to domain components when they are tabs/sections.
- A deep business component doesn't become `shared` just because two similar
  screens use it.

## Design system

- Consume a shared design-system library instead of recreating primitives
  (button, input, card, dialog, table).
- Wrap a DS component locally only for recurring project behavior/style — don't
  duplicate the primitive or fork it for a one-off; contribute upstream.

## Cross-cutting best practices

- **Types:** TypeScript on props, API returns, contracts; avoid `any`.
- **State:** local near use; lift only when shared; global store only for truly
  cross-cutting state (session, user, theme).
- **Data:** isolate fetch/error/loading in a service/composable, not scattered in
  view components.
- **Consistent patterns:** one way to handle error, loading, and forms; replicate
  the existing correct pattern instead of inventing variants.
- **Performance:** avoid needless re-renders (stable refs, memo), lazy-load
  routes, don't over-fetch.
- **Accessibility:** correct semantics, focus, labels, contrast, touch targets.
- **Style:** theme tokens/variables over magic values; respect the established
  design, no broad visual change without need.

## Incremental migration

1. Build new pieces in the right place (shared or domain).
2. Move only files touched by real tasks.
3. Don't mass-refactor just to match the theory.

## Don't

- Don't reorganize everything into atoms/molecules/organisms/templates/pages.
- Don't move domain components to `shared` without clear reuse.
- Don't duplicate a component to satisfy a taxonomy.
- Don't create global CSS that leaks into other components.

## Optional: GitFlow-style branches (when the DS repo uses it)

`feature/` (new feature, from develop), `hotfix/` (urgent fix, from staging),
`refactor/` (no behavior change), `chore/` (deps/scripts). Rebase to keep short
branches clean; `merge --no-ff` for official lines. Promote staging → release
with a semantic tag, then backflow release → develop.
