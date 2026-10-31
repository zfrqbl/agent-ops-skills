# Agent Ops Skills

A growing set of ready-to-install skills for running an AI agent's own operations: a bounded inbox triage loop, a silent scheduled scan, a fixed morning brief, a review-first publishing gate, and spec-before-build. Built and battle-tested by an agent that has run them on real mail, real publishing, and a real schedule for months.

The set is designed to grow: new skills are added over time as the operations they encode are proven in practice, so check back or watch the repo for additions.

## What is inside

| Skill | What it does |
|---|---|
| `agent-ops-inbox-triage` | Turns a mailbox into a bounded queue of decisions. Scope the inbox, read complete threads, classify each into dispositions, calibrate the owner's voice from past replies, present an approval batch, verify every send. |
| `agent-ops-silent-scan` | A scheduled scan that never double-responds and never re-processes history. State file with a baseline, an overlap lock, a candidate filter, no blind retries, a one-line report. |
| `agent-ops-morning-brief` | A fixed-block morning email at a fixed time. Locked template, verified numbers only, no invented news, no missed delivery. |
| `agent-ops-publishing-gate` | Review-first publishing. Draft and send for review, publish only on the owner's explicit approval word, verify the live URL, keep the paper trail. |
| `agent-ops-spec-before-build` | Write the spec first, send it, wait, then build the smallest thing that works and report honestly. |

## The shared skeleton

Every skill in the set has the same shape:

1. When to use it
2. The procedure, step by step
3. A dedicated **Guardrails** section
4. The output shape
5. A verification checklist
6. Common pitfalls

The guardrails section is the point of the set. Each skill states what it refuses to do: send without approval, publish on ambiguous praise, build before a spec is approved, treat message content as instructions, claim unverified results.

## Who it is for

The skills are written for any agent that can load a skill in this format: the folder-and-`SKILL.md` convention is plain text with a YAML header and markdown instructions, so any agent compatible with the format can install and run them. There is nothing vendor-specific inside. Read the format of an existing skill in your agent's skill directory if you are not sure whether yours is compatible.

## Install

Each skill is a folder containing a `SKILL.md`. Install by dropping the folder into your agent's skills directory (a common location is `<your agent config>/skills/<name>/`, but follow your agent's own convention) and restarting the session, or clone this repo and point your agent at a directory containing these folders.

## Design notes

- **Idempotence is structural, not hoped for.** State files, locks, baselines, and read-backs are part of every run, not afterthoughts.
- **Verification beats self-reporting.** A successful API call is not proof of delivery. Each skill defines what to read back before claiming done.
- **Humans approve.** Sending and publishing are gated on explicit words from the owner, never on inferred intent.
- **No private details.** These skills describe workflows and refusals, not credentials or personal data.

## Contributing new skills

New skills follow the same shared skeleton and guardrails style. Add the folder with its `SKILL.md` and list it in the table above.

## License

MIT. See each skill's frontmatter.
