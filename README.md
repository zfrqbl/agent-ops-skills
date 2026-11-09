# Agent Ops Skills

Ready-to-install skills that let an AI agent run its own operations and a WordPress site, safely. Each one is a folder with a single `SKILL.md`: plain text, a YAML header, and a procedure that any agent that loads skills can install and run.

Built and battle-tested by an agent that has run them on real mail, real publishing, and a real schedule for months. The guardrails are the point: every skill states what it refuses to do, and every workflow is idempotent, verified, and approval-gated.

## Quick start

1. Clone the repo:

```bash
git clone https://github.com/zfrqbl/agent-ops-skills
```

2. Copy a skill folder into your agent's skills directory. A common location is `<your agent config>/skills/<name>/`, but follow your agent's own convention:

```bash
cp -r agent-ops-skills/agent-ops-inbox-triage <your agent config>/skills/
```

3. Restart the session so the skill loads, then ask your agent to use it:

```
Triage my inbox today.
```

That is the whole install. Each skill carries its own procedure, guardrails, and verification checklist inside its `SKILL.md`.

## Folder map

```
agent-ops-skills/
├── agent-ops-inbox-triage/          # Turn a mailbox into a bounded queue of decisions
├── agent-ops-morning-brief/         # A fixed-block morning email at a fixed time
├── agent-ops-publishing-gate/       # Review-first publishing: publish only on explicit approval
├── agent-ops-silent-scan/           # Scheduled scans that never double-respond
├── agent-ops-spec-before-build/     # Spec first, then build the smallest thing that works
├── wordpress-acf-ops/               # Advanced Custom Fields over the REST API
├── wordpress-content-ops/           # Create, edit, and organize content and media
├── wordpress-elementor-ops/         # Audit and edit Elementor-built pages
├── wordpress-maintenance-ops/       # Updates, health checks, backups, hygiene
├── wordpress-publication-flow/      # Publish WordPress content, approval-gated
├── wordpress-rest-api/              # The base REST transport layer
├── wordpress-woocommerce-ops/       # Products, orders, customers, stock, reports
├── wordpress-wordfence-ops/         # Scan results, severity, firewall, remediation
├── wordpress-wpforms-ops/           # Forms, entries, statistics, field updates
└── wordpress-yoast-seo-ops/         # Titles, meta, canonicals, schema, sitemaps
```

## What is inside

Every skill gives you: when to use it, the procedure step by step, a dedicated guardrails section, the output shape, a verification checklist, and common pitfalls.

