---
name: wordpress-acf-ops
description: "Use when reading or updating Advanced Custom Fields (ACF) values on a WordPress site: custom fields, field groups, custom post types and taxonomies over the REST API."
version: 1.0.0
author: Hermes Agent
license: MIT
compatibility: "ACF 5.11+ (REST API support) on WordPress 6.9+; agent with bash + https tooling."
metadata:
  hermes:
    tags: [WordPress, ACF, CustomFields, REST, CPT]
---

# WordPress ACF Ops

Read and update Advanced Custom Fields (ACF) values through the WordPress REST API: custom field data on posts, users, and terms, field-group visibility, and ACF-registered custom post types and taxonomies. ACF is one of the most-installed developer plugins on WordPress (2M+ active installs) and the standard way sites store structured custom data.

## When to Use

- The site uses ACF and a task needs the custom field values (not just core content): product specs, structured data, layout settings, author bios.
- Adding or correcting ACF field data on an existing post/user/term.
- Checking field-group REST visibility or how ACF custom post types/taxonomies are exposed.

## Prerequisites

- ACF 5.11+ (free or PRO).
- REST visibility: ACF field groups are NOT visible in the REST API by default — a field group only appears after its Settings > Show in REST API option is enabled. Confirm this before expecting `acf` data in responses.
- Auth for writes: application password from the environment (`WP_URL`, `WP_USER`, `WP_APP_PASSWORD`; secret, never logged or echoed). GET works without auth for public content; POST/PATCH requires auth.

## Procedure

### 1. Confirm ACF REST visibility

- Field groups added to posts, pages, custom post types, users, and taxonomies are available in their respective WP REST endpoints (`/wp-json/wp/v2/{post-type}`, `/users`, `/categories`, custom taxonomies) — but only where "Show in REST API" is enabled on the field group.
- ACF-registered custom post types and taxonomies are visible in the REST API by default (namespace `wp/v2`), with visibility/namespace/controller configurable under ACF > Post Types > Advanced Configuration > REST API.

### 2. Read custom field data

- `GET /wp-json/wp/v2/{post-type}/{id}` returns ACF values in the `acf` JSON object in the response (e.g. `acf.author`, `acf.price`). The same applies to users and terms (`/users/{id}`, `/categories/{id}`).
- `OPTIONS` on the same route returns the schema and accepted fields.

### 3. Update field values

- `POST /wp-json/wp/v2/{post-type}/{id}` with the `acf` object containing only changed fields. Do not hand-edit serialized meta; use the API field path.
- After the write, GET the object back and confirm the `acf` values match what was sent.

### 4. Field structure work

- Creating or editing field groups themselves is admin-UI territory (ACF has no public REST API for field-group definitions); the agent's write path is field VALUES, not field-group schemas. Flag schema changes for the owner to do in the UI.

## Output

A field report: which objects were read (ids + acf values used), which field values were written (each verified by read-back), and any field groups found not REST-visible.

## Guardrails

- Never write field values without knowing what the field means to the site (a number field may be currency, an ID, a sort key).
- Never edit field-group schemas via serialized meta hacks — values only, through the REST API.
- Writes that change owner-visible content follow the same review gate: no publishing from this skill.

## Verification

- [ ] Field-group REST visibility confirmed before expecting `acf` data.
- [ ] Every write read back and matched.
- [ ] Schema changes flagged for the owner, not executed.

## Pitfalls

- Expecting `acf` data on a group that never had Show in REST API enabled.
- Hand-editing `_`-prefixed serialized field meta and corrupting the site.
- Treating a 200 response as proof the field changed — read back.
- Assuming ACF custom post types expose the same settings as core post types.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
