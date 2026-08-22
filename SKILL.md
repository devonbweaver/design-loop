---
name: design-loop
description: A build → critique → fix loop for making a front-end genuinely beautiful. It exists to kill generic, templated, "vibe-coded" UI and push the interface to Claude-design quality or better, judged by a harsh independent eye against a real reference and real craft standards. Use it whenever you are building or improving UI/UX — a page, a screen, a component, a whole app surface — and "it works" is not the bar; "it's beautiful" is. Triggers on "/design-loop", "design loop", "make this beautiful", "the UI looks vibe-coded", "level up this design".
---

# Design Loop

A build → critique → fix loop for one thing: making a front-end **genuinely beautiful.**
It assumes the thing renders and works. Its job is to take UI that looks generic,
templated, or vibe-coded and push it until an independent, harsh eye calls it genuinely
great — at or above the quality of a strong reference AND at or above Claude's own design
output.

This is NOT a linter, a test runner, an accessibility-only pass, or a backend/functional
auditor. Correctness is assumed. The work is taste, craft, and polish.

Two rules run through everything:

1. **Craft is the star, not QA.** Visual and interaction quality is the entire point.
   The only "gate" that matters is *visual* brokenness (overflow, broken responsive,
   unreadable contrast, jank). Everything else in the loop serves beauty.
2. **The judge is harsh and independent.** Fresh-context critics see only the rendered
   result, never the code. The Craft critic **fails anything merely acceptable** —
   generic, safe, templated, or vibe-coded. Binary verdicts, but the bar is "beautiful,"
   not "not broken."

The exit is not "it passes." The exit is a harsh critic saying **this is genuinely great.**
A loop that only checks for defects produces correct, accessible, on-token, and ugly. This
one is built to produce beautiful.

Detail lives in `references/` — load the file for the phase you're in:
`reference-and-brief.md` (how to set a bar the critic can enforce — read this for Phase 1–2) ·
`craft-standards.md` (what makes UI genuinely beautiful — the taste) · `visual-defect-gate.md` ·
`inventory.md` (the real component catalog) · `motion-bar.md` · `interaction-loop.md` ·
`build-from-inventory.md` · `judge-reliability.md` ·
`freeze-and-versioning.md` · `critic-escalation.md`.

## Phase 1 — Reference (set a bar worth beating)

Get ONE genuinely excellent reference: a specific, beautiful page that does this brilliantly
(a real URL), the subject and audience, and the target files. **A vague or weak reference is
the #1 reason this loop ships ugly work** — the Craft critic has nothing great to hold the
build to, so it rubber-stamps "fine." Push hard for a real one. If they skip, propose three
strong candidates from styles.refero.design / Mobbin / Godly / Cosmos and take the best. The
reference must be at least as good as the result you want. **Pull the reference as a real
`DESIGN.md`, never adjectives.** The fastest path: `npx getdesign@latest add <brand>` — ~75 free,
MIT `DESIGN.md` files (Linear, Stripe, Vercel, Notion, Apple, Supabase, …), each 400–550 lines of
real hex tokens, type scale, components, and do's/don'ts. Use **Refero** (`styles.refero.design`)
or the Refero MCP for brands getdesign lacks or to study live screens/flows (`inventory.md`).
"Make it Linear-grade" as an *adjective* is the #1 reason this loop still ships ugly — a real
`DESIGN.md` is the difference between a critic that rubber-stamps and one with a bar to enforce.
**Adjectives describe a region; a specific reference describes a point** — the model outputs the
center of an adjective's region, which is precisely the generic look. Write the brief as a file
(`reference-and-brief.md`): *Build [surface]. Used by [who], in [what moment], to [what decision].
Constraints: […]* — and treat it as **binding**. If no real reference is offered, route on
reference strength (`reference-and-brief.md`): apply the numeric floor for the reference-less case.

## Phase 2 — Design plan (teardown into craft mechanisms)

Read the reference properly and write the craft bar as **checkable mechanisms, not adjectives**
(see `craft-standards.md`): the type scale + pairing, the palette and how the neutrals are
biased, the spacing rhythm, the elevation/depth system, the **signature** (the one element the
page is remembered by), and the motion language. **Prose is the design; tokens are only context**
— after every value, say what it is *for* and where it must never appear; a values-only plan gets
filled with the model's generic priors. Then run the **plan self-audit**: put your plan next to
the same brief run cold — if any choice is what you'd produce for *any* similar page, it's the
default; revise it and say what you changed and why (`reference-and-brief.md`). A rambling list of
"don'ts" is a signal the reference is too vague, not a fix — sharpen the reference instead. Show
the revised plan before building — this is where taste is decided.

