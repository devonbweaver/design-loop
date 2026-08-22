# critic-escalation.md — match verdict cost to change risk

The panel is expensive. Judging every edit with four model critics is how a
padding tweak ends up paying for a full multimodal panel. Escalate by **change
tier**: cheap changes get mechanical proof; only signature interactions and
shared primitives earn the full gauntlet.

## Change tiers

| Tier | Example | Required checks |
|---|---|---|
| 0 — copy/style tweak | text change, token swap, spacing <8px | visual-defect check + one screenshot diff |
| 1 — local component | button, filter control, table-row state | visual-defect check + System critic + static screenshot |
| 2 — flow / new visual pattern | detail sheet, command menu, empty state, status flow | visual-defect gate + Craft/System + visual artifacts |
| 3 — signature interaction | agent-run sheet, onboarding, agent creation, drag/reorder | visual-defect gate + Craft/System/Motion + normal/reduced-motion video + refutation pass |
| 4 — shared primitive / registry promotion | Dialog, command menu, data table, focus trap, motion recipe | Tier 3 + repeated clean runs + human review |

A simple padding adjustment must not buy a Tier-3 panel; a shared foundation
must not slip through on Tier-1 scrutiny.

## Cost controls

- **Cheap gates first.** If the visual-defect gate (overflow, responsive, contrast, focus) checks
  fail, return the failure — never call a model critic on a build a check
  already rejected (this is the skill's governing rule 1, applied to spend).
- **Escalate only on material diffs.** A new state, interaction path, overlay,
  breakpoint, or motion change triggers Tier 2–4. A content-only change usually
  should not.
- **Critic only the delta.** Send the changed component's screenshots/interaction
  artifact plus just enough surrounding context to judge hierarchy — not the
  whole screen.
- **Batch static criticism.** Three changed components in one build → one clearly
  labeled contact sheet to the static critics, not three separate calls.
- **Skip unchanged critics.** Scope by file/component + visual-diff; don't
  re-judge surfaces the build didn't touch.
- **Cache reference artifacts.** Capture the reference once per frozen-bar
  version; never re-fetch/re-process it every iteration (see
  `freeze-and-versioning.md`).
- **Shard, don't shrink.** At scale, split Playwright across machines with
  `--shard=x/y` rather than dropping coverage.

## Promote slowly (candidate ≠ approved)

Passing once makes a **candidate** asset, not a trusted building block. It
becomes **approved** only after clean repeat runs, scope review, and a human
spot-check sized to its blast radius. A component that passed on a lucky single
run must not bank permanent confidence in the registry.
