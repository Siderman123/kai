---
name: add-agent-to-claude-skills-folder
description: Add a new agent (Claude Code subagent or product-level autonomous agent) to Evan's master Claude Skills folder. Use whenever Evan finishes building something that's better shaped as an agent than a skill — OR proactively when the work has a clear "this should be its own specialist" or "this should run on its own" shape. Sister file to `_HOW TO ADD A NEW SKILL.md`.
---

# How to add a new agent to Claude Skills

There are two kinds of "agent" in Evan's world. They're very different. Read the next section before doing anything else.

This file is written for future Claude sessions. Evan is a total beginner at code — write agent files in plain language, explain what to click, don't assume terminal fluency.

---

## ⚡ Skill vs Agent — pick the right shape FIRST

Before you build anything reusable, decide which of these three it is:

| Shape | What it is | Where it lives | Example |
|-------|-----------|----------------|---------|
| **Skill** | A recipe / playbook Claude reads and follows *during the current chat*. Plain instructions. | `~/Documents/Claude Skills/<NN - Category>/<file>.md` | "How to deploy a website to Cloudflare" |
| **Subagent** | A specialist Claude *delegates to* mid-task. Has its own system prompt, its own context, its own job. Claude spawns it via the Agent tool. | Live copy: `~/.claude/agents/<name>.md`<br>Canonical copy: `~/Documents/Claude Skills/04 - Subagents/<name>.md` | "Dragonfly Property Analyst — knows the budget + underwriting + quarterly report playbooks, used to QA any Dragonfly deliverable before send" |
| **Product-level agent** | A real running program. Has APIs, a database, sends real emails, hits real cron jobs. Operates *without Claude being in the chat*. | Product code lives in its own project folder. The **skill** for building one lives in Claude Skills. | "QuoteSnap Cold-Outreach Agent" — runs daily, finds leads, sends pitches |

**The decision tree:**

```
You finished building something reusable.
│
├─ Will Claude FOLLOW this during a normal chat with Evan?
│   └─ YES → it's a SKILL. Use _HOW TO ADD A NEW SKILL.md and stop reading this file.
│
├─ Should a specialist Claude DELEGATE to this — a sub-Claude with its own job
│  and its own context window, that Evan never talks to directly?
│   └─ YES → it's a SUBAGENT. Follow Section A below.
│
└─ Is it a real running program that operates on its own (cron, button, webhook),
   sending real emails / writing to a real DB / hitting real APIs?
   └─ YES → it's a PRODUCT-LEVEL AGENT. The agent itself is a project (its own
            folder somewhere); what goes in Claude Skills is the SKILL FOR BUILDING ONE.
            Follow Section B below.
```

**Tiebreakers:**
- If a thing could be either a skill or a subagent, **default to skill**. Subagents add complexity (separate context, separate tool list) and should be reserved for jobs that genuinely need isolation or specialization.
- If a thing could be either a subagent or a product-level agent, **the question is "does Evan want it running while he's asleep?"** If yes → product-level. If it only runs because Claude asked it to in a chat → subagent.

---

## When skills go INSIDE an agent

Important pattern: an agent often *uses* skills. Don't duplicate the skill content into the agent's system prompt — **reference it**.

- A **subagent** whose job is to build Dragonfly quarterly reports should have a system prompt that says "Read `~/Documents/Claude Skills/03 - Finance & Budget Automation/Quarterly Report Automation Skills/Build a Quarterly Investor Report from a Property PDF + Template.md` and follow it." That keeps the playbook in one place.
- A **product-level agent**'s codebase should be built using the corresponding "how to build" skill from the Skills folder — the skill is the recipe, the product is the dish.

**Rule:** Skills are the source of truth for *how to do a job*. Agents are *who does the job*. If you find yourself rewriting a skill inside an agent file, stop and link to the skill instead.

---

# Section A — Adding a Subagent

(Claude Code subagent, i.e. a `.claude/agents/<name>.md` file.)

## What a subagent looks like

A subagent is a markdown file with frontmatter and a system prompt. Example:

```markdown
---
name: dragonfly-property-analyst
description: Specialist for any Dragonfly real-estate deliverable. Use when Evan is building a budget, an underwriting model, or a quarterly investor report for a Dragonfly property. Knows the firm's format, the source-file conventions, and the Regency pro-forma template.
tools: Read, Bash, Edit, Write, Glob, Grep
---

You are the Dragonfly Property Analyst. You build and QA financial deliverables for Dragonfly Investments, a Miami real estate firm with 19 properties.

When Evan asks you to do something:
1. Identify which deliverable he's building (budget / underwriting / quarterly report).
2. Open the matching skill file in `~/Documents/Claude Skills/03 - Finance & Budget Automation/` and follow it exactly.
3. Use the property data at `~/Downloads/Automation_Sheet.xlsx` (Properties sheet) as source of truth.
4. Match the Regency Pro Forma format — never invent layouts.

Surface any data gaps to Evan before guessing.
```

