---
name: wordpress-content-ops
description: "Use when creating, editing, searching, or organizing WordPress content and media."
version: 1.1.0
author: Hermes Agent
license: MIT
compatibility: "WordPress 6.9+ (PHP 7.4+); agent with bash + node; MCP adapter or REST access."
metadata:
  hermes:
    tags: [WordPress, Content, Editing, Media, SEO]
---

# WordPress Content Ops

Create, edit, search, and organize WordPress content and media through the MCP adapter: writing, restructuring, media handling, and SEO basics, all in the site's own voice.

## Prerequisites

- A reachable WordPress site (6.9+) with the REST API enabled (default).
- Access via the WordPress MCP adapter (`wp plugin install mcp-adapter --activate`), the REST API, or WP-CLI.
- Credentials from the environment, never inline: `WP_URL`, `WP_USER`, `WP_APP_PASSWORD` (or `WP_REST_USERNAME` / `WP_REST_PASSWORD`). Application passwords are secrets; never log or echo them.

## When to Use

- Drafting new posts or pages in the site's established voice.
- Editing, updating, or merging existing content.
- Finding content by search or taxonomy when the owner refers to it.
- Media work: upload, alt text, deduplication.
- SEO passes: titles, slugs, meta, internal links.

## Procedure

### 1. Learn the site's content conventions first

- Read recent posts: structure, tone, heading style, typical length, link behavior. Match the house voice. This repo's content skills enforce the same contrarian-opinion principle as the owner's site: a clear thesis, then evidence.
- Check the existing taxonomy (categories and tags) so new content slots in with the rest, not beside it.

### 2. Find before you create

- Search the site for existing content on the topic before drafting. If an old post already covers it, plan an update or a merge instead of a new post — duplication dilutes the site.

### 3. Create or edit in draft

- Draft inside WordPress (draft status, or the editor tooling the workspace exposes), using blocks consistently. Set slug, excerpt, featured image, alt text, and meta description.
- Facts must be checkable. Cite or link any claim that is not common knowledge; never pad with invented specifics.

### 4. SEO pass (basics)

- One clear primary keyword per post, in the title, H1, slug, and first paragraph.
- A unique meta description around 150 characters, descriptive alt text on every image, and internal links to two or three related posts.
- After a publish handoff, check the sitemap and feed so nothing ends up orphaned.

### 5. Media hygiene

- Reuse existing media where possible; upload only genuinely new assets; name files semantically; fill in alt text; flag near-duplicate uploads for consolidation.

### 6. Handoff to publication

- Content that should go live hands off to the wordpress-publication-flow skill: draft URL plus its approval gate. This skill never publishes.

## Output

Draft or edited content in WordPress with title, slug, meta, and media set, plus a content note: what changed, what is new, and what awaits publishing approval.

## Guardrails

- Never publish from this skill. Publication goes through the wordpress-publication-flow approval gate.
- Never fabricate facts, quotes, or citations to fill space.
- The voice is the owner's voice: no generic AI phrasing, no hype words, no style ticks the owner's writing forbids.
- Don't duplicate content that already exists on the site; update instead.
- Alt text and meta description are part of the deliverable, not extras.

## Verification

- [ ] Searched for existing content before creating.
- [ ] Draft has title, slug, excerpt, categories/tags, alt text, and meta description.
- [ ] Facts are traceable and links verified.
- [ ] No publication happened from this skill.

## Pitfalls

- Drafting in a generic voice instead of matching the site's.
- Duplicating existing content because the search step was skipped.
- Publishing from the editing skill — the gate exists for a reason.
- Shipping images without alt text or a meta description without the keyword.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
