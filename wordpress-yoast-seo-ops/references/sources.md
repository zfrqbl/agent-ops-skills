# Sources for the WordPress Yoast SEO Ops skill

Research compiled 7 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste documentation text verbatim.

## Official foundation

- Yoast SEO REST API — developer.yoast.com/customization/apis/rest-api — the /wp-json/yoast/v1/get_head?url= endpoint; complete head output (meta tags, schema.org, OpenGraph) for any URL; raw `json` format available since Yoast 16.7.
- Yoast SEO API overview — developer.yoast.com/customization/apis/overview — the four API surfaces (REST API, Surfaces API, Metadata API, Schema API) and what each is for.
- Yoast SEO REST API endpoint (developer blog) — yoast.com/developer-blog/yoast-seo-rest-api-endpoint — the `yoast_head` field added to WP REST API post/page/taxonomy responses; the GET /wp-json/yoast/v1/get_head?url= response shape {head, status}; disabling via SEO > General > Features.
- Yoast SEO REST API features page — yoast.com/features/rest-api — headless use: prefabricated meta bundle or raw key/value data.

## Context

- Yoast SEO is the most-installed SEO plugin on WordPress (5M+ active installs). This skill complements the repo's content-ops SEO pass (titles, slugs, meta, internal links) when the target site runs Yoast.
