# Sources for the WordPress WooCommerce Ops skill

Research compiled 7 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste documentation text verbatim.

## Official foundation

- WooCommerce REST API documentation — developer.woocommerce.com/docs/apis/rest-api — the wc/v3 API surface: products, orders, customers, coupons, reports; client setup with consumer key/secret (wp_api=True, version="wc/v3").
- Authentication — developer.woocommerce.com/docs/apis/rest-api/authentication — generating consumer keys at WooCommerce > Settings > Advanced > REST API, Read/Write/Read-Write scopes, HTTP Basic Auth with consumer key as username and secret as password, HTTPS requirement.
- WooCommerce REST API (merchant docs) — woocommerce.com/document/woocommerce-rest-api — merchant-side key management and permissions.

## Context

- WooCommerce is the most-installed ecommerce plugin on WordPress (5M+ active installs). This skill is the store-operations sibling to the site-level WordPress skills in this repo (content-ops, maintenance-ops, publication-flow, rest-api).
