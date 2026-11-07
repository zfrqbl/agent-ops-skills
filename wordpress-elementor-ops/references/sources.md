# Sources for the WordPress Elementor Ops skill

Research compiled 7 Nov 2026 for the agent-ops-skills repo. Use for facts, links, and capability lists. Write original procedure text — never paste documentation text verbatim.

## Official foundation

- Elementor developer documentation — developers.elementor.com — Elementor's data architecture: page layouts stored as JSON documents in the `_elementor_data` post meta key; elements as a tree of sections/columns/widgets with `elType`, `id`, `settings`, and `elements`; the "Elementor data is JSON post meta" fact this skill's procedure is built on.
- Elementor documentation — elementor.com/help — free vs pro feature surface, templates, theme builder, and widget library used for the capability framing.
- WordPress.org plugin page — wordpress.org/plugins/elementor/ — install base and general capability context.

## Context

- Elementor is the most-installed WordPress page builder (5M+ active installs). This skill complements the repo's content-ops (Elementor sites need content edits through `_elementor_data`, not the post content field alone) and publication-flow (layout changes go live only through the approval gate).
- Widely used in production; the blank-page-on-invalid-JSON failure mode is the reason for the minimal-edit guardrail.