**Key fields:**
- `name`: kebab-case, unique. This is how Claude refers to the agent.
- `description`: one sentence — what it does, plus when Claude should delegate to it. This is how Claude *decides* to use the agent, so be specific about triggers.
- `tools`: comma-separated list of tools the subagent can use. Common ones: `Read, Edit, Write, Bash, Glob, Grep`. Add `WebFetch`, `WebSearch` if it needs the web. Add MCP tools by name if it needs them. **Omit this field to give it all available tools** (only do that if it really needs everything).
- Body: the system prompt. Plain language. Tell it what it is, what its job is, and how to do it. Reference skill files instead of re-explaining their content.

## Steps for adding a subagent

### 1. Decide the shape

Apply the decision tree above. Confirm it's a subagent, not a skill.

### 2. Pick the name

Kebab-case. Starts with the *domain* or *role*, not a verb. Subagent names should read like job titles, not commands.

✅ Good: `dragonfly-property-analyst`, `cafecito-quote-form-reviewer`, `skill-saver`
❌ Bad: `build-budget`, `helper`, `claude-code-agent`

### 3. Write the file

Two copies, same content:

**Live copy** (this is the one Claude Code actually reads):
```
~/.claude/agents/<name>.md
```

**Canonical copy** (so it's findable in the master folder):
```
~/Documents/Claude Skills/04 - Subagents/<name>.md
```

Write the live copy first, then `cp` it to the canonical location. Or vice versa — just keep them in sync. (If they drift, the live one wins.)

### 4. Test it

In a new Claude Code session, ask Claude to do the thing the subagent is for. Claude should pick the subagent on its own based on the `description` field. If it doesn't, tighten the description (be more specific about triggers).

### 5. Update `_START HERE — Which Skill Do I Need.md`

Add a row in the **🧑‍💼 Agents catalog** section pointing at the subagent. Include:
- What the subagent is for (left column — the trigger question)
- Its name and live path (right column)

### 6. Update `README.md`

Add a row to the `04 — Subagents` table.

### 7. Tell Evan

One line: *"I also created a subagent at `~/.claude/agents/<name>.md` so you can delegate this kind of task next time — Claude will pick it up automatically."*

---

# Section B — Adding a Product-Level Agent

Product-level agents are **real projects**, not files in this folder. What goes here is the **skill for building one**.

## What a product-level agent looks like

Example from Evan's world: QuoteSnap's autonomous cold-outreach agent. It's a Next.js + Node app at `~/Documents/QuoteSnap/quotesnap/`. It runs daily, finds leads, builds branded demos, sends emails, hands off replies.

The agent itself is a product. The **skill** in this folder is the recipe for building one:
`01 - Build Web Apps/QuoteSnap — Instant-Quote Tool + Outreach Agent/Run an Autonomous Cold-Outreach Agent (Reskin → PDF → Find Email → Send → Handoff).md`

## Steps for adding a product-level agent

### 1. Decide the shape

Apply the decision tree above. Confirm it's a product-level agent (it runs when Evan isn't in a chat).

### 2. Build the product in its own folder

Somewhere outside Claude Skills — typically `~/Documents/<ProductName>/`. This is regular project code, not a skill file.

### 3. Write the SKILL FILE for building one

This is the reusable recipe. Follow `_HOW TO ADD A NEW SKILL.md`. The filename starts with `Run` or `Build` and describes the kind of agent, not the specific instance:

✅ `Run an Autonomous Cold-Outreach Agent (Reskin → PDF → Find Email → Send → Handoff).md`
❌ `QuoteSnap.md` (that's the product name, not the recipe)

The skill file should cover:
- The pattern (what kind of agent this is — find→build→send→handoff, or scrape→summarize→post, etc.)
- The hard gates (where humans MUST sign off — sending emails, spending money, posting publicly)
- The guardrails (rate limits, daily caps, allowlists, kill switches)
- The setup (API keys, accounts, app passwords, cron schedule)
- The first deploy (how to take it live, where it runs)
- Reply / failure handling (what to do when something the agent did needs a human)

### 4. Drop the skill file in the right category

Almost always `01 - Build Web Apps/` (because autonomous agents are usually web-app-shaped). Use a family folder if there are multiple variants (like QuoteSnap's index).

### 5. Update `README.md` and `_START HERE — Which Skill Do I Need.md`

Same as a normal skill. Don't list the product-level agent itself anywhere — the *skill* is what's listed.

### 6. (Optional but encouraged) Make a matching subagent

If the product-level agent has an oversight role — checking outputs, approving sends, debugging failures — that oversight is often a great fit for a subagent. Build the subagent following Section A, and have it reference the skill file from Section B.

---

## Quick reference: which file to write

| Situation | Write this |
|-----------|-----------|
| Reusable playbook Claude follows in chat | A **skill** (`.md` in a category folder). Use `_HOW TO ADD A NEW SKILL.md`. |
| Specialist Claude delegates to mid-task | A **subagent** (two files: `~/.claude/agents/<name>.md` and `04 - Subagents/<name>.md`). Use Section A. |
| Real running program (cron / webhook / daily job) | A **product** (in its own folder) + a **skill for building one** (in `01 - Build Web Apps/`). Use Section B. |

---

## After you're done

Tell Evan:
1. What kind of thing you made (skill / subagent / product + recipe).
2. Where it lives (clickable path).
3. What's now in the README and `_START HERE`.
4. For subagents: confirm Claude can pick it up on its own next session.
