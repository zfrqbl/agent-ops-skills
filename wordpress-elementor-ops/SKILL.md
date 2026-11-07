---
name: wordpress-elementor-ops
description: "Use when working with Elementor-built pages on a WordPress site: read page structure, audit sections/widgets, and plan or review Elementor content changes."
version: 1.0.0
author: Hermes Agent
license: MIT
compatibility: "Elementor (free or pro) on WordPress 6.9+; agent with bash + https tooling; Elementor content is JSON post meta."
metadata:
  hermes:
    tags: [WordPress, Elementor, PageBuilder, Layout, JSON]
---

# WordPress Elementor Ops

Work with Elementor-built pages on a WordPress site: read and audit page structure, understand how Elementor stores layouts, and support content changes safely. Elementor is the most-installed page builder on WordPress (5M+ active installs) and the layout tool behind a large share of marketing sites.

## When to Use

- The site uses Elementor and the task involves page structure: what sections/widgets a page has, where text/images live, which templates apply.
- Auditing a page before a content change (find the section and widget that holds the text/image to update).
- Reviewing whether an Elementor edit can be done safely from an agent at all (see Guardrails).

## Prerequisites

- Elementor installed (free or pro).
- Reads: pages/posts fetched through the WP REST API with the `_elementor_data` post meta included (register the meta for REST or use WP-CLI `wp post meta get <id> _elementor_data` style access on a local/Cli environment). Auth via application password when REST meta access requires it (`WP_URL`, `WP_USER`, `WP_APP_PASSWORD`; secret).
- Elementor stores each page's layout as a JSON document in the `_elementor_data` post meta key — not as normal content. Everything below depends on that fact.

## Procedure

### 1. Read the page's Elementor structure

- Get the post and its `_elementor_data` JSON: a tree of sections > columns > widgets, each element with `id`, `elType` (`section`/`column`/`widget`), `settings`, and `elements`.
- Walk the tree to locate the piece a task refers to: the widget with the headline text, the section with the background image, the button with a URL.

### 2. Audit and report

- Produce a structural summary, not the raw JSON: sections count, widgets per section, key settings (titles, links, images, layout flags), template used, and where each content element lives (path of element ids from section to widget).

### 3. Plan precise changes

- For a requested change, identify the exact target: element id, the settings key (e.g. `title`, `link.url`, `background_image`), old value, new value, and an example of the correct edit. Elementor JSON edits are exact-id operations; a wrong id or a broken JSON document takes the page down (this is why edits are not automated by default).

### 4. Edit only with approval and verification

- If the owner explicitly approves an agent-performed edit: fetch the exact document, edit only the targeted settings key(s) under the target element id, keep the JSON valid (lint it before saving), save, then re-read `_elementor_data` and confirm the element id + settings value changed and the document still parses.
- Never reformat, reorder, or regenerate the document: Elementor is picky about its structure (settings defaults, `isInner` flags, ids). A minimal targeted edit is the only safe one.

## Output

A structural report of the page (sections/widgets/elements with paths and key settings), plus — for approved edits — a confirmation that the exact element changed and the document still parses.

## Guardrails

- No Elementor edits without explicit approval; a broken `_elementor_data` JSON takes the page down (blank page or PHP error).
- Only minimal targeted edits under one element id; never reorder, reformat, or regenerate the document.
- No publishing from this skill; going live is publication-flow's approval-gated job.
- Raw JSON dumps of full pages don't leave the workflow; summarize instead.

## Verification

- [ ] Structure read and summarized with element paths.
- [ ] Approved edits re-read: element id + settings value changed, JSON still valid.
- [ ] No reformat/reorder of the document.

## Pitfalls

- Treating `_elementor_data` like normal content and regenerating it.
- Editing the wrong element id (identical-looking widgets have distinct ids).
- Saving invalid JSON and taking the page down.
- Assuming Elementor content lives in the post `content` field — it lives in `_elementor_data`.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
