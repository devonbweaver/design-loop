# freeze-and-versioning.md — freeze the bar, prevent moving goalposts

The loop is only trustworthy if the target can't move mid-run. Capture the
reference locally and evaluate from those captures, never a live URL.

## loop-manifest.json (root of every run; its hash goes in every critic packet + registry asset)

```json
{
  "bar_version": "1.0.0",
  "reference_capture_hash": "sha256:...",
  "reference_captured_at": "2026-08-16T...",
  "evaluation_viewport": "1440x1000",
  "browser_engine": "chromium-...",
  "font_manifest_hash": "sha256:...",
  "house_system_version": "0.4.2",
  "motion_system_version": "0.2.0"
}
```

## Freeze protocol

- The bar cannot change after the first build begins.
- Reference assets are stored locally; critics evaluate the captured artifacts.
- Capture the reference **once per bar version** and reuse it every iteration —
  never re-fetch/re-process it per round (a cost control; see `critic-escalation.md`).
- Any bar change **invalidates earlier passes** and begins a new loop version.
- The builder may not choose or alter its own grading bar.
- Approved registry components record exactly which bar + system versions they
  passed (so a later bar change doesn't silently "un-approve" them).

## Immutable vs derived (the anti-drift split)

- `references/house-system.md` — **immutable** product rules, tokens, a11y
  baseline. The static reference may INFLUENCE the visual bar; it may NOT
  overwrite the house system. A gorgeous Stripe-like reference does not get to
  replace your typography, spacing scale, or accessibility policy.
- `visual-bar.md` / `motion-bar.md` — DERIVED per run from the selected
  reference + house constraints.

## reference-provenance.md (licensing rule)

Public inspiration is fine; importing code or distinctive assets requires a
compatible license. For every reference/inventory source record: source URL,
capture date, allowed use/license, and **whether you took visual inspiration
only or actual code**. Store it so a promoted registry asset carries clean provenance.
