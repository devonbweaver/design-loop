# inventory.md — the shopping catalog (build from proven-beautiful, don't generate)

The single biggest cause of vibe-coded UI is **generating components from scratch.** Beautiful
UI starts from beautiful raw material. Before building anything, SHOP this catalog: pull the
closest proven component or real design system, then adapt it to the house tokens. Generating
from scratch is the last resort.

## A. Component registries — shop + install real components (shadcn protocol)

All shadcn-compatible: `npx shadcn@latest add <url-or-namespace>`, then re-skin to house tokens.

| Registry | Install | Best for |
|---|---|---|
| **shadcn/ui** | `npx shadcn@latest add button dialog …` | the accessible primitives — the base everything sits on |
| **Cult UI** | `npx shadcn@latest add @cult-ui/<name>` · search `npx shadcn search @cult-ui --query "…"` · registry `@cult-ui` → `https://cult-ui.com/r/{name}.json` | animated / textured / creative components — texture cards + buttons, gradients, dock, text effects, bg animations |
| **Skiper UI** | `npx shadcn add @skiper-ui/<name>` (e.g. `skiper40`) | flashy signature / motion moments — image reveal, dynamic island, cursor trails, scroll + hover effects (106+ premium) |
| **Watermelon UI** | `npx shadcn@latest add "https://registry.watermelon.sh/<name>.json"` | premium blocks, dashboards, marketing sections (React 19 · Tailwind v4 · Radix · Framer Motion) |
| **21st.dev** | `npx shadcn@latest add "https://21st.dev/r/<name>"` or its Magic MCP | the broad marketplace — generate 2–3 variants of a hard component, let the System critic reject off-token ones |

Pick by need: **signature motion →** Skiper / Cult · **block or dashboard →** Watermelon ·
**primitive →** shadcn/ui · **broad search →** 21st.

**More verified registries (MIT unless noted):** **MagicUI** (`magicui.design`, animated
components/effects) · **Motion-Primitives** (`motion-primitives.com`, motion-first primitives) ·
**Base UI** (`base-ui.com`, unstyled a11y primitives; exposes `var(--transform-origin)` — the hook
a correct popover/tooltip origin needs) · **Radix Themes** (token-driven coherent scale) ·
**danielpetho/fancy** (deliberately non-generic text/motion effects — antidote to the templated
hero) · **KokonutUI** (Tailwind + shadcn + Motion) · **Tremor** (Apache-2.0, dashboard/chart
components — the weakest spot in generated UI) · **birobirobiro/awesome-shadcn-ui** (index to the
whole registry ecosystem) · **svgl** (`svgl.app`, real brand logos, so you never hand-draw an SVG) ·
**Geist** (`vercel/geist-font`, OFL — a non-Inter default face).

## B. Design-system & inspiration references — get the LANGUAGE to build to

Not components — the taste bar and tokens for Phase 1–2. **Shop a real `DESIGN.md` before you
write adjectives.** A `DESIGN.md` is a single markdown file carrying a brand's visual language as
*token + rule + rationale* in a form an agent can act on (the 9 sections below). Handing the build
a real one is the whole difference between "make it Linear-grade" — which ships vibe-coded — and a
bar with actual hex, a real type scale, and the one bold move named.

| Source | Where / how | What you get |
|---|---|---|
| **getdesign.md** (+ awesome-claude-design) | CLI: `npx getdesign@latest add <brand>` writes `./DESIGN.md` · `npx getdesign@latest list` shows all brands. Catalog: `github.com/VoltAgent/awesome-claude-design` · previews: `getdesign.md/<brand>/design-md` | **~75 free, MIT, ready-to-use `DESIGN.md` files** of real product looks — Linear, Stripe, Vercel, Notion, Apple, Supabase, Figma, Coinbase, Tesla, Spotify… Each is 400–550 lines: hex tokens with semantic roles, a full type scale (size/weight/tracking/use), layout + elevation + components + do's/don'ts + responsive, and Google-Fonts substitutes for proprietary faces. **The fastest way to a real Phase-1 bar.** |
| **Refero** | `styles.refero.design` + Refero MCP | 2,000+ AI-readable design-system exports of real products, plus MCP to research real product screens + full user flows. Use when getdesign lacks the brand, or to study live screens/flows before building. |
| **Mobbin** | `mobbin.com` | real mobile/web app screens + flows, indexed by pattern |
| **Godly / Cosmos / Land-book** | `godly.website` · `cosmos.so` | curated web-design inspiration for the reference bar |

**The 9 sections of a `DESIGN.md`** — what the Craft/System critics hold the build to:
1 Visual theme & atmosphere · 2 Color palette & roles (hex + semantic names) · 3 Typography rules
(scale, weights, tracking, font substitutes) · 4 Component styling (with states) · 5 Layout
principles (spacing, grid, whitespace) · 6 Depth & elevation · 7 Do's & don'ts (the guardrails) ·
8 Responsive behavior · 9 Agent prompt guide. **Adapt the mechanisms to the house tokens — never
1:1-clone a named brand** (trademark; the files are "inspired by publicly observable patterns").

## C. Motion libraries — shop the movement, don't hand-roll timing

design-loop builds motion; pull the mechanism from a real library and tune it to the motion tokens
(`motion-bar.md`). All MIT unless noted.

