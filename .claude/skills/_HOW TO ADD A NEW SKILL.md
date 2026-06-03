---
name: add-skill-to-claude-skills-folder
description: Add a new reusable skill (playbook, script, or recipe) to Evan's master Claude Skills folder at ~/Documents/Claude Skills/. Use whenever Evan finishes building something with a reusable pattern — either when he asks ("save this as a skill", "add to my skills folder") OR proactively when you notice the work has a reusable pattern worth keeping, even if he didn't ask. The skill file goes in a category folder and a row gets added to README.md.
---

# How to add a new skill to Claude Skills

The goal: take something Evan just built (with AI help) and capture the **reusable pattern** behind it as a skill file, so it can be re-applied to a new client/property/situation without starting from scratch.

This skill is written for use by future Claude sessions. Evan is a total beginner at code — write skills in plain language, explain what to click, don't assume terminal fluency.

---

## 🚦 Before you start — is this actually a skill?

Three shapes of reusable thing exist in this folder. Make sure this is the right one:

- **Skill** (this file) — a playbook Claude reads and follows during a chat. Default. Use this file.
- **Subagent** — a specialist Claude *delegates to* (its own context, its own job). Lives in `~/.claude/agents/`. → use `_HOW TO ADD A NEW AGENT.md` (Section A).
- **Product-level agent** — a real running program (cron, webhook, daily job). The *recipe for building one* is a skill (so it ends up here), but the agent itself is a project. → use `_HOW TO ADD A NEW AGENT.md` (Section B) for the framing, then come back here to write the skill file.

If unsure, default to skill. If a thing could be either a skill or a subagent, write the skill first — you can promote it to a subagent later.

---

## ⚡ Proactive skill creation (important)

**Evan wants you to act on your own here.** If you finish helping him build something and you notice the work contains a reusable pattern that would save him time next month — *don't wait for him to ask*. Make the skill and add it to the folder.

**When to trigger proactively:**
- You just built a script, playbook, or workflow that has a clear "do this again for the next X" shape (next client, next property, next deal, next deployment, etc.)
- You spent real time figuring out a non-obvious setup (API keys, config gotchas, weird Excel formats) that Evan would re-hit later
- You wrote step-by-step instructions for clicking through a tool (Cloudflare, Apollo, Hunter, Vercel, etc.) — those instructions are exactly the kind of thing that should be a skill
- The work matches a pattern that's already in the folder (e.g. another quote form → add to the Cafecito Block family)

**How to do it proactively (don't make a production of it):**
1. Make the skill file and update the README *as part of finishing the task*.
2. At the end of your response, tell Evan in one line: *"I also saved this as a skill at `<path>` so you can reuse the pattern next time."*
3. If you're unsure whether something is skill-worthy, default to making it — it's cheap to add and easy to delete later. Better to over-capture than miss something.

**When NOT to trigger proactively:**
- The work is genuinely one-off (a specific data analysis, a specific email, a specific decision)
- You'd just be duplicating the project's own README
- The "pattern" is generic enough that any Claude session would figure it out from scratch faster than reading a skill

---

## What counts as a skill (and what doesn't)

A **skill** is the *recipe*, not the project.

- ✅ A reusable playbook for spinning up a quote form for a new local business
- ✅ A Python script that builds a budget from a property's financials (any property)
- ✅ A step-by-step for deploying a frontend to Cloudflare
- ❌ The actual code for ONE specific client's site (that's a project, lives in its own folder)
- ❌ A one-off analysis (the result, not the recipe)
- ❌ A summary of what we just did (belongs in a project README, not here)

**The test:** "If Evan wanted to do this same *kind* of thing for a different client/property next month, would this file save him time?" If yes → skill. If no → not a skill.

---

## The folder structure

```
~/Documents/Claude Skills/
├── README.md                              ← master index (always update this)
├── _HOW TO ADD A NEW SKILL.md             ← this file
├── 01 - Build Web Apps/
│   └── <skill family folder>/
│       ├── _Index — How to Use.md         (if the family has multiple files)
│       └── <skill files>
├── 02 - Deploy/
├── 03 - Finance & Budget Automation/
└── 04+ - <new categories as needed>/
```

**Categories so far:**
- `01 - Build Web Apps` — patterns for spinning up customer-facing tools
- `02 - Deploy` — how to ship things live
- `03 - Finance & Budget Automation` — Python scripts for budgets, P&Ls, rollups

If the new skill doesn't fit any of these, create a new top-level folder with the next number (`04 - <Category>/`). Don't force-fit it into an existing category just to avoid making a new one.

---

## The steps

### 1. Pick the category folder

Look at the skill's *purpose*, not its *tech*. A Python script that deploys something goes in `02 - Deploy`, not under "scripts." If two existing categories both kind of fit, pick the one that matches the *outcome* the user gets from running the skill.

If nothing fits, make a new `04 - <Category>/` folder. Keep category names broad enough that 3+ future skills could plausibly live there.

### 2. Decide: single file or family folder?

- **Single file** if the skill is standalone (like `deploy-to-cloudflare.md`).
- **Family folder** if there are multiple related skill variants (like the Cafecito Blocks). Family folders should have an `_Index — How to Use.md` at the top explaining how the variants relate.

### 3. Name the file (this matters)

