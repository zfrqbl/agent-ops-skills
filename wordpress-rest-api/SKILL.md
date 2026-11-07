---
name: wordpress-rest-api
description: "Use when talking to a WordPress site over REST: read or write posts, pages, media, users, taxonomy, settings."
version: 1.0.0
author: Hermes Agent
license: MIT
compatibility: "WordPress 5.6+ (application passwords), 6.9+ recommended; agent with bash + https tooling."
metadata:
  hermes:
    tags: [WordPress, REST, API, JSON, Integration]
---

# WordPress REST API

The base layer for anything that talks to a WordPress site over HTTP: query and update posts, pages, media, users, comments, terms, and settings via the built-in REST API, handling auth explicitly and verifying every write by reading back.

## When to Use

- Any WordPress work that goes over HTTP rather than the MCP adapter or WP-CLI.
- Pulling content, media, or metadata into reports, scripts, or other tools.
- Creating or updating posts, pages, media, taxonomies, or settings programmatically.
- The fallback transport named by the sibling skills (publication-flow, content-ops) when the adapter or WP-CLI is unavailable.

## Prerequisites

- A reachable WordPress site with the REST API enabled (default since 4.7).
- Auth: an application password (`WP_URL`, `WP_USER`, `WP_APP_PASSWORD` — recommended, WordPress 5.6+), or `WP_REST_USERNAME` / `WP_REST_PASSWORD`. Cookie+nonce auth works only for in-browser sessions and is not for agents. Application passwords are secrets; never log or echo them.
- HTTPS enforced; the API rejects non-HTTPS Basic Auth in modern setups.

## Procedure

### 1. Discover the surface first

- `GET /wp-json/` returns the route index and the site's available namespaces — confirm the endpoints you plan to use exist before scripting against them.
- Read the schema of a route when unsure of its fields: `OPTIONS /wp-json/wp/v2/posts` returns the accepted arguments and types.

### 2. Authenticate explicitly

- Public content is readable without auth; anything private, or any write, needs credentials. Use Basic Auth with the application password, over HTTPS only.
- State which auth mode you used in every report line; auth failures (401) are configuration problems, not retry opportunities.

### 3. Read before you write

- Fetch the current object, identify exactly what changes, and send a partial update (PATCH/POST with only the fields changing).
- Paginate list reads (`per_page`/`page`) and stop early once you have everything you need; never assume one page holds all results.

### 4. Writes: one object at a time, verified

- Create with POST to the collection route, update with POST to the object route (or PATCH where the schema allows).
- After every write, GET the object back and confirm status, title/slug, and the field you changed. A 200 response is not proof the change landed.
- On ambiguous responses (timeout, connection error after send), read the object back before retrying — a blind retry duplicates posts.

### 5. Respect the server

- Honor `429` + `Retry-After`; throttle bulk work. There are no core rate limits, but hosts enforce their own.

## Output

A report of every call made and result: what was read (count, pagination), what was written (object id, status, read-back confirmation), and auth mode used.

## Guardrails

- No write without a stated purpose and, for site-visible changes, the owner's approval where the sibling publication gate requires it.
- Never send credentials in URLs, logs, or chat; application passwords only in auth headers from the environment.
- Never blind-retry after an ambiguous response; read back first.

## Verification

- [ ] Route index fetched and endpoints confirmed before use.
- [ ] Auth mode stated; HTTPS enforced.
- [ ] Every write read back and confirmed.
- [ ] Pagination complete or an early-stop reason stated.

## Pitfalls

- Assuming one page of results is all results.
- Treating a 201/200 from the API as proof of a landed change.
- Blind retries after ambiguous sends, duplicating posts.
- Using cookie+nonce auth in a non-browser agent.
- Logging the application password or embedding it in URLs.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
