# Sources for the WordPress Content Ops skill

Research compiled 1 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste Automattic or community skill text verbatim (uniqueness is a stated requirement for this skill set).

## Official foundation

- WordPress.com MCP — developer.wordpress.com/docs/mcp — read-and-write content capabilities (draft, edit, publish with user approval), plus the MCP Tools Reference and prompt-examples library; the capabilities list this skill's content/media steps are modeled on.
- WordPress MCP Adapter — github.com/WordPress/mcp-adapter — discover/get-info/execute pattern for invoking content abilities; search/media features come through the same layered access.
- Abilities API (WordPress 6.9) — make.wordpress.org/core/2025/11/10/abilities-api-in-wordpress-6-9/ — typed input/output schemas; how content writes stay structured and permission-checked.

## Content scope references

- WooCommerce MCP — developer.woocommerce.com/docs/features/mcp — native since WooCommerce 10.3 (October 2025); product/store content becomes MCP-accessible. Use when content work touches products or store data.
- WPVibe MCP and Elementor MCP (by Aguaitech) — page-builder specific content patterns; mine for builder-specific editing steps.
- The map page automattic.ai/mcp — every Automattic product with MCP (WordPress.com, WooCommerce, Jetpack, Pressable, Beeper, Clay, Day One); scope reference for what a given content task can reach.

## Voice and quality references

- Automattic MCP prompt-examples library (via developer.wordpress.com/docs/mcp) — content-phase prompt patterns; paraphrase, never lift.
- Repo cross-references — the agent-ops set's own content skills (blog-article-preflight ideas: word counts, editorial gates, internal links) apply the same quality bar inside WordPress.
- mcpservers.org Agent Skills library — uniqueness check before shipping; verify no existing published skill already covers the same content-ops surface.

## Checklist mines

- Royal MCP (170+ tools) — broad site-ops tool list; mine for content/media tools we want to document in procedure steps.
- docdyhr/mcp-wordpress — actively maintained standalone server; implementation reference for content operations.
- Standards: modelcontextprotocol.io — the tools/resources/prompts spec the adapter implements.