**The filename must start with a verb that says what the skill produces.** Evan should be able to read the filename and immediately think "this does this, let me use it" — without opening the file.

The pattern: `<Verb> <the thing it produces> (<scope or context if needed>).<ext>`

✅ Good filenames:
- `Build an Instant Quote Form for a Consumer Business (Car Wash, Med Spa, Cleaning).md`
- `Deploy a Website to Cloudflare.md`
- `Turn a Python Script into a Paid SaaS App (Logins + Stripe + Hosting).md`
- `Underwrite a Property — Build a 5-Year Pro Forma with IRR + Sensitivity.py`
- `Keep a Web App Working When the Backend or Wifi Fails.md`

❌ Bad filenames:
- `quote-form.md` — kebab-case is for the `name:` field inside, not the filename
- `Block 16.md` — internal codes mean nothing to a future reader
- `cloudflare-stuff.md` — vague, no verb, no outcome
- `underwriting_v2.py` — no verb, no scope
- `helper.py` — no idea what this does

**Rules:**
- Start with a verb in Title Case: `Build`, `Deploy`, `Underwrite`, `Wrap`, `Turn`, `Keep`, `Roll Up`, `Generate`, etc.
- Then name **the thing it produces** (a quote form, a budget, a pro forma, a deploy)
- If needed, add scope in parens: who it's for, what tech, what context
- Spaces and em-dashes (`—`) are fine and preferred — these aren't code, they're documents
- If files in a family run in sequence, prefix with `01 — `, `02 — ` so they sort right
- For internal index files in a family folder, prefix with `_` so they sort to the top: `_Index — Which X to Use.md`

**Keep the `name:` field in frontmatter kebab-case** (e.g. `name: deploy-website-to-cloudflare`) — that's a different field with different rules.

### 4. Write the skill file

Use this format (matches `deploy-to-cloudflare.md`):

```markdown
---
name: <short-kebab-case-name>
description: <one sentence: what the skill does + when to trigger it. Be specific — this is how future Claude decides whether to use it.>
---

# <Skill title in plain language>

The goal: <one sentence on the outcome the user gets>

This skill is written for a beginner coder — assume Evan runs the clicks, you write the configs and explain what to click.

---

## <Section 1 — usually "What you're working with" or "Before you start">
...

## <Section 2 — the actual steps>
...

## <Section 3 — common traps, things to double-check>
...
```

**Writing rules:**
- Plain language. Define jargon the first time it appears.
- Tell Evan what to *click*, not just what to *do*.
- Include the exact commands he'll need to copy-paste, in code blocks.
- Note any traps or things that went wrong the first time we built this.
- If the skill needs Evan to have an account/key somewhere (Cloudflare, Apollo, Hunter, OpenAI), say so up front.

### 5. Drop the file in the right place

```
~/Documents/Claude Skills/<NN - Category>/<skill-file>.md
```

Or for Python/code skills, the same path with `.py`.

### 6. Update README.md

Open `~/Documents/Claude Skills/README.md` and:

- Add a row to the right category's table.
- If you created a new category, add a new `## NN — <Category>` section above the "Where the originals live" section.
- Match the existing tone (terse, one-line descriptions in the table).

### 7. Update `_START HERE — Which Skill Do I Need.md`

**Don't skip this.** This is the file Claude (and Evan) reads to pick which skill to use. If a new skill isn't in the decision tree there, it's invisible to the workflow even if it's in the README.

- Open `~/Documents/Claude Skills/_START HERE — Which Skill Do I Need.md`
- Add a row under the right section (`Building for a CLIENT?`, `Building a NEW STANDALONE PRODUCT?`, `DEPLOYING something?`, `Working on DRAGONFLY?`, etc.)
- The left column is the **trigger question** ("If you need to…") and the right column is the **path to the skill file**.
- If the new skill doesn't fit any existing section, add a new `## 🆕 <emoji + section name>` block.

### 8. If the skill is a duplicate of something Evan already has elsewhere

The Claude Skills folder is a **canonical home** — duplicates of skills from elsewhere are fine. But:

- Note the original location in a comment at the bottom of the skill file, like:
  ```
  > Originally lives at: ~/Documents/<old-folder>/<file>
  ```
- Don't move or delete the original — Evan's other tools/scripts may reference it by path.

---

## Quick decision tree

```
User says "save this as a skill" / "add to my skills folder"
│
├─ Is it actually a reusable pattern? (apply the test above)
│   ├─ NO  → push back gently: "this looks like a one-off — what's the reusable part?"
│   └─ YES → continue
│
├─ Does it fit an existing category?
│   ├─ YES → use that folder
│   └─ NO  → create "04+ - <New Category>/"
│
├─ Single file or family?
│   ├─ Single → drop the .md / .py directly in the category folder
│   └─ Family → make a subfolder, add _Index — How to Use.md
│
├─ Write the skill file (frontmatter + plain-language body)
│
├─ Update README.md (add row to the right table)
│
└─ Update _START HERE — Which Skill Do I Need.md (add a decision-tree row)
```

---

## After you're done

Tell Evan:
1. Where the new skill lives (clickable path)
2. What's now in the README
3. (Optional) Whether you also want to delete/clean up the original location — but only ask, never do it without confirming
