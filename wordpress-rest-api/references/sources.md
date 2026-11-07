# Sources for the WordPress REST API skill

Research compiled 7 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste documentation text verbatim.

## Official foundation

- WordPress REST API Handbook — developer.wordpress.org/rest-api/ — what the API is, auth restrictions (public content readable, private/authenticated content gated), the route index at /wp-json, key concepts, the API reference for routes and arguments.
- Using the REST API / Authentication — developer.wordpress.org/rest-api/using-the-rest-api/authentication/ — application passwords as the recommended machine-auth path, Basic Auth over HTTPS, cookie+nonce limited to in-session use.
- Application Passwords integration guide — make.wordpress.org/core/2020/11/05/application-passwords-integration-guide/ — programmatic management of application passwords.

## Cross-references in this repo

- wordpress-publication-flow and wordpress-content-ops name this skill as their REST fallback transport when the MCP adapter or WP-CLI is unavailable.
- WP REST API handbook pagination and 429/Retry-After handling (host-enforced rate limits) inform the "Respect the server" step.
