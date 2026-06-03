---
name: which-skill-do-i-need
description: Decision tree for picking which skill OR agent from Evan's Claude Skills folder applies to the task at hand. Claude should read this file FIRST whenever Evan opens a new project, starts a new task, or asks for help with something that might match a saved pattern. Walks through "what are you trying to do?" → points to the exact skill or agent to use.
---

# Which Skill (or Agent) Do I Need?

**For Claude:** Read this file FIRST when Evan starts a new task. The flow:
1. Check the **🧠 Skill or Agent?** section below to see if a saved *subagent* fits — if yes, delegate to it.
2. Otherwise walk the **skill decision tree** (the tables further down), open the matching skill file, and follow it.
3. If nothing matches and the work creates a reusable pattern, decide whether it's a **skill** (follow `_HOW TO ADD A NEW SKILL.md`) or an **agent** (follow `_HOW TO ADD A NEW AGENT.md`) and save it.

**For Evan:** Skim this when you want to remember what you have. The questions on the left tell you what you're trying to do; the file on the right is the skill (or agent) to open.

---

## 🧠 Skill or Agent? (Read this BEFORE walking the skill tables)

Three shapes exist in this folder. Pick the right one before doing anything.

| Shape | What it is | When to use |
|-------|-----------|-------------|
| **Skill** | A playbook Claude *reads and follows* in this chat. | Default. Most reusable patterns are skills. |
| **Subagent** | A specialist Claude *delegates to* (its own context + job). Lives in `~/.claude/agents/` and `04 - Subagents/`. | When a job needs its own context window, its own tool list, or is a repeated specialty (e.g. "QA every Dragonfly deliverable against the firm format"). |
| **Product-level agent** | A real running program (cron / webhook / button). Lives in its own project folder. The *recipe* for building one is a skill in `01 - Build Web Apps/`. | When Evan wants something that operates while he's asleep (e.g. QuoteSnap outreach). |

**Decision flow at the start of any task:**
1. **Is there a matching subagent?** Check the catalog below. If yes → delegate to it via the Agent tool.
2. **Is there a matching skill?** Walk the skill tables below. If yes → open the file and follow it.
3. **Neither matches?** Do the work normally. At the end, decide skill vs agent and save it — `_HOW TO ADD A NEW SKILL.md` or `_HOW TO ADD A NEW AGENT.md`.

---

## 🧑‍💼 Agents catalog

Saved subagents Evan has built. Claude should consider delegating to one of these BEFORE walking the skill tables — if the description fits, the subagent already knows the playbook.

| If you need to… | Use this subagent |
|-----------------|-------------------|
| *(none yet — add the first one with `_HOW TO ADD A NEW AGENT.md`)* | — |

Canonical copies of subagent definitions live in `04 - Subagents/`. The live (Claude-Code-loaded) copies live in `~/.claude/agents/`.

