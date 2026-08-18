# build-from-inventory.md — shop proven patterns, then gauntlet them

The builder should not generate every interface from scratch. It should act like
a senior design engineer: search proven patterns, choose the closest fit, import/
adapt it, then subject it to the same critic loop. **Retrieval supplies raw
material, not permission to ship — the critics keep final authority.**

## Retrieval pipeline

```
Screen contract
   ↓  query = task + UI archetype + interaction + platform + density
Top 3 inventory candidates
   ↓  System-compatibility filter (reject anything violating the bars/tokens/a11y)
Select one raw ingredient
   ↓  adapt to house tokens / components / content model  (adapt, don't paste)
Build/update the Playwright interaction test
   ↓
Static + Motion critics
   ↓
Approved pattern → versioned private-registry asset
```

## Inventory sources

- **Private approved registry** (first) — your own critic-approved components.
- **shadcn-compatible registries** — cult-ui, skiper-ui, watermelon UI, 21st.dev.
  Use the shadcn registry protocol; `registry.json` is the entry point, items are
  installable artifacts. 21st also exposes AI/MCP for coding agents (generate
  2–3 variants for a hard component, let the System critic reject off-token ones
  before code is admitted).
- **Interaction / visual galleries** — Refero, Godly, Mobbin, Cosmos. Index
  screenshots/videos **by pattern** (command-menu, data-table, side-sheet,
  agent-progress, bulk-action, empty-state, onboarding, search, filter-builder),
  not "find a pretty card."

## Provenance (so an agent can't blind-import something incompatible)

Every approved component carries a `component-card.json`:

```
intent, allowed contexts, visual variants, accessibility states/notes,
dependencies + weight, token usage, Playwright interaction tests,
reference provenance, prior critic outcomes, screenshots + interaction clips
```

## The private "Design Loop Registry" (the compounding advantage)

A critic-approved command palette, agent-status indicator, right-side sheet, and
activity timeline become high-confidence building blocks for every future
product. Distribute them through a shadcn-style registry (components, hooks,
pages, configs, motion recipes, test fixtures, critic-approved compositions).
Over time the system stops generating taste from scratch and starts assembling
from already-proven product decisions.
