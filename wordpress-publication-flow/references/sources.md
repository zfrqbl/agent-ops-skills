# Sources for the WordPress Publication Flow skill

Research compiled 1 Nov 2026 for the agent-ops-skills repo. Use these for facts, links, and capability lists. Write original procedure text — never paste Automattic or community skill text verbatim (plagiarism risk; uniqueness is a stated requirement for this skill set).

## Official foundation

- WordPress MCP Adapter — github.com/WordPress/mcp-adapter and wordpress.org/plugins/mcp-adapter/ — the plugin that turns WordPress "Abilities" into MCP tools. Layered access pattern this skill's procedure mirrors: discover abilities, get ability info, execute ability. Introduction + install/security guidance: developer.wordpress.org/news/2026/02/from-abilities-to-ai-agents-introducing-the-wordpress-mcp-adapter
- Abilities API (WordPress 6.9) — make.wordpress.org/core/2025/11/10/abilities-api-in-wordpress-6-9/ and developer.wordpress.org/news/2025/11/introducing-the-wordpress-abilities-api/ — typed input/output schemas with permission callbacks; the mechanism behind role-respecting writes.
- WordPress.com product MCP — developer.wordpress.com/docs/mcp — write operations (draft, edit, publish) run with user approval and respect existing roles and permissions; the approval-first model this skill extends to the site owner's explicit go word.

## Model and uniqueness checks

- Automattic/build-with-wordpress — github.com/Automattic/build-with-wordpress — canonical published agent-skills source (folder + SKILL.md convention, like this repo). Its skills are Automattic's property; use only as a format/pattern reference, never as copy source.
- Automattic MCP prompt-examples library (linked from developer.wordpress.com/docs/mcp) — prompt patterns for content phases; paraphrase, do not lift.
- mcpservers.org Agent Skills library (including Automattic's published skills: publication, plugin submission and release, verification) — check here that we do not duplicate an existing published skill before shipping a new one.

## Capability checklists (feature mines, not copy sources)

- Royal MCP (wordpress.org, OAuth 2.0, 170+ tools) — a broad site-ops feature checklist.
- miniOrange Secure MCP Server (wordpress.org) — governance features worth mirroring in guardrails: per-tool on/off, role-based AI identities, DLP, prompt-injection detection.
- docdyhr/mcp-wordpress — actively maintained standalone server; modern implementation reference.
- InstaWP @instaWp/mcp-wp — hosted multi-site patterns.
- Standards: modelcontextprotocol.io (tools/resources/prompts spec) and the Anthropic Agent Skills open standard.
