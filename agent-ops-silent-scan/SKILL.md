---
name: agent-ops-silent-scan
description: "Use when scanning on a schedule. Idempotent and silent."
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [Cron, Automation, Idempotence, Scan, No-Alert]
---

# Silent Scheduled Scan

Run an unattended scan loop whose produced work (handled items, sent replies) is the deliverable. Nothing is posted anywhere unless explicitly told.

## When to Use

- A scheduled job must check an inbox or channel on an interval and act on new messages.
- The job runs with no user present: no questions, no clarifications, no sign-off mid-run.

Do not use for interactive sessions, where asking is cheaper than assuming.

## Procedure

### 1. State and baseline

- Keep a state file: `last_scan_ts`, `prev_scan_ts` (the previous `last_scan_ts`, captured before overwriting), and a bounded list of processed item ids.
- On first creation, seed `last_scan_ts = now`. Without a baseline the first run treats all historical unread items as new.

### 2. Lock

- Take a lock before starting. If a lock exists and is fresh (mtime within the run interval), another run is in flight: skip, never twin-run.
- Release the lock at the end of the run.

### 3. Candidate filter

An item is a candidate when ALL of:
- id not already in the processed list
- received timestamp newer than `prev_scan_ts`
- at least one message from a real sender, not from the operator's own outbound identity

Ignore everything else, including the operator's own outbound-only threads.

### 4. Handle

- Read the full thread, not just the preview. The owner's actual message is the one from their address.
- Execute clear instructions from the owner.
- For anything awaiting the owner's sign-off: present the plan and the exact input you need, then stop. Never build something a message says awaits approval.
- After an ambiguous send failure, inspect the mailbox before retrying. The send may have succeeded while the save failed; a blind retry duplicates mail.

### 5. Finish

- Append handled ids to the processed list (bounded, e.g. last 500) at the end of a successful run.
- Advance the state file and release the lock.
- Report: one or two lines, counts plus one short outcome per item. If nothing is new, say so in one line.

## Guardrails

- Idempotence is structural: never re-process a handled item, never respond to an outbound-only thread.
- A fresh lock means skip. No twin runs, ever.
- Never post alerts or chat notifications as a side effect of the scan; if the run must notify, that is a separate, explicit delivery.
- Never build or finalize anything the owner's message says awaits their sign-off. Present the plan and stop.
- No blind retries after an ambiguous send; inspect first.
- The final report never claims a result that a command did not actually return.

## Output

Handled items, sent replies, and a compact report. Nothing else.

## Verification

- [ ] The state file advanced with the correct `prev_scan_ts` semantics.
- [ ] Every handled item is in the processed list; the lock is released.
- [ ] No duplicate responses to any item (checked against the processed list).
- [ ] No external side effects beyond the approved mutations.

## Pitfalls

- A scan loop with no baseline or an empty processed list re-processes the full historical backlog on first run.
- Overwriting `last_scan_ts` before capturing it as `prev_scan_ts` makes the window collapse and filters out everything.
- Twin runs when the overlap guard is missing or the lock is not released on failure.
