# Claude Skills — Master Catalog

All the reusable skills (playbooks + scripts) I've built with AI, in one place.
Each filename starts with a **verb** so you can read it and instantly know what it does.

> These are **duplicates**. The originals are still in their old folders.
> If you edit a skill, edit the copy here so this folder stays the canonical home.

Last organized: 2026-06-03

---

## 📖 Three files Claude should read before doing anything

1. **[`_START HERE — Which Skill Do I Need.md`](_START%20HERE%20%E2%80%94%20Which%20Skill%20Do%20I%20Need.md)** — decision tree. Open this when starting any new task to figure out *which* skill (or agent) applies. Includes the "skill vs agent" decision at the top.
2. **[`_HOW TO ADD A NEW SKILL.md`](_HOW%20TO%20ADD%20A%20NEW%20SKILL.md)** — open this when you finish building a reusable *playbook* (something Claude follows during a chat).
3. **[`_HOW TO ADD A NEW AGENT.md`](_HOW%20TO%20ADD%20A%20NEW%20AGENT.md)** — open this when the reusable thing is a *specialist Claude delegates to* (a subagent in `~/.claude/agents/`) or *a program that runs on its own* (product-level agent).

Everything else in this folder is the actual skill or agent content. The three files above are the operating instructions.

---

## 01 — Build Web Apps

Reusable patterns for spinning up customer-facing web tools, SaaS apps, and resilient frontends.

### Cafecito AI — Quote & Estimate Builders
Two skills you can drop in for a new local-business client. Each one has: the gap to look for, what to build, tech stack, design system, pitch script, and target businesses.

| File | What it does | Used for |
|------|--------------|----------|
| `_Index — Which Cafecito Skill to Use.md` | Decide which of the two below to use for your client | — |
| `Build an Instant Quote Form for a Consumer Business (Car Wash, Med Spa, Cleaning).md` | Stand up an instant quote form for a consumer-facing local business | Aventura's Finest |
| `Build a B2B Estimate Generator (Signs, HVAC, Roofing, Contractors).md` | Stand up an instant estimate generator for B2B contractors | SignsCenter |

**Shared stack:** Cloudflare Workers + Hono.js + TypeScript

### QuoteSnap — Instant-Quote Tool + Outreach Agent
The grown-up version of the Cafecito quote builders: **one** config-driven engine that reskins to ANY service business from its URL across 6 industries, plus the autonomous agent that fills the sales pipeline. Reference build: `~/Documents/QuoteSnap/quotesnap/`.

| File | What it does |
|------|--------------|
| `_Index — How to Use.md` | Pick which of the two below you need |
| `Build a Multi-Vertical Instant-Quote Tool (Reskin Any Business by URL).md` | One Next.js engine → any company's branded quote popup from just their URL. Generic vertical schema (add an industry = one JSON), reskin engine, popup embed, auto PDF demo. |
| `Run an Autonomous Cold-Outreach Agent (Reskin → PDF → Find Email → Send → Handoff).md` | The outbound machine: find leads → branded PDF demo → find real email → personalized pitch → queue. Hard human gates at the send and at any interested reply. App-password Gmail, 20/day cap, CAN-SPAM, reply handoff. |

**Stack:** Next.js + TypeScript + Tailwind · Playwright (PDF) · nodemailer/imapflow (outreach) · Hunter.io (optional)

---

### Standalone web-app skills

| File | What it does |
|------|--------------|
| `Turn a Python Script into a Paid SaaS App (Logins + Stripe + Hosting).md` | Wrap any Python automation in a paid SaaS product — Flask, Clerk auth, Supabase Postgres, Stripe subscriptions, Railway hosting. Every gotcha hit while building AutoReach. |
| `Keep a Web App Working When the Backend or Wifi Fails.md` | Make a frontend feel instant and survive a broken backend. Three-tier fallback (API → localStorage → demo data). Built and validated on KAI's 5 main screens. |
| `Make an AI App's Output Safe (System Prompt + Filter + Regen + Fallback).md` | Ship a consumer AI feature where you know it can't produce certain language. Four-layer defense: system prompt + post-generation forbidden-word filter + regen-with-stricter-prompt loop + safe canned fallback. Covers text chat AND vision. The pattern that made every Body-agent surface in KAI safe without manual review. |

---

## 02 — Deploy

How to ship things live.

| File | What it does |
|------|--------------|
| `Deploy a Website to Cloudflare.md` | Take a Vite/React/static SPA from a GitHub repo to a live `*.pages.dev` URL. Pages vs Workers, wrangler config, click-by-click flow. |
| `Deploy a Project from Someone Else's Repo (Fork Workflow).md` | When you're contributing to a repo you don't own (team repo, internship codebase) — fork to your own GitHub, push your branch, point Cloudflare at the fork. The fix for "permission denied" / 403 errors. |

