# Layered Testing Patterns

Reusable, public-safe model for testing web projects in layers, plus how a
static-analysis platform (SonarQube/SonarCloud) consumes the test output. Written
generically — replace placeholders (`<project-key>`, `<host>`, paths) with your
own. No machine-specific paths or secrets belong here.

## Principle

Test each change at the cheapest layer that proves the behavior. Climb a layer
only when the one below cannot cover the risk.

Goals: fast local feedback, protect the frontend/API contract, cover critical
auth/routing/authorization paths, keep each test's intent explicit, give agents a
stable rule set.

## Frontend (SPA) layers

```
unit -> component -> contract/smoke (Node) -> E2E (browser) -> mutation
```

- **Unit** (`tests/unit/**`) — pure functions, API adapters, validators,
  router/auth helpers, composables/hooks. Light DOM env (happy-dom/jsdom).
- **Component** (`tests/component/**`) — small deterministic UI pieces. Stub
  shared children; assert route-derived props. Don't mount the largest views —
  extract logic first.
- **Contract / smoke** (`scripts/test-*.js`, `scripts/smoke-*.js`) — fixtures,
  route invariants, source-structure checks; first-class protections, not
  throwaway.
- **E2E** (`tests/e2e/**`) — critical paths (boot, public route, protected-route
  redirect, high-value authed flows). Mock the backend with route interception,
  one route/flow per spec.
- **Mutation** (optional) — scope to the most sensitive pure logic to measure
  test strength, not just coverage. Set high/low thresholds.

Coverage: off by default, enabled by a `--coverage` flag. Exclude generated code
and type-only files from the denominator. Use ratchet thresholds (raise per
phase, never lower).

## Backend / API layers (.NET example)

```
contract (reflection) -> architecture -> domain unit
   -> controller + authorization (real DB) -> integration pipeline (host factory)
```

- **Contract** — verify, via reflection over controllers, that each endpoint
  exposes the expected route template + name. Pure, no DB, no host. Protects the
  contract the frontend consumes; table many routes with data-driven cases.
- **Architecture** — structural invariants: DI registration, banned legacy
  dependencies, environment/host config validation.
- **Domain unit** — pure business logic exercised directly; in-memory DB only if
  an EF context is needed.
- **Controller + authorization** — instantiate the controller with a real test
  DB (per-test isolated database), a mocked logger, and a request/scope object
  describing the authenticated user. Assert the result type and content.
  **Security-critical:** always prove scope filtering — an allowed id returns, an
  out-of-scope id disappears / 404s / is blocked. Cover read, batch, filter,
  mutation.
- **Integration** — spin up the real app in memory (test host factory) to
  exercise the full pipeline (auth, middleware, routing, filters). Reserve for
  what only appears with the host mounted.

### Fixtures and builders

- A database fixture that creates a unique DB per test, seeds base catalogs,
  exposes their ids, and drops the DB on dispose — isolates each test.
- A scenario builder that assembles business entity graphs once, so tests don't
  repeat setup. Setup repeated in 2+ tests becomes a builder/fixture method, not
  copy-paste.
- Heavy resources (PDF generation, etc.) get their own one-time fixture.

## Naming and placement

- Test class/file named after the protected surface; method names describe
  behavior, not implementation.
- Frontend: `*.test.ts` (unit/component), `*.spec.ts` (E2E, one flow per file).
- Backend: folders by concern (public/contract, architecture, entity +
  authorization). Builders/fixtures live next to the folder that uses them most.

## Sonar (static analysis + coverage panel)

Sonar is the static-analysis layer (bugs, code smells, vulnerabilities,
duplication) **and** the official coverage dashboard. It consumes the report the
tests produce; it does not replace tests.

### .NET via SonarScanner for MSBuild

```bash
dotnet sonarscanner begin /k:"<project-key>" \
  /d:sonar.host.url="<host>" /d:sonar.token="<TOKEN>" \
  /d:sonar.cs.opencover.reportsPaths="**/coverage.opencover.xml"
dotnet build <solution>
dotnet test <test-project> --no-build \
  /p:CollectCoverage=true /p:CoverletOutputFormat=opencover \
  /p:CoverletOutput=<out-dir>/
dotnet sonarscanner end /d:sonar.token="<TOKEN>"
```

- The scanner's working directory is generated — treat it like `bin`/`obj`,
  don't version or hand-edit it.
- Coverage for Sonar is OpenCover via the coverage collector; don't confuse it
  with the `cobertura` format used by a local heatmap script.
- Never commit the token; pass it via environment variable or CI secret.

### Frontend via JS/TS analyzer

Feed the Vitest `lcov` report:

```
sonar.javascript.lcov.reportPaths=coverage/lcov.info
sonar.sources=src
sonar.exclusions=<generated>/**,**/*.d.ts
```

### Local coverage heatmap (prioritization)

Generate a `cobertura` report and summarize it (global / per-package / per-file /
controllers-near-zero) to rank the highest-net-gain places to add tests. This
ranking is the work queue for a coverage campaign, far better than chasing a flat
percentage.

### Sonar best practices

- Treat the **Quality Gate on PRs** as a merge blocker (new-code coverage, zero
  new bug/vulnerability, duplication).
- Focus on **new code** (clean-as-you-code); don't get stuck on historical debt.
- Don't inflate coverage with assertion-free tests just to pass the gate.
- Exclude intentionally untestable code (generated, migrations, pure DTOs) via
  exclusions, not fake tests.
- Never suppress a security vulnerability/hotspot without a recorded
  justification; never change a password/crypto flow just to silence a finding.

## Limits

- Real-DB controller tests need a local database engine; without it, restrict to
  in-memory/reflection layers.
- Host-factory integration is slower — keep that layer lean and pipeline-focused.
- High coverage with weak assertions is still risk; coverage is not proof of
  correctness.
