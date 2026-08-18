# Design Loop

A **testable design-production loop** for AI coding agents. It turns "make it look
good" into a build → verify → fix loop with a pass/fail exit, so design quality is
*checked*, not vibed.

Built as a [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skill, but
the method is agent-agnostic — see [Using it with other agents](#using-it-with-other-agents).

The loop freezes a versioned **bar** from a real reference, protects an immutable
**house system**, optionally shops curated component inventory for proven raw
material, builds a piece, runs **deterministic gates** (task-success + tokens +
a11y + visual-regression) **before any model judges it**, then runs **fresh-context
critics** on screenshots *and* recorded interactions — repeating until every
required gate and critic passes against the frozen bar.

Two rules run through everything:

1. **Deterministic gates run before model judges.** Don't spend the strongest model
   judging a failure a linter or test can prove. A mechanical failure is a hard fail.
2. **Critics judge evidence only** — rendered screenshots and recorded interactions,
   never code, prompts, model identity, or prior verdicts. Verdicts are binary.

## Why

Most "AI design" workflows generate confidently and evaluate poorly — the same
model that built the thing also grades it, from the code, on a bar it invented.
This loop separates the roles: an immutable bar it can't move, deterministic gates
it can't argue with, and independent critics with fresh context that see only the
rendered result. Anything that passes becomes a **candidate** asset; it's promoted
to a reusable building block only after clean repeat runs and a human spot-check.

## See it run

**[EXAMPLE.md](EXAMPLE.md)** walks a full condensed run — a pricing section looped
against Linear — from frozen bar through two critic-caught defects to a pass. Read
that first if you want to know what using this actually feels like.

## Install (Claude Code)

**Clone straight into your skills directory:**

```bash
git clone https://github.com/devonbweaver/design-loop ~/.claude/skills/design-loop
```

**Or clone anywhere and symlink** (keeps `git pull` easy):

```bash
git clone https://github.com/devonbweaver/design-loop
./design-loop/install.sh
```

Restart Claude Code, then:

```
/design-loop
```

or just ask: *"run the design loop against `<a reference URL>`"*.

## Using it with other agents

The loop is a **methodology**, not Claude-Code plumbing. `SKILL.md` is the playbook;
only the packaging differs:

- **Claude Code** — clone into `~/.claude/skills/`, invoke `/design-loop`. Its
  subagents give each critic genuinely fresh context and let you route the critics
  to different models (Brief → a mid model, System → a small one, Craft → the strongest).
- **Cursor / Windsurf / Cline / Continue** — drop `SKILL.md` into your rules or
  system prompt (e.g. `.cursorrules`, a project rule file). Run each critic as a
  **separate fresh chat**, given only the screenshot + the frozen bar. The fresh
  context is the point, however you get it.
- **Aider / Codex / plain API** — paste `SKILL.md` as the system prompt and script
  the fan-out: one call per critic, each with a clean context.

The only hard requirements are agent-agnostic:

- a way to **render** the output (a screenshot; for motion, a frame filmstrip + a
  `prefers-reduced-motion` run) — no render means a blind critic, and
- a way to give each critic a **fresh context** (a subagent, or just a new chat).

The deterministic gate ([Playwright](https://playwright.dev) + a linter) needs no
agent at all.

## What helps it run at full strength

- A **specific** reference — one page/screen that does the thing brilliantly. A
  vague bar ("good SaaS design") is the #1 reason the method fails.
- The ability to render your output and, for interaction work, to record it.
- Optional: Playwright for the deterministic task-success gate and interaction capture.

## What's inside

```
SKILL.md                         # the loop: 11 phases, two governing rules
EXAMPLE.md                       # a full condensed run, start to pass
references/
  freeze-and-versioning.md       # freeze the bar; immutable house vs derived bar; provenance
  mechanical-gate.md             # deterministic task-runner + token/a11y/regression gate
  critic-escalation.md           # match verdict cost to change risk (tiers 0–4) + cost controls
  motion-bar.md                  # motion token baseline + binary motion rules
  interaction-loop.md            # recorded-interaction evidence + scenario matrix
  build-from-inventory.md        # shop proven component patterns, then gauntlet them
  judge-reliability.md           # the Motion critic + keeping the panel honest
```

## License

MIT — see [LICENSE](LICENSE).