For product-level agents (things that run on their own — like QuoteSnap's outreach machine), use the **skill** that describes how to build them — see the "🤖 Running an OUTBOUND / SALES AGENT?" section below.

---

## 🏢 Building something for a CLIENT?

| If the client is… | Use this skill |
|-------------------|----------------|
| A **local consumer business** (car wash, med spa, salon, cleaning, etc.) that needs instant online pricing | `01 - Build Web Apps/Cafecito AI — Quote & Estimate Builders/Build an Instant Quote Form for a Consumer Business (Car Wash, Med Spa, Cleaning).md` |
| A **B2B contractor** (signs, HVAC, roofing, fabrication, etc.) that needs an instant estimate generator | `01 - Build Web Apps/Cafecito AI — Quote & Estimate Builders/Build a B2B Estimate Generator (Signs, HVAC, Roofing, Contractors).md` |
| Not sure which Cafecito skill fits? | Open the family index first: `01 - Build Web Apps/Cafecito AI — Quote & Estimate Builders/_Index — Which Cafecito Skill to Use.md` |
| Build the **QuoteSnap product** — one engine that reskins into any service business's branded instant-quote popup from just their URL (6 industries, add more with one JSON) | `01 - Build Web Apps/QuoteSnap — Instant-Quote Tool + Outreach Agent/Build a Multi-Vertical Instant-Quote Tool (Reskin Any Business by URL).md` |

---

## 🤖 Running an OUTBOUND / SALES AGENT?

| If you want to… | Use this skill |
|-----------------|----------------|
| Run a continuous cold-outreach machine — find local businesses, auto-build a branded demo + PDF each, find their real email, write the pitch, queue it; you send + handle replies | `01 - Build Web Apps/QuoteSnap — Instant-Quote Tool + Outreach Agent/Run an Autonomous Cold-Outreach Agent (Reskin → PDF → Find Email → Send → Handoff).md` |
| Build *any* "find businesses with problem X → build a tailored asset → pitch → human-close" agent | Same file — the skeleton (gates, guardrails, app-password email, reply handoff) is reusable; swap the lead source + the asset built per lead |

---

## 🚀 Building a NEW STANDALONE PRODUCT (your own SaaS)?

| If you want to… | Use this skill |
|-----------------|----------------|
| Turn a Python script you wrote into a **real paid SaaS product** with logins, subscriptions, and a dashboard | `01 - Build Web Apps/Turn a Python Script into a Paid SaaS App (Logins + Stripe + Hosting).md` |
| Make a web app **survive a broken backend or spotty wifi** (feel instant even when things break) | `01 - Build Web Apps/Keep a Web App Working When the Backend or Wifi Fails.md` |
| Ship an **AI feature** (chat reply, image analysis, generated email) where you need to **guarantee it can't say certain things** — to teens, sensitive users, or anyone where one bad output is a real problem | `01 - Build Web Apps/Make an AI App's Output Safe (System Prompt + Filter + Regen + Fallback).md` |

---

## 🌐 DEPLOYING something live?

| If you want to… | Use this skill |
|-----------------|----------------|
| Take a frontend repo and get a live `*.pages.dev` URL you can share | `02 - Deploy/Deploy a Website to Cloudflare.md` |
| Deploy a project from a GitHub repo you **don't own** (team repo, internship codebase, friend's project) — fix the "permission denied" / 403 trap | `02 - Deploy/Deploy a Project from Someone Else's Repo (Fork Workflow).md` |

---

## 🏘️ Working on DRAGONFLY (real estate)?

| If you need to… | Use this skill |
|-----------------|----------------|
| **Underwrite a new acquisition** (build a 5-year pro forma + IRR + cap-rate sensitivity matching the Regency format) | `03 - Finance & Budget Automation/Dragonfly Property Underwriting (5-Year Pro Forma)/Underwrite a Property — Build a 5-Year Pro Forma with IRR + Sensitivity.py` |
| **Build the 2026 budget** for ONE property (the polished template / reference) | `03 - Finance & Budget Automation/Dragonfly 2026 Budget Engine/01 — Build a Polished 2026 Budget for One Property (template).py` |
| **Re-run the full 19-property 2026 budget** with new source data | All four scripts in `03 - Finance & Budget Automation/Dragonfly 2026 Budget Engine/`, in order 01 → 04. See the folder's `README.txt`. |
| Build budgets for properties with **weird source files** (PDF, PowerPoint, non-standard Excel) | `03 - Finance & Budget Automation/Dragonfly 2026 Budget Engine/03 — Build 2026 Budgets from Non-Standard Sources (PDF, PPT, Weird Excel).py` |
| Roll all property budgets up into **one portfolio summary workbook** for the boss meeting | `03 - Finance & Budget Automation/Dragonfly 2026 Budget Engine/04 — Roll Up All Property Budgets into One Portfolio Workbook.py` |
| **Build a quarterly investor report** for ONE property — fill the firm's PPTX template from a source PDF, handle dynamic table resizing, balance-sheet splits, and photo replacement, then export PDF | Read first: `03 - Finance & Budget Automation/Quarterly Report Automation Skills/_Index — How to Use This Skill.md`, then the playbook in the same folder. |
| Need the **reusable PPTX template helpers** (text replace, table resize, slide duplicate, picture swap) for any deck-building task | `03 - Finance & Budget Automation/Quarterly Report Automation Skills/_Helpers — PPTX Template Mechanics (Fill, Resize, Split, Swap Pictures).py` |

---

## ❓ If nothing here matches

The task is probably brand new — just do the work normally.

**But at the end,** ask yourself (or have Claude ask): *"Did the work produce a reusable pattern? Would I want to do this same kind of thing again next month for a different client/property/situation?"*

If **yes** → decide which shape it is:
- A **playbook Claude follows in chat** → `_HOW TO ADD A NEW SKILL.md`
- A **specialist Claude delegates to** OR a **program that runs on its own** → `_HOW TO ADD A NEW AGENT.md`

If **no** → it was a one-off. Move on.

---

## How this folder works (in one picture)

```
You have a task
   ↓
Open _START HERE (this file)
   ↓
Is there a matching SUBAGENT?  → YES → delegate to it
   ↓ NO
Is there a matching SKILL?     → YES → open it → follow it
   ↓ NO
Do the work normally
   ↓
Did the work create a reusable pattern?
   ↓                              ↓
   YES                            NO
   ↓                              ↓
Is it a playbook, a specialist,    Done
or a program that runs on its own?
   ↓
SKILL    →  _HOW TO ADD A NEW SKILL.md
SUBAGENT →  _HOW TO ADD A NEW AGENT.md (Section A)
PRODUCT  →  _HOW TO ADD A NEW AGENT.md (Section B)
   ↓
README + _START HERE get updated
   ↓
Next time → faster, because it's saved
```

---

## Full catalog

For a complete menu of every skill (with one-line descriptions), see `README.md`.

---

*Last updated: 2026-06-03*
