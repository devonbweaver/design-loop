---
name: design-loop
description: A testable design-production loop. Freezes a versioned bar from a real reference, protects an immutable house system, optionally shops curated inventory for proven raw material, builds a piece, gates it through deterministic task-success + mechanical checks BEFORE any model judges it, then runs fresh-context critics on screenshots AND recorded interactions — until every required gate and critic passes against the frozen bar. Triggers on "/design-loop", "design loop", "run the critic loop", "loop this against".
---

# Design Loop

A build → verify → fix loop that makes design quality *testable*. Two rules run
through everything:

1. **Deterministic gates run before model judges.** A task runner and mechanical
   checks (tokens, a11y, focus, console, visual-regression) must pass first —
   don't spend the strongest model judging a failure a linter or test can prove.
   A mechanical failure is always a hard fail.
2. **Critics judge evidence only** — rendered screenshots + recorded interactions,
   never code, prompts, model identity, or prior verdicts. Verdicts are binary.

The exit is: **all required deterministic gates AND all required critics pass
against a FROZEN bar.** The builder never chooses or alters its own grading bar.

Detail lives in `references/` — load the file for the phase you're in:
`freeze-and-versioning.md` · `mechanical-gate.md` · `motion-bar.md` ·
`interaction-loop.md` · `build-from-inventory.md` · `judge-reliability.md` ·
`critic-escalation.md`.

## Files a run uses (split immutable vs derived)

```
references/house-system.md        # IMMUTABLE product rules, tokens, a11y baseline — a reference may NOT overwrite this
project-brief.md                  # task + content requirements
visual-bar.md                     # DERIVED from the static reference
motion-bar.md                     # DERIVED from the motion reference + house constraints
interaction-contracts/*.md        # deterministic, testable scenarios
reference-provenance.md           # URLs, captured artifacts, dates, licenses, inspiration-vs-code
loop-manifest.json                # the frozen bar (see Phase 0)
```

## Phase 0 — Freeze

Before any build: capture the reference assets LOCALLY and evaluate from those
captures, not a live URL that can change. Lock the bar into `loop-manifest.json`
(bar version, reference-capture hash, viewport, browser engine, font-manifest
hash, house-system version, motion-system version). During a loop the bar cannot
change; any bar change invalidates earlier passes and starts a new loop version.
Include the manifest hash in every critic packet and registry asset. See
`references/freeze-and-versioning.md`.

## Phase 1 — Interview

Ask, together, then stop: what you're building + how big; one real reference that
does it brilliantly (a specific URL); when motion matters, a *second* reference
for how it should MOVE; and the target files. A vague reference is the #1 failure
— push once for specificity. If skipped, browse styles.refero.design and propose
three candidates.

## Phase 2 — Preflight

A check, not a question. Confirm you can: fetch/capture the reference; render the
app; use seeded/fixed test data; capture video + trace filmstrip + a
`prefers-reduced-motion` run; and reach the required inventory sources. Report
what works, what's missing, and **which gate/critic goes blind**. Never proceed
with a blind judge.

## Phase 3 — Teardown

Write the DERIVED bars as checkable *mechanisms, not adjectives* — WITHOUT
modifying `house-system.md` (the static reference influences the visual bar, it
never replaces your typography/spacing/a11y):
- `visual-bar.md` — measurable layout rules **per page class** (a dense
  operational screen ≠ a marketing page; don't use a blunt "40% whitespace" rule
  that empty space can game).
- `motion-bar.md` — motion tokens + binary motion rules (from `references/motion-bar.md`), when motion is in scope.
- `interaction-contracts/*` — precondition → trigger → expected spatial/temporal result → evidence.
- `reference-provenance.md` — source, date, license, and whether you took visual
  inspiration only or actual code (importing distinctive assets/code needs a
  compatible license).
Show the bars to the user before continuing.

## Phase 4 — Retrieve

Shop proven inventory for the closest fit and ADAPT it (raw material, never
permission to ship): private approved registry → shadcn registries
(cult-ui/skiper-ui/watermelon/21st) → galleries (Refero/Godly/Mobbin/Cosmos),
queried by task + archetype + interaction + platform + density, filtered against
the FROZEN bars. See `references/build-from-inventory.md`. Skip for a piece with
no proven prior art.

## Phase 5 — Build

