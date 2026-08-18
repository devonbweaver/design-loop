# interaction-loop.md — capturing interactions as deterministic evidence

The Motion critic must see EVIDENCE, not source code or builder explanations.
Turn each important interaction into a recorded, deterministic test artifact.

## Interaction contract (one per signature interaction)

Define each animation before it's judged, so nobody "watches a random video and
guesses if it's good":

```
interaction-id: agent-run.open-details
precondition: agents screen, one running row visible
trigger: click the row's "Inspect" control
expected: right sheet enters from the right, 8–24px translate + fade,
          220–300ms, ease-enter; row stays selected (identity preserved)
evidence: video + filmstrip + before/after + reduced-motion
```

Rule: the builder creates/updates the Playwright test for a contract BEFORE the
critics run.

## Scenario matrix (capture these, not one-off screenshots)

```ts
const scenarios = [
  "hover-primary-action", "keyboard-focus-navigation", "press-primary-action",
  "open-command-menu", "open-detail-sheet", "dismiss-detail-sheet",
  "run-status-queued-to-running", "run-status-running-to-success",
  "error-recovery", "empty-to-populated", "scroll-sticky-header",
  "drag-reorder-step",
];
```

Per scenario capture: viewports 1440×1000 (default), 1024×900, 390×844 (if mobile
supported); **normal AND reduced motion**; Chromium default (+ WebKit if
Apple-quality rendering matters); fixed test data, mock time, stable fonts,
non-deterministic APIs disabled; video + trace + before/after + timestamped filmstrip.

## Capture tools

- **Playwright video** — `video: "on"` for interaction specs; close the context
  after each scenario so the file finalizes; attach to the critic packet.
- **Playwright Trace Viewer** — default temporal evidence: the trace carries a
  screencast filmstrip + per-action screenshots + DOM/action timeline. Extract
  8–12 timestamped frames around the event.
- **Playwright MCP** — headless nav, screenshots, tracing, and session video via MCP tools.

Deterministic drag/scroll (don't rely on timing-sensitive generic recording):

```ts
await page.getByTestId("agent-step-2").dragTo(page.getByTestId("agent-step-1"));
await page.locator("[data-scroll-container]").evaluate(el =>
  el.scrollTo({ top: 640, behavior: "instant" }));
// second test: realistic incremental scroll if scroll-linked motion is judged
```

Frame-sampling beats raw video for vision judging: supply **start, early,
midpoint, settle, end** frames at fixed timestamps + a machine-readable manifest
with expected duration, easing, and travel distance.

## The artifact packet (what the Motion critic receives)

```
interaction-id: agent-run.open-details
viewport: 1440x1000
browser: Chromium
reduced-motion: no-preference

before.png
interaction.webm
filmstrip/  000ms.png 050ms.png 120ms.png 200ms.png 280ms.png 350ms.png
after.png
trace.zip
motion-manifest.json          # expected duration / easing / travel
reduced-motion.webm
reduced-motion-after.png
```

Optionally include the equivalent artifact captured from the motion reference,
via the SAME protocol, so the critic compares like-for-like.

## Task-success as a 4th evidence channel

A beautiful interaction that BLOCKS the user must fail. Where relevant, run the
interaction as a task and record whether it completed — task-success sits beside
static craft, system adherence, and motion craft.
