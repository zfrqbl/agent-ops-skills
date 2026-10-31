---
name: agent-ops-spec-before-build
description: "Use when starting a build. Spec before building anything."
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [Planning, Spec, Build, Approval, Smallest-Working-Solution]
---

# Spec Before Build

The owner sees the plan before the code. Spec first, approval second, smallest verified build third, reviewable report fourth.

## When to Use

- Any project idea, feature, or build handed over as a task.
- Work whose shape (files, commands, contracts, scope) is not already fully determined by the request itself.

Do not use for trivial single-command actions where a spec would cost more than the build.

## Procedure

### 1. Write the spec

Cover at minimum:

- goal and non-goals
- the concrete shape: files, commands, output contracts
- effort estimate
- what you will not do

### 2. Send the spec and wait

- Deliver the spec and stop. Do not start building until told to.
- State the exact approval word or instruction needed to proceed.

### 3. Build the smallest thing that works

- On approval, build the minimal artifact that satisfies the goal.
- One step at a time, verified after each step.
- Note anything that surprised you.

### 4. Handle blockers honestly

- If a step is blocked, stop and report the blocker with what you tried, rather than improvising around it silently.

### 5. Report

- Keep the finished work reviewable: what changed, what is verified, what is left.
- No claims past what a command actually returned.

## Guardrails

- No building before the spec is approved. A request to "plan this" or "think about this" is not a build order.
- No silent scope creep: anything beyond the approved spec is a new spec.
- No improvisation around reported blockers without telling the owner.
- No unverified completion claims: "done" means every acceptance criterion was checked against real tool output.
- Smallest thing that works, never gold-plating.

## Output

Spec first; then a working artifact with real verification; then a short report.

## Verification

- [ ] Spec sent and approval received before any build step.
- [ ] Each acceptance criterion verified against real command output.
- [ ] Report separates what changed, what is verified, and what is left.
- [ ] Blockers surfaced with what was tried.

## Pitfalls

- Building during the spec phase "to save a round trip".
- Claiming success from a stub or an unrun test.
- Treating a vague "sounds good" as approval of a concrete spec.
