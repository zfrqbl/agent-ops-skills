---
name: wordpress-wpforms-ops
description: "Use when managing WPForms on a WordPress site: list forms, read entries, pull form statistics, and (with write access) create forms and update fields via the REST API."
version: 1.0.0
author: Hermes Agent
license: MIT
compatibility: "WPForms 1.9.9+ (REST/Abilities API; write needs 1.10.2+ and opt-in) on WordPress 6.9+; agent with bash + https tooling."
metadata:
  hermes:
    tags: [WordPress, WPForms, Forms, Entries, REST, Abilities]
---

# WordPress WPForms Ops

Manage WPForms through its REST API: list forms and form configuration, read and search entries, pull form statistics, and — once write access is enabled — create forms, add or update fields, and update safe form settings. WPForms is one of the most-installed form plugins on WordPress (5M+ active installs).

## When to Use

- The site runs WPForms and the task is forms or their submissions: what forms exist, what an entry contains, how many submissions a form received.
- Auditing entries (leads, orders, registrations) or exporting them to another system.
- Creating a new form or adding fields, when write access is enabled and the owner asked for it.

## Prerequisites

- WPForms 1.9.9+ (REST API built on the WordPress Abilities API). Write operations additionally need 1.10.2+ with write support opt-in enabled.
- Auth: WordPress application password from the environment (`WP_URL`, `WP_USER`, `WP_APP_PASSWORD`; secret, never logged or echoed). The REST API is exposed at `/wp-json/wp-abilities/v1/abilities/{ability}/run` and via MCP through the official MCP adapter.

## Procedure

### 1. Confirm plugin version and access

- WPForms 1.9.9 introduced read abilities (list forms, fetch form configuration, retrieve/search entries, form statistics); 1.10.2 added opt-in write (create form, add/update fields, update safe settings). Check the version and whether write is enabled before promising a write.

### 2. Read

- List forms and their configuration; retrieve and search entries; pull statistics. Filter to what the task needs — entries can be large.
- Keep personal data in entries inside the workflow; never paste entry contents into chat or logs unnecessarily.

### 3. Write (only when enabled and asked)

- Create forms, add/update fields, update safe form settings via the write abilities. Field structure changes are UI-sensitive — match existing form conventions.
- After a create, read the form back and confirm id, name, and fields.

## Output

A forms report: forms enumerated, entries searched/retrieved (counts and relevant values), statistics pulled, and each write confirmed by read-back.

## Guardrails

- No writes unless the owner asked for the form/field change — form structure is user-visible and often feeds downstream systems.
- Never export or dump entry personal data beyond what the task needs.
- No publishing from this skill; form changes go live only with the owner's go-ahead.

## Verification

- [ ] Version checked; write operations only with write access confirmed.
- [ ] Writes read back (id, name, fields).
- [ ] Entry data handled minimally.

## Pitfalls

- Assuming write abilities exist on a read-only install (pre-1.10.2 or opt-out).
- Treating the plugin's Abilities-API paths as the old WPForms hooks; the REST surface is the Abilities API.
- Copying large entry payloads into logs or chat.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
