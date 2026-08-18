# mechanical-gate.md — deterministic gates BEFORE any model judge

Don't spend the strongest model judging failures a linter or test can prove. Run
this gate immediately after Build. **A mechanical failure is always a hard fail**
— only passing artifacts reach the visual/motion critics. On failure, return the
concrete failing step + trace to the builder and re-run from here.

## 1. Task runner (deterministic task-success)

Not a taste judge — a deterministic agent/Playwright flow that must complete the
target flow using **user-facing (role/name) locators** (which also auto-wait +
retry, so they double as an accessibility check). Example contract:

```
Task: Create an agent run and open its details.
Given: user on /agents; a seeded agent is available.
Must:
  1. Locate "Create run" by accessible role + name.
  2. Complete required fields.
  3. Submit successfully.
  4. Confirm success feedback is visible.
  5. Locate the created run.
  6. Open its details.
  7. Dismiss the details panel by keyboard.
  8. Verify focus returns to the invoking element.
Pass:
  - All actions complete without timeouts.
  - No console errors. No blocked controls.
  - Success + focus outcomes correct.
```

A beautiful screen that blocks the user fails HERE, before Craft/Motion see it.

## 2. Deterministic checks (mechanical, not taste)

| Check | Examples |
|---|---|
| Tokens | color/spacing are token-only; banned raw hex; radius/elevation from scale |
| Motion | animation durations within token ranges; reduced-motion behavior present |
| A11y | focus states present; heading hierarchy valid; keyboard nav works; contrast where reliably measurable |
| Regression | `toHaveScreenshot()` baselines for canonical states — **wait for stability** so you don't snapshot mid-transition |
| Runtime | no console errors, no failed network requests, no blocked controls |

**Scan a11y AFTER opening each interactive state.** Menus, dialogs, tooltips, and
sheets are absent from the initial DOM — open them first, then run the
accessibility scan on that region.

## Cost-conscious artifact policy

Keep expensive evidence off by default; turn it on only for the signature suite.

- **Default projects:** `screenshot: 'only-on-failure'`, `video`/`trace:
  'retain-on-failure'`.
- **Signature suite** (the one flagged interaction, matched by test file): `video`,
  `trace`, `screenshot: 'on'`, run twice — one `reducedMotion: 'no-preference'`
  project and one `reducedMotion: 'reduce'` project.
- **Flaky blocks promotion.** A test that only passes on retry is flaky.
  Playwright flags it; a flaky interaction does **not** qualify for registry
  promotion (see `critic-escalation.md`).

Use semantic, user-facing locators (`getByRole`/`getByLabel`/`getByText`), never
CSS selectors — they auto-wait/retry and double as an accessibility assertion.

## Split of the old "System critic"

The System critic is now two parts:
- **Deterministic half (here, Phase 6):** everything measurable — tokens, a11y,
  focus, contrast, regression baselines. Hard fail.
- **Model half (Phase 8 panel):** hierarchy, density, cognitive load, emphasis,
  whether system use feels coherent — the parts a check can't measure.

Reserve the strongest model for judgment a machine genuinely can't make.
