# reference-and-brief.md — set a bar the critic can actually enforce

The #1 reason this loop ships ugly — and a harsh critic still rubber-stamps it — is a **vague
reference**. This file is how Phase 1–2 set a bar with a real edge. Sources: Google's official
`design.md` `PHILOSOPHY.md` (Apache-2.0), Vercel's v0 guidance, Anthropic's `frontend-design` skill.

## Adjectives describe a region; a specific reference describes a point

"Modern, clean, trustworthy, premium" evokes nothing specific — the model outputs the *center of
that region*, which is exactly the generic look. A named real-world artifact ("a 1970s graduate
lecture handout in the tradition of an old, established university") evokes a whole world and
carries more information than a dozen token values. This is the mechanism behind "vague reference →
rubber-stamp": averaging over an adjective's region **is** the generic output. **Ban adjective-only
briefs.** Force a named reference (a real product's `DESIGN.md`, or a specific artifact), the
audience, and the reading situation.

## The brief formula — write it as a file, then treat it as binding

> Build [the surface: components, data, actions]. Used by [who], in [what moment], to [what
> decision or outcome]. Constraints: [platform/device, visual tone, layout assumptions].

The **"in what moment / to what decision"** clause is the load-bearing half — it fixes density and
hierarchy (e.g. "a sales manager, at morning standup, on a desktop, to spot the one underperformer"
dictates a scannable table, not a hero). Once written, the brief is **binding**: the build follows
it, and the critic checks *build-vs-brief conformance* as a failure mode **separate from** "is it
beautiful." (v0 ships this as a `GenerateDesignInspiration` step: "If you generate a design brief,
you MUST follow it.")

## Prose is the design; tokens are only context

Rationale is load-bearing; the hex/tokens are a lookup table the prose points at. A tokens-only doc
conveys no intent, so the model fills intent from its priors (= generic). **After every token block,
say what each value is *for* and where it must never appear.** Reject a design plan that is values
without rationale.

## A long "don't" list is a DIAGNOSTIC, not a fix

When the output is wrong, the reflex is to add prohibitions. Google's inversion: **a rambling
don't-list (say, more than ~10 items) means the reference was too vague** — a specific reference
carries its own negative space for free ("naming the object names the constraints, the way naming a
dog tells the model that dogs don't meow"). If your don'ts are piling up, **go back and make the
reference more specific** instead of writing rule #11.

## Route on reference strength (this reconciles the two schools)

There are two opposite postures in the wild, and the tiebreaker is whether a real reference exists:

- **Strong, specific reference present →** let constraints be **emergent** from it. Don't override
  a real design system with generic caps.
- **Weak or absent reference →** apply a numeric **floor** so the output can't sprawl: **3–5 colors
  total** (1 primary + 2–3 neutrals + 1–2 accents), **≤ 2 font families**, body **line-height
  1.4–1.6**, **no prominent purple/violet unless asked** (a known model prior), gradients only if
  asked and only analogous (blue→teal, never opposing temperatures like pink→green), ≤ 2–3 stops.
  This is a floor for the reference-less case, not a style to reach for.

## Accent = a placement rule, not a count

"One accent" is only enforceable as *where it may and may not go*. Give each accent an allowed-
surface list plus 2–3 named forbidden surfaces ("the accent lives only in the primary action and
one focal element — never on body type, never on numerals, never on metadata"). **Its scarcity
outside is what makes its presence inside mean something.**

## Modest ratios; under-filled is correct

Two model priors to counter, stated as permissions (they survive better than prohibitions):
- **Trust modest size steps.** A section title is ~1.9× body, not 5×. Hierarchy comes from weight,
  color, and space too — not size alone.
- **Let a page end two-thirds of the way down.** Visible whitespace is correct, not "under-filled."

## The plan self-audit — before any code

Sketch the token system: 4–6 named hex, 2+ type roles, a one-sentence layout concept (ASCII
wireframes to compare), and the **signature** — the single element the page is remembered by, which
embodies the brief. Then run the same brief through your own head: **if any choice is what you'd
produce for *any* similar page, it's the generic default — revise it and say what you changed and
why.** Only build from the revised plan, deriving every color and type decision from it.

## The conformance sweep (cheap, before the taste critic)

Before spending expensive Craft/System critic rounds, run a cheap pass so those rounds are spent on
beauty, not on catching slips: does every color / type size / component resolve to the system (no
raw `#hex`, no arbitrary `p-[13px]`, no call-site overrides)? Does the build match the binding
brief? If a real `DESIGN.md` is in play, `npx @google/design.md lint DESIGN.md` validates token
references and WCAG contrast and returns structured JSON — a real command, not a vibe.
