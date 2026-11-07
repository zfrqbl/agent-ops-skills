---
name: wordpress-woocommerce-ops
description: "Use when managing a WooCommerce store: products, orders, customers, stock, coupons, reports over the WooCommerce REST API."
version: 1.0.0
author: Hermes Agent
license: MIT
compatibility: "WooCommerce 3.5+ (wc/v3 REST API, WordPress 6.9+ recommended); agent with bash + https tooling."
metadata:
  hermes:
    tags: [WordPress, WooCommerce, Ecommerce, Orders, Products, REST]
---

# WordPress WooCommerce Ops

Manage a WooCommerce store through its built-in REST API (`wc/v3`): products, orders, customers, stock levels, coupons, and reports, with read-only defaults and verified writes.

## When to Use

- The site runs WooCommerce and the task touches store data: catalog, inventory, orders, customers, coupons.
- Pulling sales or stock reports, syncing product data, or updating order statuses.
- The most-installed ecommerce plugin on WordPress (5M+ active installs) — the store-operations counterpart to the site-level WordPress skills in this repo.

## Prerequisites

- WooCommerce installed with the REST API enabled (on by default; legacy REST API only if the site is old).
- Credentials: a REST API key generated at WooCommerce > Settings > Advanced > REST API — consumer key + consumer secret, scoped Read / Write / Read-Write. From the environment: `WC_URL`, `WC_CONSUMER_KEY`, `WC_CONSUMER_SECRET`. Secrets; never log or echo them. The key is sent as HTTP Basic Auth (consumer key = username, secret = password) over HTTPS.
- The skill talks `wc/v3` endpoints at `{site}/wp-json/wc/v3/`.

## Procedure

### 1. Scope the store and the access level

- Confirm the store URL and that the API key's permission scope matches the task (Read keys cannot write; a Write key on an order is a real power — say which scope you are using).
- Read the API key's user: operations run with that user's roles.

### 2. Read before you write

- List with pagination (`per_page`/`page`): products, orders, customers, coupons. Stop early once the target is found.
- Fetch the single object before changing it; note its `status`, `stock_status`, and any fields the change touches.

### 3. Writes, verified

- Product updates: change only the fields needed (price, stock, status, attributes). `stock_quantity` changes should go through the product update route so WooCommerce keeps its own stock bookkeeping consistent.
- Order status changes are consequential (payment, fulfillment, emails): do them only with the owner's approval unless the order line says otherwise, and after the change GET the order back and confirm `status` and date fields.
- After every write, read the object back. A 200 is not proof the change landed.

### 4. Reports

- Use the `reports` endpoints for sales totals, top sellers, and stock counts rather than summing order lists yourself.

## Output

A store report: what was read (products/orders touched, with ids and statuses), what was written (each with read-back confirmation), and the permission scope used.

## Guardrails

- No price changes, refunds, order cancellations, or customer-data changes without the owner's explicit approval.
- Never log or echo consumer key/secret; HTTPS only.
- Never blind-retry an ambiguous write — read the object back first.
- Read-only by default: no key, no write.

## Verification

- [ ] Permission scope confirmed before any write.
- [ ] Every write read back: status, id, changed field match.
- [ ] Report names the API key scope used.

## Pitfalls

- Using a Read key for a write task and getting a silent 401/403.
- Updating stock via the wrong route and desyncing WooCommerce's stock ledger.
- Changing order status without approval (triggers emails and fulfillment).
- Blind retries after ambiguous sends duplicating orders.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
