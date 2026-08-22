# visual-defect-gate.md — the floor (visual brokenness only), not the goal

A quick hard-fail pass on things that make a UI *visually broken*, before the Craft critic
spends effort on beauty. This is a FLOOR you clear on the way to the real work. **Do not let
it become the work** — a screen that passes every check here and still looks generic has NOT
succeeded. Correct + accessible + ugly is a failure in this loop.

## What fails here (visual defects only)

| Defect | How to catch it |
|---|---|
| Horizontal overflow | page/body scrolls sideways at any target width |
| Broken responsive | layout collapses, overlaps, or truncates at a target breakpoint |
| Clipping / collision | text cut off, elements overlapping, content escaping its container |
| Unreadable contrast | body/UI text below legible contrast on its actual background |
| Missing focus states | keyboard focus is invisible on interactive elements |
| Jank / layout shift | content jumps as it loads (reserve space: image dims, skeletons) |
| Broken assets | missing images, fallback fonts silently swapped in |

Check by screenshotting at the real viewport(s) and scanning; use Playwright where a defect
is measurable (overflow, contrast, focus-visible). Open each interactive state (hover, menu,
sheet) and check it too.

## Micro-craft checklist (deterministic; the details a subjective critic misses)

Cheap pass/fail items adapted from `vercel-labs/web-interface-guidelines` (`AGENTS.md`, MIT) — the
"not quite right" a taste critic can't articulate but everyone feels:

- **Numerics:** `font-variant-numeric: tabular-nums` wherever digits align in a column or update in place.
- **Typography detail:** curly quotes `“ ”` `’` (not `"` `'`), ellipsis `…` not `...`,
  `text-wrap: balance` on headings to kill widows, `translate="no"` on brand names.
- **Contrast:** prefer **APCA** over WCAG-2 for text legibility (WCAG-2 mispredicts on dark UI).
- **Elevation:** shadows are **layered** (a soft ambient + a tighter direct shadow), not one flat
  blur; watch for dark-gradient banding.
- **Radii:** nested corners are **concentric** — a child radius ≤ its parent's, never a larger radius
  inside a smaller one.
- **Hue consistency:** borders, shadows, and muted text are tinted toward the background's hue, not
  neutral grey dropped on top.
- **Layout robustness:** `min-w-0` on flex children that hold text (so they ellipsis instead of
  overflowing); optical alignment to ±1px where mathematical alignment looks off.

A build that misses these never reads as *crafted*, however good the composition — but they're still
a floor, not the goal.

## Explicitly NOT this skill's job

Functional QA belongs to a different tool: does a user flow complete, console errors, network
failures, unit/integration tests, the backend, data correctness. `design-loop` assumes the
thing works. If it's visually broken, fix it and move on to making it beautiful.
