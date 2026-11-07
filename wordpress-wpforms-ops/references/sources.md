# Sources for the WordPress WPForms Ops skill

Research compiled 7 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste documentation text verbatim.

## Official foundation

- WPForms REST API and Abilities API Reference — wpforms.com/developers/wpforms-rest-api — WPForms 1.9.9 introduced a REST API built on the WordPress Abilities API; 1.10.2 expanded it with opt-in write support. Read surface: list forms, fetch form configuration, retrieve and search entries, form statistics. Write surface (1.10.2+): create forms, add/update fields, update safe form settings. Abilities exposed at /wp-json/wp-abilities/v1/abilities/{ability}/run and to MCP clients via the official MCP adapter; WordPress application-passwords authentication.
- WPForms Developer Documentation — wpforms.com/developers — entries, fields, notifications, addons, hooks.
- WordPress Abilities API (core, 6.9+) — backed by make.wordpress.org/core (abilities registry with input/output schemas and permission callbacks, auto-exposed over REST and MCP).

## Context

- WPForms is one of the most-installed WordPress form plugins (5M+ active installs). This skill sits beside the repo's WordPress REST API skill (same application-password auth, same read-before-write discipline).
