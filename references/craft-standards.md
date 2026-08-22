# craft-standards.md — what makes UI genuinely beautiful (the taste)

The bar is not "clean" or "modern." It is **genuinely beautiful, distinctive, and
considered — at or above Claude-design quality.** This file is what the Craft critic holds
a build to, and what the design plan is written from. If the result could have come from any
agent asked to "make a nice UI," it has failed. Beauty here means a clear point of view,
executed with precision, in a treatment the subject actually calls for.

## The one question the Craft critic answers

> Would a senior product designer be *impressed*, or just *not offended*? Does this have a
> point of view, or is it the safe default? Put next to the reference with labels stripped,
> is ours clearly as good or better?

"Fine," "clean," "acceptable," and "modern-looking" are **fails.** Only genuinely beautiful
passes.

## Where distinctiveness comes from — the subject's own world

Generic UI is what you get by averaging every "nice landing page." Distinctive UI comes from the
**subject's own world** — its materials, instruments, vernacular, and artifacts. Before choosing a
palette or a face, mine the subject: a payments API, a climbing gym, a 1970s university handout,
and a trading desk each carry their own visual logic. Pull the aesthetic from there, not a style menu.

- **The hero is a thesis.** Open with the most characteristic thing in the subject's world —
  headline, image, live demo, an interactive moment — not the template answer (a big number with a
  small label and a gradient accent). The opening should *say* what the thing is.
- **The signature.** Name the single element the page will be remembered by, the one that embodies
  the brief. Spend boldness there; keep everything else quiet (the sharper form of "one bold move" below).
- **Structure is information.** Numbering, eyebrows, dividers, and labels must encode something
  *true* about the content, not decorate. `01 / 02 / 03` is right only when the content is a real
  sequence; question the device before reaching for it.

## Type — carries the whole thing

- **Pair deliberately.** A display face with real character, a comfortable body face, and a
  mono/utility face for data — chosen for the subject, not Inter-for-everything. Load faces
  properly; never risk a silent fallback.
- **A real scale, few sizes.** ~3–5 sizes on a ratio, not a dozen ad-hoc pixel values. The
  display/hero can be large, but **trust modest steps elsewhere** — a section title is ~1.9× body,
  not 5×; weight, color, and space carry hierarchy too, not size alone. And **let a page end
  two-thirds down** — visible whitespace is correct, not "under-filled."
- **Details:** `text-wrap: balance` on headings, ~60–70ch measure for body, generous
  line-height on text, tight leading on display, letter-spacing on uppercase labels,
  `tabular-nums` wherever digits align.

## Color — chosen, not defaulted

- **Neutrals are a decision.** Pure `#808080`-grey reads as unconsidered. Bias the neutral
  slightly toward the accent's hue so it reads as chosen. Pure white / near-black grounds are
  fine when they suit the subject — the point is intent.
- **One accent, used sparingly.** At most twice per screen. Reserve it for the primary action
  and the single thing that should draw the eye. Semantic colors (success / warning / danger)
  are separate from the accent and do not count as it.
- **Both themes, designed.** Light and dark each get real care — not a naive invert. Keep
  contrast legible and the accent working on both grounds.

## Space & layout — where "expensive" comes from

- **A spacing rhythm** (a scale, ~4/8px based), applied through layout `gap`, not per-element
  margins that collide or double.
- **Whitespace with intent.** Generous, but structural — it groups and separates, it isn't
  just emptiness. Align to a grid. Optical alignment beats mathematical when they disagree.
- **One focal point per view.** Everything else supports it.

## Hierarchy & depth

- Primary / secondary / tertiary must be obvious at a glance — encoded by size, weight,
  color, and space, not by labels.
- **Elevation ladder:** canvas < panel < raised control, expressed with restraint (a 1px
  border often beats a shadow; shadows are soft and few). No drop-shadow soup.

## The one bold move

Spend boldness in ONE place — a striking hero, a distinctive type treatment, a confident
color, an orchestrated motion moment — and keep everything around it quiet. Timid-everywhere
reads as generic; bold-everywhere reads as noise. Pick the moment and commit.

## Motion (when interactive) — see motion-bar.md

Purposeful, one dominant movement per transition, natural easing, honors reduced-motion.
Motion should clarify and delight, never decorate or delay. A still can't be judged for this;
record the interaction.

## Detail & polish — the 1px things that separate great from fine

Consistent radii and icon stroke widths; visible, well-styled focus rings; considered hover
and pressed states; border colors that are actually chosen; no doubled borders; aligned
optical edges; consistent iconography; no orphaned or clipped text; empty/loading/error states
that look designed, not forgotten.

## Copy is design material

Real content, never lorem. Active voice. Name things the way the user recognizes them. A
control says exactly what it does. Errors explain what happened and how to fix it.

## When it's a tool/dashboard, not a document

Scanned and operated, not read top to bottom. Surface the summary before the detail. Encode
state in *form* as well as text — a pill, a chip, a severity stripe — so what needs attention
reads at a glance. What's interactive must look interactive.

## The generic-AI-design tells — FAIL on sight

The vibe-coded look clusters here. If the plan or the build reaches for these without a real
reason, it's the safe default, and the safe default is the thing this skill exists to beat:

- Warm cream `#F4F1EA` + a serif display + terracotta accent.
- Near-black canvas with a lone acid-green or vermilion pop.
- Inter / Roboto / Arial / Space Grotesk / Fraunces as the "safe" default face — an overused face
  reads as AI-default regardless of its quality; pick something the subject actually calls for.
- Emoji as section markers or bullets.
- Everything centered; no real layout tension.
- `rounded-lg` on everything; one uniform radius everywhere.
- A purple-to-blue gradient hero on white.
- Generic card with a colored accent bar on the left.
- Decorative gradient blobs, blurry circles, or hand-drawn SVG shapes used as filler.
- A grid of identical cards standing in for real information hierarchy.
- Unconsidered pure-grey neutrals; shadows on every element.
- No point of view — decoration standing in for design decisions.

Avoiding these is necessary, not sufficient. The goal is a *distinctive, subject-appropriate*
treatment, executed cleanly — the kind of thing someone screenshots because it looks great.

## Calibrate the treatment

Match ambition to the job. A dense operational dashboard wants precision, restraint, and
information design. A landing page or marketing surface wants an editorial point of view and a
memorable hero. Over-designing a utilitarian screen is as much a failure as under-designing a
showcase one. Elegance is executing the *right* vision well.
