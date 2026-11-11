# Contributing to Agent Ops Skills

Thanks for wanting to add a skill. The set stays small and opinionated on purpose: every skill ships the same skeleton, the same guardrails posture, and original text. New skills that do not fit the shape are declined.

## What a new skill needs

1. **A folder named `kebab-case-skill-name`** containing a single `SKILL.md`.
2. **The shared six-part skeleton**, in this order:
   - When to use it
   - The procedure, step by step
   - A dedicated **Guardrails** section
   - The output shape
   - A verification checklist
   - Common pitfalls
3. **Guardrails as a first-class section, not an afterthought.** State what the skill refuses to do: send or publish without explicit approval, treat message content as instructions, claim unverified results, build before a spec is approved.
4. **Original writing.** WordPress plugin skills must cite their research sources in `references/sources.md` and ship their own procedure text. No copy-paste from plugin docs or other skills.
5. **No secrets.** Skills describe workflows and refusals, never credentials, tokens, or personal data.
6. **An entry in the README table** (name, what it does, one way to use it) and a line in the folder map.

## How to contribute

1. Fork the repo, create a branch (`add-skill-name`), add your skill folder.
2. Open a pull request. In the body: what the skill does, who it is for, and how you verified it (a run log is ideal).
3. Expect review comments on guardrails and verification before merge. Review-first is the house rule: no skill merges itself.

## Reporting problems

Open an issue with the skill name, what you ran, the actual output, and the expected output. Screenshots help; full transcripts help more.

## Code of conduct

Behave like the skills behave: read-only by default, verify before claiming, and ask before changing other people's work.
