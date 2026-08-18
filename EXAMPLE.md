# Example run — a pricing section

A condensed real run, so you can see what the loop actually *does*. Your run will
differ; the shape is the point: **freeze → teardown → build → gate → critics →
one-gap repair → pass.**

## 1. Interview
- **Building:** a 3-tier SaaS pricing section (~1 screen).
- **Reference:** `https://linear.app/pricing` — a *specific* page, not "good SaaS design."
- **Files:** `src/marketing/Pricing.tsx`, `tokens.css`.

## 2. Freeze
`loop-manifest.json` pins the bar: the reference is captured to
`refs/linear-pricing.png` (hash locked), viewport `1440×1000`, house-system `v1.0`.
The bar cannot move mid-run — no grading itself into a pass.

## 3. Teardown → `visual-bar.md` (mechanisms, not adjectives)
- Three type sizes on the screen, no more.
- One accent, used at most twice per screen.
- Cards separated by a single 1px border — no drop shadows.
- Everything on an 8px spacing grid.
- Exactly one filled button per card; the rest are text/ghost.

## 4–5. Build
Three tier cards, built from house tokens + a retrieved card pattern (adapted, not
pasted). A Playwright task test is written alongside: *select a plan → it becomes
the highlighted choice → the CTA is reachable by keyboard.*

## 6. Mechanical gate — before any model looks
```
✓ task-runner: select-plan flow completes, focus lands on the CTA, no console errors
✓ tokens: colours/spacing are token-only, no raw hex
✓ a11y: text contrast ≥ 4.5:1, heading order valid
✓ visual-regression: baselines captured for 3 canonical states
→ PASS — artifacts forwarded to the panel
```
A beautiful screen that blocks the user fails *here*, before a model is spent on it.

## 7–8. Critic panel — round 1 (evidence only, binary verdicts)
```
BRIEF   VERDICT: PASS
SYSTEM  VERDICT: FAIL
        FAILED_CRITERION: one accent, used at most twice per screen
        BIGGEST_GAP: two accent hues on screen — green CTA + teal "Popular" badge
        EVIDENCE: pricing-after.png, middle card
        REPAIR: badge uses a neutral surface with accent-coloured text, so the
                accent *fill* appears once (the CTA)
```

## 9. Repair — exactly one gap, then re-run from the gate
Badge recoloured. Gate re-passes. Round 2:
```
SYSTEM  VERDICT: PASS
CRAFT   VERDICT: FAIL
        FAILED_CRITERION: meets or exceeds the reference's price scan-line
        BIGGEST_GAP: the reference sits price and "/mo" on one baseline; ours
                     stacks them, breaking the horizontal scan across tiers
        EVIDENCE: linear-pricing.png  vs  pricing-after.png
        REPAIR: baseline-align price and period on one row
```
Round 3: Brief ✓  System ✓  Craft ✓ → **pass.**

## 10. Promote
The tier card is stored as a **candidate** in the private registry — with its
screenshot, the Playwright test, the bar + house-system versions it passed, and the
reference provenance. It becomes an *approved* building block only after it passes
again cleanly and a human spot-checks it.

---

The value isn't the pretty result — it's that a **machine-checkable bar** and
**independent critics** named two specific defects the builder was blind to, and the
loop refused to exit until they were gone.