## Phase 3 — Build

**Shop before you generate.** Before writing a component from scratch, pull the closest
proven-beautiful one from the catalog (`inventory.md` — Cult UI, Skiper UI, Watermelon, 21st,
shadcn) and adapt it to the house tokens. Generating from scratch is the last resort and the
#1 source of vibe-coded UI. Follow `craft-standards.md`: deliberate
neutrals, a real type pairing, layout-driven spacing, both light and dark designed with equal
care, real copy (never lorem), and one bold move executed with conviction while everything
around it stays quiet. **Adapt into a variant, never override at the call site** — a shopped
component re-skinned per-instance reproduces the vibe-coded inconsistency; push the change into
the component's variant layer so it's systemic. **Remove the escape hatch:** style only through
the tokens — no raw `#hex`/`text-white`, no arbitrary `p-[13px]`, no per-call-site overrides, so
on-system is the only reachable output. If you change a surface's background, change its
foreground in the same edit (the contrast-pair invariant).

## Phase 4 — Evidence

Render it: screenshots at the real viewport(s), **both themes**, the key states
(hover / focus / empty / loading / error), and — when it's interactive — a recorded
interaction plus a reduced-motion run (`interaction-loop.md`, `motion-bar.md`). Critics judge
the rendered result, never the code.

## Phase 5 — Visual-defect gate + conformance sweep (a floor, not the goal)

A quick hard-fail on *visual brokenness only*: horizontal overflow, broken responsive,
clipped or colliding elements, unreadable contrast, obvious jank/layout shift, missing focus
states. A beautiful screen that is visually broken fails here. This is a floor you clear on
the way to the real work — **do not let it become the work.** See `visual-defect-gate.md`.
(Functional QA — does a flow complete, console errors, unit tests, the backend — is NOT this
skill's job.)

Run the **conformance sweep** here too, so expensive taste critics aren't wasted catching slips:
does every color / type size / component resolve to the system (no raw `#hex`, no arbitrary
bracket values, no call-site overrides)? Does the build match the **binding brief**? If a real
`DESIGN.md` is in play, `npx @google/design.md lint DESIGN.md` checks token references + WCAG
contrast and returns JSON. This is conformance, not taste — keep it separate from the critic panel.

## Phase 6 — Critic panel (the real loop)

Fresh-context, evidence-only, harsh. See `judge-reliability.md`.
- **Craft** (strongest model, never downgraded — the star). Is this genuinely beautiful,
  distinctive, and considered, at or above the reference AND at or above Claude's own design
  output? **FAIL anything that looks vibe-coded, generic, templated, safe, or merely fine.**
  Put ours beside the reference with labels stripped; if the reference is clearly better,
  that's a fail. Name the single biggest reason it isn't beautiful yet.
- **System / coherence** (strong model). Hierarchy, density, rhythm, consistency — does it
  read as designed by someone with taste, or assembled from parts?
- **Motion** (when interactive). Does it move beautifully and purposefully, judged from the
  recorded interaction, not a still (`motion-bar.md`)?

The panel's job is to **withhold "great" until it is earned.**

## Phase 7 — Repair

Take the single highest-leverage craft gap and fix it. Re-render, re-judge. **Most rounds are
spent here, on look and feel** — not on clearing gates. No fixed round count. Exit only when
Craft says genuinely great, or the user stops the run.

## Phase 8 — Promote

Anything that earns a genuine "great" becomes a reusable, versioned building block — a
candidate first, approved after a clean repeat pass and a human spot-check
(`critic-escalation.md`, `freeze-and-versioning.md`).

## What breaks this

- A weak or vague reference — the critic can't demand beauty it was never shown.
- Letting the defect gate become the goal. Correct + accessible + on-token + **ugly** is a
  failure here, not a pass.
- A soft Craft critic that passes "fine." Merely-acceptable is a fail.
- Judging beauty from the code instead of the rendered result.
- Shipping the generic-AI-design defaults (`craft-standards.md`). The safe, templated look is
  the exact failure mode this skill exists to prevent.
- Over-indexing on tokens / a11y / tests while the thing still looks vibe-coded.

## Start narrow

One screen or component, taken all the way to genuinely beautiful, before expanding.
