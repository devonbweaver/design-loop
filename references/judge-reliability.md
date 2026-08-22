# judge-reliability.md — the Motion critic + keeping the panel honest

LLM-as-judge drifts unless calibrated. Multimodal models approximate human UI
preference on some dimensions and diverge on others → they supplement, not
replace, human evaluation. Specialized criteria beat one "omniscient" evaluator;
multi-agent collaborative judging outperforms a single judge.

## The Motion critic

A 4th judge whose authority is limited to **temporal craft + interaction
feedback** — this keeps the static Craft critic from becoming an unfocused
generalist. Rubric (each a binary check):

| Criterion | Check |
|---|---|
| Causality | Does the motion clearly follow from a user action / state change? |
| Spatial continuity | Does the element originate, move, and settle where users expect? |
| Timing | Do delay + duration obey the motion tokens? |
| Easing | Entry decelerates naturally; exit accelerates appropriately? |
| Choreography | One movement dominant; secondary elements support, not compete? |
| Feedback | Are hover/focus/press/loading/success/error/dismissal states understandable? |
| Continuity | Persistent objects retained, not replaced/teleported? |
| Restraint | Motion improves comprehension vs. consuming attention / adding delay? |
| Accessibility | Reduced-motion preserves meaning + interaction capability? |
| Performance | Any visible jank, layout shift, dropped motion, delayed input feedback? |

### Strict Motion-critic prompt

```
You are the Motion Critic.

You receive: the interaction contract, motion-bar.md, one normal-motion
interaction video, a timestamped filmstrip, before/after screenshots, a
reduced-motion interaction video, and (optionally) the equivalent reference artifact.

You cannot inspect implementation code, builder notes, earlier feedback, or prior
verdicts. Judge only what is observable.

Return exactly:
VERDICT: PASS | FAIL
FAILED_CRITERION: [one rubric criterion]
BIGGEST_GAP: [one concrete visual or temporal failure]
EVIDENCE: [timestamp / frame id]
REPAIR: [smallest testable implementation change]
```

Voting: **unanimous** pass from the panel (Craft, System, and Motion when
interactive) on signature work. Craft is never outvoted — a **Craft fail is a hard
fail even if the others pass.** Beauty is the point; it does not get majority-ruled away.

## Panel-reliability controls

| Control | Why | Integration |
|---|---|---|
| Blind evaluation | stops rewarding intent/complexity/builder style | hide implementation, prompts, model identity, prior repairs, "candidate/reference" labels |
| Fresh judge context | reduces self-confirmation / anchoring | each critic in a separate session with a fresh artifact packet |
| Randomized order | reduces position bias | randomize candidate/reference placement; repeat in reverse for important screens |
| Binary gates | limits score inflation | PASS/FAIL only; no numbers, no "mostly pass" |
| Single-gap repair | keeps builder focused, makes improvement measurable | one failed criterion + one smallest repair only |
| Calibration set | tests whether critics match your taste | 30–50 labeled interaction benchmark; re-run whenever prompts/models/bar rules change |
| Human spot checks | catches systematic blind spots | review 10–20% of passes + every disputed verdict + every flagship interaction |
| Inter-rater monitoring | catches a too-lenient/too-strict critic | track disagreement, pass rate, false-pass rate, agreement w/ human labels per critic |
| Adversarial critic | finds the strongest reason to reject a consensus | on unanimous passes for critical screens, one final "refutation" pass hunting the most damaging missed flaw |

Do NOT give all critics identical prompts or identical vision models — different
lenses only help if genuinely differentiated by evidence + rubric.

## Anti-rubber-stamp rules (what stops a "harsh" critic decaying into confident vibes)

The default failure of this whole genre is a critic that *sounds* harsh but rubber-stamps. These
five rules, drawn from shipped design agents (sources in `inventory.md`), are what keep it honest:

- **Look at pixels, or say you didn't.** A critic judges a real render (screenshot / video). If it
  only read code, its verdict MUST be stamped `[CODE-ONLY — visual issues not assessed]` — a
  code-only pass is never a real pass. (educlopez/ui-craft, Step 0.)
- **The builder does not grade its own work.** Verification is a separate agent with its own
  browser, and it is **silent on pass** — it speaks only to report a defect. This is independence
  *and* a context-budget decision: self-review clutters the builder and inflates its confidence.
  (Anthropic's own design agent.)
- **Cite exact values; never approximate.** When a verdict names a measured value (a gap, a
  duration, a hex, a ratio), copy it exactly from the evidence — an approximated number is how a
  critique becomes an unfalsifiable vibe. (emilkowalski/skills, AUDIT.md.)
- **Problems over prescriptions.** State the problem and its impact, not the fix ("the section
  headings all read at one volume, so nothing anchors the page" — not "set it to 50px"). The
  builder owns the repair; a critic that prescribes pixels stops seeing the actual defect.
  (OneRedOak/claude-code-workflows.)
- **Severity, always.** Every finding carries a triage label — **[Blocker] / [High-Priority] /
  [Medium] / [Nitpick]** — so a "genuinely great" verdict can't hide an unranked pile of nitpicks,
  and a Blocker can't be lost among them.

## What to absorb or beat (competitive landscape)

Current generators are strong at initial generation, reference translation, and
quick edits — NOT trustworthy independent evaluation.

| Category | Do well | What this loop beats it on |
|---|---|---|
| v0-style | fast React/Tailwind/shadcn component gen | use as the builder layer, but require pixel + interaction + a11y + reference verification before anything passes |
| Lovable-style | fast full-stack MVP assembly | add explicit workflow/state-transition testing so "working demo" ≠ usable UX |
| Figma Make-style | functional prototypes w/ hover/interaction | beat with reproducible interactions, reduced-motion artifacts, blind critics, regression suite |
| 21st.dev | curated agent-ready components | use as retrieval; differentiate with system-compat filter + provenance + critic-verified private registry |
| screenshot→UI | fast static drafts | beat by measuring task completion, states, temporal coherence, a11y, repeated visual regression — not visual similarity |
| visual browser agents | execute + evaluate live tasks | add task-success as a 4th evidence channel; a beautiful interaction that blocks the user always fails |

## Recommended full architecture

```
Reference pack: static + interaction/video (when motion in scope) + system/component
   ↓
Teardown: bar.md · design-system.md · motion-bar.md · interaction-contracts/*
   ↓
Retrieval: private registry → shadcn registries → external galleries
   ↓
Builder: adapt pattern to house system · write/update Playwright tests · normal + reduced-motion artifacts
   ↓
Critics: Craft (beauty vs reference — the star, harsh) · System (hierarchy/coherence) · Motion (interaction/filmstrip)
   ↓
One-gap repair
   ↓
Artifact + verdict + approved component → private registry (versioned, with provenance)
```
