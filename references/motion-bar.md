# motion-bar.md — the motion token baseline + binary rules

Motion is a first-class token layer alongside color, spacing, type, elevation.
Copy this baseline into a project's `motion-bar.md` during Teardown and tune it.
Grounded in Material 3 motion (duration/easing tokens) + Apple HIG behavioral
constraints (purposeful, brief, cancellable, optional).

## Token baseline

```css
:root {
  /* Durations */
  --motion-instant: 100ms;
  --motion-fast: 150ms;
  --motion-normal: 200ms;
  --motion-emphasis: 280ms;
  --motion-slow: 360ms;

  /* Easing */
  --ease-standard: cubic-bezier(0.2, 0, 0, 1);
  --ease-enter:    cubic-bezier(0, 0, 0.2, 1);
  --ease-exit:     cubic-bezier(0.4, 0, 1, 1);

  /* Spatial travel */
  --motion-distance-xs: 4px;
  --motion-distance-sm: 8px;
  --motion-distance-md: 16px;

  /* Sequencing */
  --stagger-tight: 20ms;
  --stagger-default: 40ms;
  --stagger-max: 60ms;
}
```

## Per-interaction policy (default for an operational workspace)

| Interaction | Treatment |
|---|---|
| Hover / press / focus | 100–180ms; color, opacity, 1–2px translate, or subtle elevation only |
| Tooltip / menu / popover | 150–220ms; opacity + 4–8px directional offset |
| Dialog / command palette / sheet | 220–300ms; opacity + 8–24px directional translate |
| Persistent layout change | shared-layout / FLIP transition; preserve the object's identity |
| List reveal | 20–60ms stagger; cap total cascade so content isn't slower to use |
| Success / error | immediate state feedback; optional restrained confirmation motion |
| Drag / reorder | spring ONLY for direct manipulation + release settle |
| Reduced motion | crossfade or immediate change; retain task-critical feedback |

## Binary motion rules (what the Motion critic checks)

- Every animated state change has an observable trigger.
- Hover/press feedback completes within 180ms.
- Standard overlays complete entry within 220ms.
- Major contextual panels complete entry within 300ms.
- Exit exists for every non-instant entry.
- Exit duration is 70–85% of its entrance duration.
- No non-drag UI spring has visible overshoot.
- No scale animation begins below 0.96 for standard product UI.
- Persistent objects preserve identity across adjacent states (no teleport).
- Stagger delay is 20–60ms and never delays the primary action.
- Motion is never REQUIRED to understand success, error, selection, or navigation.
- `prefers-reduced-motion` is tested and preserves functional feedback.

## Character + ceiling (from Google `design.md` PHILOSOPHY.md)

- **Hard ceiling: nothing in the UI animates longer than ~300ms. If it needs longer, cut it.**
  Speed reads as quality; a slow "premium" transition reads as sluggish.
- **Pick one character and hold it** — e.g. "like a light switch, not a door closing." One shared
  easing family carries that character across the whole surface; mixed easings read as assembled.
- Reduced motion collapses durations to **0ms** (an instant state change), not to a slower fallback.

## Hard vetoes (auto-FAIL, from Apple HIG)

- Decorative motion that delays work.
- No visible causal link between the motion and the user's action.
- No reduced-motion alternative.
- Interaction blocked until an animation finishes.

## The 12 principles — only the interface-relevant ones

Add to the rubric vocabulary: **staging, timing, slow-in/slow-out, anticipation**
(for direct manipulation), **follow-through** (for dismissals / physical UI).
Ignore the character-animation ones — this is product UI, not a cartoon.

These are a stable DEFAULT, not universal law. A product may intentionally
override a line — but a fixed default is what makes evaluation possible.

Builder standard: animate with Motion (Framer Motion) for React; ban ad-hoc
animation values outside the motion-token file. Prefer layout/shared-element
transitions over disappear-and-reappear when an object persists.