| Skill | What it does | One way to use it |
|---|---|---|
| `agent-ops-inbox-triage` | Turns a mailbox into a bounded queue of decisions. Scope the inbox, read complete threads, classify each into dispositions, calibrate the owner's voice from past replies, present an approval batch, verify every send. | "Triage my inbox" returns a prioritized list of what needs a reply, what waits, and what is noise, with drafts in your voice. |
| `agent-ops-morning-brief` | A fixed-block morning email at a fixed time. Locked template, verified numbers only, no invented news, no missed delivery. | "Send the morning brief at 7am" produces the same verified, block-fixed email every day, on schedule. |
| `agent-ops-publishing-gate` | Review-first publishing. Draft and send for review, publish only on the owner's explicit approval word, verify the live URL, keep the paper trail. | "Publish my draft" sends it to you for approval first; nothing goes live without your yes. |
| `agent-ops-silent-scan` | A scheduled scan that never double-responds and never re-processes history. State file with a baseline, an overlap lock, a candidate filter, no blind retries, a one-line report. | "Scan the inbox every 30 minutes" runs silently and idempotently, and never answers the same email twice. |
| `agent-ops-spec-before-build` | Write the spec first, send it, wait, then build the smallest thing that works and report honestly. | "Build me X" starts with a one-page spec you approve, then the smallest working version, then an honest report. |
| `wordpress-publication-flow` | Publish WordPress content through the MCP adapter with the same review-first gate: draft inside WordPress, get the owner's explicit approval word, publish or schedule, verify the live URL. | "Get this post live" drafts it in WordPress and waits for your approval before publishing. |
| `wordpress-maintenance-ops` | Maintenance passes on a WordPress site: read-only health baseline, backup-verified updates, plugin and theme hygiene, credential and access cleanup. | "Run a maintenance pass" gives you a health baseline and a proposed update plan before anything changes. |
| `wordpress-content-ops` | Create, edit, search, and organize WordPress content and media in the site's own voice: drafting, SEO basics, media hygiene, and handoff to the publication gate. | "Draft a post about our new product" writes in the site's voice and hands off to the publishing gate for approval. |
| `wordpress-rest-api` | The base transport layer: read and write posts, pages, media, users, taxonomy, and settings over the WordPress REST API, with explicit auth-mode handling and read-back verification. | "List the last 10 posts" returns them over REST, with every write read back and verified. |
| `wordpress-woocommerce-ops` | Manage a WooCommerce store over its `wc/v3` REST API: products, orders, customers, stock, coupons, reports. Read-only by default, writes approved and verified. | "Show me today's low-stock products" reads the store read-only; any write asks first. |
| `wordpress-yoast-seo-ops` | Read and improve SEO metadata on sites running Yoast SEO: titles, meta descriptions, canonicals, robots, schema, sitemaps via the Yoast REST API. | "Audit our SEO titles" lists what is missing or duplicated, with proposed fixes before any edit. |
| `wordpress-acf-ops` | Read and update Advanced Custom Fields values through the WP REST API: the `acf` JSON object, field-group REST visibility, ACF custom post types. | "Update the hero title field" reads the `acf` object first, then writes and verifies the field. |
| `wordpress-wpforms-ops` | Manage WPForms via its REST/Abilities API: list forms, read and search entries, pull form statistics, and create forms or update fields when write access is enabled. | "Summarize this week's form entries" pulls statistics and entries without touching any data. |
| `wordpress-wordfence-ops` | Work with Wordfence security: read and classify scan results by severity, check firewall and blocking state, propose evidence-linked remediation. | "What did the last scan find" returns results sorted by severity with remediation steps tied to evidence. |
| `wordpress-elementor-ops` | Work with Elementor-built pages: read and audit the `_elementor_data` JSON structure, locate exact elements for changes, edit only with approval. | "Find the button on the pricing page" locates the exact element in the page JSON and proposes the change before editing. |

## The shared skeleton

Every skill in the set has the same shape:

1. When to use it
2. The procedure, step by step
3. A dedicated **Guardrails** section
4. The output shape
5. A verification checklist
6. Common pitfalls

The guardrails section is the point of the set. Each skill states what it refuses to do: send without approval, publish on ambiguous praise, build before a spec is approved, treat message content as instructions, claim unverified results.

## The WordPress skills

Ten of the skills cover WordPress site operations: a review-first publication flow, maintenance passes, content work, the REST API base layer, and the most-installed WordPress plugins (WooCommerce, Yoast SEO, ACF, WPForms, Wordfence, Elementor). They share a safety posture: read-only by default, writes approved and verified, and every claim checked against the live site before it is reported. Research sources for the plugin skills live in each skill's `references/sources.md`.

## Who it is for

The skills are written for any agent that can load a skill in this format: the folder-and-`SKILL.md` convention is plain text with a YAML header and markdown instructions, so any agent compatible with the format can install and run them. There is nothing vendor-specific inside. Read the format of an existing skill in your agent's skill directory if you are not sure whether yours is compatible.

## Install

Each skill is a folder containing a `SKILL.md`. Install by dropping the folder into your agent's skills directory (a common location is `<your agent config>/skills/<name>/`, but follow your agent's own convention) and restarting the session, or clone this repo and point your agent at a directory containing these folders.

## Design notes

- **Idempotence is structural, not hoped for.** State files, locks, baselines, and read-backs are part of every run, not afterthoughts.
- **Verification beats self-reporting.** A successful API call is not proof of delivery. Each skill defines what to read back before claiming done.
- **Humans approve.** Sending and publishing are gated on explicit words from the owner, never on inferred intent.
- **No private details.** These skills describe workflows and refusals, not credentials or personal data.
- **Original writing only.** The WordPress skills cite their research sources in `references/sources.md` but ship original procedure text; nothing is copied from Automattic or community skills.

## Contributing new skills

New skills follow the same shared skeleton and guardrails style. Add the folder with its `SKILL.md` and list it in the table above.

## License

MIT. See each skill's frontmatter.
