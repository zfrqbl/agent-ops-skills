---
name: wordpress-publication-flow
description: "Use when publishing WordPress content through an agent. Review-first, approval-gated."
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [WordPress, Publishing, Approval, Review-First, MCP]
---

# WordPress Publication Flow

Publish posts and pages on a WordPress site through the MCP adapter, with the same review-first gate the rest of this repo runs on: draft, send for review, publish only on the owner's explicit approval word, verify the live result.

## When to Use

- The owner asks to write and publish a WordPress post or page.
- A queued or scheduled piece of content must be pushed live.
- Updating or replacing content that is already published.

Do not use when only drafting or editing is wanted (no publish intent) — that is the content-ops skill's job.

## Procedure

### 1. Scope the publication

- Identify the site, the post type, and the target status: draft, scheduled, or published. Draft is the default; every publish flight is approval-gated.
- Confirm the write path: the WordPress MCP adapter (discover abilities, get ability info, execute ability) when installed, otherwise WP-CLI or the REST API. Prefer the adapter's discover/execute pattern over hand-written REST calls.

### 2. Draft inside WordPress, not outside it

- Create the post as a draft in WordPress so themes, blocks, and media resolve before anyone reviews it.
- Set title, slug, excerpt, categories/tags, featured image, and meta description where the site uses them. Every image gets alt text.
- Match the site's established voice — see the content-ops skill for the voice rules; the person who approves is the same person whose voice this is.

### 3. Review-first gate

- Send the draft preview URL (or the full content) to the owner for approval. Accept only an explicit go word: "APPROVE", "publish it", "go live", or an equivalent direct instruction.
- Never publish on inferred intent, on praise ("nice", "good", "looks great"), or on silence. Silence means wait.
- Honor dates the owner names literally: "publish Friday" or "scheduled for the 10th" are commitments, not suggestions.

### 4. Publish or schedule

- On the explicit approval word, transition the post to published, or schedule it to the owner's named date and time.
- If scheduled: read the post back and confirm status is scheduled with the expected date. A 200 from the API is not proof the schedule landed.
- Write operations run with the connected user's existing roles and permissions; respect what the current credentials are allowed to do — do not escalate or bypass.

### 5. Verify the live result

- Read the post back from WordPress: status, URL, title, and a distinctive phrase from the body.
- If the publication is public, fetch the live URL and confirm it returns the new content and not an old cached revision.

### 6. Paper trail

- Record one line per publication: what went live, when, which approval authorized it, and the live URL.

## Output

The published (or scheduled) post with its verified live URL, plus a one-line confirmation naming the approval that authorized it.

## Guardrails

- Publish only on the owner's explicit approval word. "Sounds good" and inferred intent are not approvals.
- Approval is per-publication, never blanket.
- A scheduled post must be verified as scheduled before the run ends. Silence is not success.
- If a publish response was ambiguous, read the post back before retrying — a blind retry duplicates posts.
- Never publish the same content to multiple platforms as a side effect; each publication is one clear artifact.

## Verification

- [ ] The draft was created inside WordPress and its preview URL was reviewed by the owner.
- [ ] An explicit approval word for this exact publication is on record.
- [ ] The post's status and URL read back from WordPress match what was claimed.
- [ ] The live URL serves the new content.

## Pitfalls

- Publishing on praise or silence.
- Treating a successful API call as proof of a live post.
- Skipping schedule confirmation, alt text, or meta description.
- Retrying a publish after an ambiguous response without reading the post back first.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