| Library | Where | Best for |
|---|---|---|
| **Motion** (ex-Framer Motion) | `motion.dev` · motiondivision/motion | the default React motion engine — layout/shared-element transitions, springs, gestures |
| **motion-primitives** / **magicui** | section A | ready-made reveal / hover / scroll effects to adapt |
| **auto-animate** | formkit/auto-animate | one-line list & reorder enter/exit — cheap, tasteful |
| **number-flow** | barvian/number-flow | animated numerals — the honest way to do stat count-ups |
| **Lenis** | darkroomengineering/lenis | smooth-scroll base for scroll-driven reveals / parallax |
| **anime.js** | juliangarnier/anime | timeline-based sequences for a signature moment |
| **Theatre.js** | theatre-js/theatre (Apache-2.0) | keyframed, art-directed sequences |
| **GSAP** | greensock/GSAP | powerful, but **non-OSI license — reference/technique only, don't vendor** |

Reduced-motion is not optional (`motion-bar.md`): every one of these collapses to an instant change.

## D. Skills & rubrics to mine — steal the critic's standards, not just components

Real, shipped design skills whose rubrics sharpen this loop. Mine the technique; check the license
before vendoring any file.

| Repo | License | What to take |
|---|---|---|
| **emilkowalski/skills** | MIT | `review-animations/STANDARDS.md` (hard-number motion rubric + easing tokens), `improve-animations/AUDIT.md` ("never approximate a value — copy it"), `animate/RECIPES.md` (copy-paste motion recipes). The single richest motion source. |
| **vercel-labs/web-interface-guidelines** | MIT | `AGENTS.md` — the deterministic MUST/SHOULD/NEVER gate: APCA over WCAG2, layered shadows, concentric nested radii, hue-consistent borders/shadows, `tabular-nums`, curly quotes, `text-wrap:balance`, `min-w-0` on flex children, optical ±1px. Feeds `visual-defect-gate.md`. |
| **OneRedOak/claude-code-workflows** | MIT | `design-review/design-review-agent.md` — the critic PROCESS: live-environment-first, 8 phases, viewport set (1440/768/375), "problems over prescriptions," triage matrix. |
| **educlopez/ui-craft** | MIT | `critique/SKILL.md` — mandatory visual capture (or stamp `[CODE-ONLY]`), the `CRAFT_LEVEL` knob (3 / 5–7 / 9+), the Anti-Slop Test, the "signature detail" lens. |
| **bitjaru/styleseed** | MIT | versioned per-stage visual evidence (`.styleseed/evidence/<surface>/<sha>/`) so "did it get better?" is checkable, plus programmatic semantic-palette generation. |
| **anthropics/skills** | per-skill | `webapp-testing/` (boot + drive + capture-console plumbing for the critique half) and `web-artifacts-builder/` (pre-bundled shadcn for self-contained builds). |
| **iart-ai/motion-skills** | MIT | the render-frame → screenshot → check loop for motion (static stills can't judge movement). |

## E. DESIGN.md tooling + prompt sources — the "why it works" layer

| Source | License | What to take |
|---|---|---|
| **google-labs-code/design.md** | Apache-2.0 | `PHILOSOPHY.md` (region-vs-point, don't-list-as-diagnostic, prose-over-tokens — see `reference-and-brief.md`), the 8-section spec, and the **linter** `npx @google/design.md lint DESIGN.md` (token-ref + WCAG checks as JSON). |
| **VoltAgent/awesome-design-md** | MIT | 73 more brand `DESIGN.md` files (a 9-section variant — don't conflate with Google's 8-section spec). |
| **x1xhlol/system-prompts-and-models-of-ai-tools** | GPL-3.0 — technique only, don't vendor | v0's Design Guidelines + `GenerateDesignInspiration` tool; Lovable's "design system is everything." The numeric-floor + binding-brief sources behind `reference-and-brief.md`. |
| **jujumilk3/leaked-system-prompts** | **no license — reference only, re-derive wording** | Anthropic's own design-agent prompt: silent-on-pass verifier, "the tree is a menu, not the meal," the slop-trope list. Informs `judge-reliability.md`. |

## The retrieval workflow

```
Screen / component need
   ↓  query = task + archetype + interaction + platform + density
Pick a registry (A) for the component + a real DESIGN.md (B) for the design language
   ↓  getdesign: `npx getdesign@latest add <brand>` → ./DESIGN.md, or Refero / Refero MCP for live screens
   ↓  install the closest component, then ADAPT it to house tokens (adapt, never paste)
Build / update the interaction test
   ↓
Craft + System + Motion critics   (retrieval is raw material, NOT permission to ship)
   ↓
Approved → versioned private-registry asset
```

## Rules

- **Shop before you generate.** A proven component adapted to your tokens beats a from-scratch
  one almost every time. From-scratch is the last resort and the #1 source of the vibe-coded look.
- **Adapt, never paste.** Shopped components arrive on the reference's tokens — re-skin to the
  house system (`craft-standards.md`) or they read as bolted-on.
- **Retrieval is not a pass.** The critics keep final say; a shopped component that's wrong for
  the context or off-bar still fails.
- **Pull a real `DESIGN.md` for the bar.** In Phase 1–2 shop a real design system
  (`npx getdesign@latest add <brand>`, or Refero) so the craft bar is actual hex + type scale +
  the one bold move — not adjectives. "Make it X-grade" with no file is the #1 cause of the
  vibe-coded look, and the reason a critic can still rubber-stamp something that's actually weak.
- **Provenance + licensing** per shopped component (`build-from-inventory.md`): source URL,
  install command, license. Inspiration is free; importing distinctive code/assets needs a
  compatible license.