Split into 3–4 pieces. Per piece the builder adapts the retrieved pattern into
house primitives AND writes/updates: a deterministic **task test** (the flow
completes) and **interaction tests** (the motion contracts), plus normal +
reduced-motion artifacts.

## Phase 6 — Mechanical gate (deterministic, before any model judge)

Hard-fail gate. Nothing reaches the model panel until this passes. See
`references/mechanical-gate.md`:
- **Task runner** — a deterministic Playwright flow using role/name locators must
  complete the target task end-to-end (create → submit → success feedback →
  open detail → keyboard-dismiss → focus returns), no timeouts, no console/
  network errors, no blocked controls. A beautiful screen that blocks the user
  fails here, before Craft/Motion ever see it.
- **Deterministic checks** — token-only colors / banned hex, spacing scale,
  animation-duration ranges, reduced-motion behavior, focus states, heading
  hierarchy, keyboard nav, contrast where measurable, and `toHaveScreenshot`
  visual-regression baselines for canonical states (wait for stability first).
  Run a11y scans *after* opening each interactive state (menus/dialogs/sheets
  aren't in the initial DOM).
A mechanical failure returns the concrete failing step + trace to the builder.

## Phase 7 — Evidence capture

For passing pieces, generate the critic packets: screenshots, interaction video,
trace filmstrip (timestamped frames), motion manifest, task trace, reduced-motion
run, and artifact hashes. **Match evidence + critics to the change tier** (Tier
0 copy/style → mechanical + one screenshot; Tier 3 signature interaction → full
evidence + all four critics + refutation; Tier 4 shared primitive → that plus
repeated clean runs + human review) — see `references/critic-escalation.md`.
Baseline 12-scenario matrix **plus task-specific scenarios** (don't let agents
optimize only for the fixed matrix). See `references/interaction-loop.md`.

## Phase 8 — Independent panel

Fresh-context critics, evidence only, binary verdicts:
- **Brief** (Sonnet) — does it serve the user's actual goal / task fit? (the task
  runner already proved the flow *works*; Brief judges whether it's the *right* one.)
- **System** (Haiku) — the *model half* of adherence: hierarchy, density,
  cognitive load, emphasis, whether system use feels coherent. (Deterministic
  token/a11y checks already ran in Phase 6.)
- **Craft** (strongest model, never downgraded) — **meets or exceeds the relevant
  visual mechanisms from the reference while improving task fit, system
  coherence, and accessibility.** NOT shallow pixel mimicry — ours may surpass
  the reference with a different visual idiom + better workflow.
- **Motion** (strong model, motion in scope only) — judges the interaction
  artifact packet against `motion-bar.md`; not outvoted by static judges on a
  signature interaction.
Reliability controls (blind order, fresh context, single-gap, adversarial
refutation on flagship passes, calibration set, human spot-checks): see
`references/judge-reliability.md`.

## Phase 9 — Repair

Any fail → return exactly ONE highest-leverage failed gap + the smallest testable
repair. Re-run **from the mechanical gate onward** (Phase 6). No fixed round count.

## Phase 10 — Promote

On full pass, store the component/pattern in the private registry with its
implementation, evidence set, task + interaction tests, reference provenance,
critic verdicts, and **which bar + system versions it passed**. A single pass
makes it a **candidate**, not a trusted block — it becomes **approved** only
after clean repeat runs, scope review, and a human spot-check sized to its blast
radius (see `references/critic-escalation.md`). A lucky one-run pass must never
bank permanent confidence. The loop stops re-generating taste and starts
assembling proven decisions.

## Cost

No fake token counts. Show round count + pieces + which gates ran. If the user
names a ceiling, pause and ask. The real brake is them watching and stopping.

## What breaks this

- A vague or unfrozen bar; the builder altering its own bar; evaluating from a
  live URL that changes mid-loop.
- Skipping the mechanical/task gate and spending the strongest model on failures
  a test could prove.
- The static reference overwriting the immutable house system.
- The builder judging its own work; a soft critic; numeric scores (they inflate).
- Judging motion from a still, or raw video with no filmstrip/contract.
- Retrieval treated as permission to ship.
- Optimizing only for the fixed scenario matrix; gaming a blunt whitespace rule.
- Over-specifying — every extra instruction is one fewer decision the model makes with judgment.

## Start narrow

Don't boil the ocean. Build a v1 around ONE page type (e.g. an agent-run list +
detail sheet) end-to-end and validate artifact capture, critic disagreement,
repair quality, pass cost, and registry promotion before expanding.
