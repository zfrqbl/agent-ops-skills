---
name: wordpress-yoast-seo-ops
description: "Use when reading or improving SEO metadata on a WordPress site running Yoast SEO: titles, meta descriptions, canonical, schema, sitemaps."
version: 1.0.0
author: Hermes Agent
license: MIT
compatibility: "Yoast SEO 16.7+ (REST raw data) on WordPress 6.9+; agent with bash + https tooling."
metadata:
  hermes:
    tags: [WordPress, Yoast, SEO, Metadata, Schema, Sitemaps]
---

# WordPress Yoast SEO Ops

Read and improve SEO metadata on a WordPress site running Yoast SEO — titles, meta descriptions, canonicals, robots rules, OpenGraph, and schema.org output — through the Yoast REST API and the site's own content-edit path. The most-installed SEO plugin on WordPress (5M+ active installs).

## When to Use

- Checking or fixing SEO metadata (title tag, meta description, canonical URL) on any URL or post.
- Verifying schema.org output and sitemap health on a Yoast site.
- Running the SEO pass of the content-ops skill when the target site runs Yoast: one primary keyword per post, title/H1/slug/first-paragraph placement, unique meta description.

## Prerequisites

- Yoast SEO installed and active with the REST API enabled (SEO > General > Features toggle).
- Reads are public: `GET /wp-json/yoast/v1/get_head?url=<url>` returns the complete head output for any URL — no auth needed.
- Writes go through the WordPress REST API and need application-password credentials from the environment: `WP_URL`, `WP_USER`, `WP_APP_PASSWORD` (secret; never log or echo).

## Procedure

### 1. Read the current head

- `GET /wp-json/yoast/v1/get_head?url=<url>` returns `{head: ..., status: 200}`: the full meta output (title, description, canonical, robots, OpenGraph, Twitter, schema.org). Use the raw `json` format (Yoast 16.7+) when you need key/value pairs to edit rather than the prebuilt bundle.
- For post/pages queried through the WP REST API (`/wp-json/wp/v2/posts`), the response includes a `yoast_head` field with the same data.

### 2. Audit against a keyword

- One primary keyword per post; it belongs in title, H1, slug, and first paragraph.
- Meta description: unique, ~150 characters, contains the keyword, and differs from the title.
- Canonical points at the preferred URL (no duplicate content); robots rules are explicit where the site needs noindex/noarchive.

### 3. Fix metadata

- Update the post's SEO fields through the WP REST API post update (Yoast stores these as post metadata; a normal post PATCH with the SEO fields set is the safe path — do not hand-edit serialized meta).
- After the write, GET the head again and confirm the new title/description/canonical render.

### 4. Verify sitemaps and schema

- Fetch the XML sitemap index (`/sitemap_index.xml` or the Yoast-generated URL) and confirm the posts/pages entries exist; check schema output via the head's schema.org JSON-LD.

## Output

An SEO report per checked URL: current title/description/canonical/robots, keyword placement verdict, what was changed (with read-back confirmation), and sitemap/schema status.

## Guardrails

- Never publish from this skill — title/meta changes are content edits, and going live is the publication-flow skill's approval-gated job.
- Don't invent keywords or stuff metadata; one real keyword per post, grounded in the content.
- Hand-editing WordPress serialized post meta is forbidden — use the REST API fields.

## Verification

- [ ] Head read before and after any change.
- [ ] Changed fields confirmed in a fresh `get_head` call.
- [ ] Sitemap/schema checks done or a reason stated for skipping.

## Pitfalls

- Trusting the prebuilt head bundle format instead of requesting `json` raw when you need to edit values.
- Treating a 200 from the API as proof the live page renders the new meta — the head read-back is the proof.
- Confusing Yoast's post meta storage with the REST-exposed fields; always edit through the API.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