---

## 03 — Finance & Budget Automation

Python scripts that build budgets, P&Ls, pro formas, and portfolio rollups from raw property data.

### Dragonfly 2026 Budget Engine
The four scripts I used to build the full 19-property 2026 projected budget. Re-runnable when new source data comes in. Run them in order.

| File | What it does |
|------|--------------|
| `README.txt` | How the four scripts fit together + how to re-run end-to-end |
| `01 — Build a Polished 2026 Budget for One Property (template).py` | Hand-built template for ONE property. Reference for what "good" looks like. |
| `02 — Build 2026 Budgets for All Standard Properties (auto-batch).py` | Main engine — processes 15 standard properties automatically |
| `03 — Build 2026 Budgets from Non-Standard Sources (PDF, PPT, Weird Excel).py` | Handles the 4 properties with non-standard source files |
| `04 — Roll Up All Property Budgets into One Portfolio Workbook.py` | Final summary — rolls all 19 properties into one workbook |

### Dragonfly Property Underwriting (5-Year Pro Forma)

| File | What it does |
|------|--------------|
| `README.md` | When to use this, what inputs you need, how it fits with the budget engine |
| `Underwrite a Property — Build a 5-Year Pro Forma with IRR + Sensitivity.py` | Produce one Excel file (3 tabs: stabilized NOI, 5-year cash flows + IRR, cap-rate sensitivity) for a Dragonfly retail acquisition. Matches the Regency Pro Forma format. |

### Quarterly Report Automation Skills
Take ONE property's source PDF (income statement, balance sheet, rent roll, exec-summary letter) and a firm's branded PPTX template — produce a finished investor report PPTX + PDF. Property-agnostic, firm-agnostic. Built for Dragonfly Q1 2026, reusable for any PE real-estate firm.

| File | What it does |
|------|--------------|
| `_Index — How to Use This Skill.md` | Entry point — when to trigger, what's in the folder, how to adapt for a non-Dragonfly firm |
| `Build a Quarterly Investor Report from a Property PDF + Template.md` | The full playbook — inspect template → extract PDF data → decide layout (monthly vs quarter-only, balance-sheet split) → build → convert via PowerPoint → visual QA via subagent. Lists every gotcha. |
| `_Helpers — PPTX Template Mechanics (Fill, Resize, Split, Swap Pictures).py` | Reusable helpers: `{{Placeholder}}` replacement across slides+masters+layouts, resize tables, delete columns, duplicate a slide, swap picture bytes, **generate a dynamic occupancy pie chart from rent-roll data**, **convert PPTX→PDF via LibreOffice**, inspect any new template. |
| `convert_pptx.scpt` | Legacy AppleScript fallback for Macs without LibreOffice (prefer `convert_pptx_to_pdf()` from the helpers). |

---

## 04 — Subagents

Claude Code subagents — specialists Claude delegates to mid-task. Each one has its own system prompt, its own tool list, and (usually) references skill files from the rest of this folder for the actual playbook.

> **Two copies of every subagent:**
> - **Live** (what Claude Code actually loads): `~/.claude/agents/<name>.md`
> - **Canonical** (findable here): `~/Documents/Claude Skills/04 - Subagents/<name>.md`
> Keep them in sync. If they drift, the live one wins.

| File | What it does |
|------|--------------|
| *(none yet — add the first one with `_HOW TO ADD A NEW AGENT.md`)* | — |

**Product-level autonomous agents** (real running programs like QuoteSnap's outreach machine) are not listed here — they live in their own project folders. The *recipes* for building them are skills under `01 - Build Web Apps/`.

---

## Naming convention (read this before adding a skill or agent)

Every skill filename must start with a **verb** that says what the skill produces. The goal: Evan can scan the folder and immediately know "this does this, let me use it."

- ✅ Good: `Build a Quote Form for a Consumer Business.md`, `Deploy a Website to Cloudflare.md`, `Underwrite a Property.py`
- ❌ Bad: `quote-form.md`, `cloudflare-stuff.md`, `Block 16.md`, `underwriting_v2.py`

Full rules in [`_HOW TO ADD A NEW SKILL.md`](_HOW%20TO%20ADD%20A%20NEW%20SKILL.md).

---

## Where the originals live (for reference)

- Cafecito skills → `~/Documents/Cafecito AI/Cafecito AI Skills/`
- Deploy-to-Cloudflare → `~/Documents/Claude/Skills/`
- Dragonfly budget skills → `~/Documents/Dragonfly/dragonfly 2026 projected budget/projected budget skills/`
- (Newer skills may not have an original outside this folder — that's fine, this is the canonical home.)
