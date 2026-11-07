# Sources for the WordPress ACF Ops skill

Research compiled 7 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste documentation text verbatim.

## Official foundation

- ACF WP REST API Integration — www.advancedcustomfields.com/resources/rest-api/ (fetched 7 Nov 2026) — ACF 5.11+ REST support; ACF field data in the `acf` JSON object of WP REST responses; endpoints for posts/CPTs, users, categories and custom taxonomies; the "Show in REST API" opt-in per field group; GET/OPTIONS/POST request methods with POST requiring authentication; ACF custom post types/taxonomies visible by default under wp/v2 with namespace/controller/visibility settings under ACF > Post Types > Advanced Configuration.
- ACF 5.11 release notes (REST API) — www.advancedcustomfields.com/blog/acf-5-11-release-rest-api/ — when REST support shipped.

## Context

- ACF is among the most-installed WordPress developer plugins (2M+ active installs). This skill sits beside the repo's WordPress REST API skill: ACF values ride on the standard wp/v2 endpoints rather than a separate API.
