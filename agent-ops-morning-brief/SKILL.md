---
name: agent-ops-morning-brief
description: "Use when writing the daily brief. Fixed block template."
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [Briefing, Email, Template, Daily, Non-Technical]
---

# Fixed Block Morning Brief

Produce one plain-language briefing email at a fixed morning time, in a locked block template, for a non-technical reader.

## When to Use

- A daily email digest is expected at a fixed time (calendar, tasks, news, system health, portfolio).
- The recipient is a non-technical reader who wants decisions and highlights, not raw output.

## Procedure

### 1. Gather verified inputs

Pull each block from its own source and record the numbers as printed:

- tasks and events from the task system
- news within the fixed cutoff window, each item sourced
- token/usage stats, backup status, system health, portfolio values
- any candidate or recommendation lists the reader expects to see

### 2. Compose in the locked template

- Same section order and names every day. Only values change, never structure.
- Lead with what needs attention today, then scheduled items, then health in one block, then a short worth-reading section.
- Plain, non-technical wording. Tasteful minimal color; no hype words; no em dashes.

### 3. Verify every number

- A declared total is a hard assertion: recount if unsure. Clock, usage, task counts, and health figures are checked before printing.
- If a block cannot be produced, say why in the brief instead of silently skipping it.

### 4. Send at the fixed time

- Deliver to the fixed recipient, both text and html versions.
- If the brief cannot be produced, say why in the brief rather than silently skipping.

### 5. Record

- Log a one-line note of the send and its key contents so the day's activity is reconstructible.

## Guardrails

- The template is locked: order and labels do not change without the owner's explicit request.
- No unverified numbers. Every figure in the brief was returned by a command or API in this run.
- No invented news. If nothing meaningful is found in the window, say so in one line rather than padding.
- New task items the reader should track are added to the task system proactively and reported as such.
- No hype words, no em dashes, no jargon without a one-line explanation.

## Output

The formatted email at the fixed time, plus any tasks filed.

## Verification

- [ ] Every block was covered, or the absent block is explained.
- [ ] Each printed number matches a real command/API result from this run.
- [ ] Template order and labels match the locked template exactly.
- [ ] Delivery confirmed by reading the sent state back.

## Pitfalls

- Declaring a total from a partial fetch or a truncated list.
- Reordering or renaming blocks on a whim, breaking the reader's daily pattern.
- Padding the news section with unsourced items when the window was quiet.
