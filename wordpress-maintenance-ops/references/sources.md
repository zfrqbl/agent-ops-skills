# Sources for the WordPress Maintenance Ops skill

Research compiled 1 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste Automattic or community skill text verbatim (uniqueness is a stated requirement for this skill set).

## Official foundation

- WordPress MCP Adapter — github.com/WordPress/mcp-adapter — installable plugin turning "Abilities" into MCP tools. The core abilities (get site info, get user info, get environment info) are the read-only baseline this skill's step 1 uses; security guidance: developer.wordpress.org/news/2026/02/from-abilities-to-ai-agents-introducing-the-wordpress-mcp-adapter
- Abilities API (WordPress 6.9) — make.wordpress.org/core/2025/11/10/abilities-api-in-wordpress-6-9/ — typed schemas + permission callbacks; why the agent's write surface stays capability-scoped.
- WordPress Application Passwords (REST API docs) — the revocable, per-user credential model this skill's access hygiene step relies on.

## Governance references

- miniOrange Secure MCP Server — per-tool on/off control, role-based AI identities, DLP rules, prompt-injection detection. The source of our guardrail pattern: least-privilege identities for agents, no admin-scope credentials.
- Automattic/build-with-wordpress — github.com/Automattic/build-with-wordpress — Studio runtime and wp_cli wiring; a reference for how update/health operations are packaged, not a copy source.

## Checklists and comparisons (feature mines)

- wp-umbrella.com/blog/best-wordpress-mcp-servers-2026-7-ranked-2-to-avoid — uptime/backup-focused comparison; checklist inspiration for health and backup steps.
- instawp.com/best-wordpress-mcp-servers-compared — hosted multi-site patterns.
- Royal MCP (170+ tools) — broad site-ops tool list to mine for missing health checks.
- Stale and archived, do not adopt: mcp-wp/ai-command (archived December 2025), emzimmer/server-wp-mcp (no updates since January 2025) — the kind of signal this skill's hygiene step flags.
- Standards: modelcontextprotocol.io — the tool/resources/prompts spec the adapter implements.
