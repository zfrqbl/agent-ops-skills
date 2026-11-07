---
name: wordpress-maintenance-ops
description: "Use when maintaining a WordPress site: updates, health checks, backups, plugin and theme hygiene."
version: 1.1.0
author: Hermes Agent
license: MIT
compatibility: "WordPress 6.9+ (PHP 7.4+); agent with bash + node; WP-CLI for ops workflows."
metadata:
  hermes:
    tags: [WordPress, Maintenance, HealthChecks, Backups, Hygiene]
---

# WordPress Maintenance Ops

Run maintenance passes on a WordPress site through the MCP adapter: read-only health checks by default, backup-verified updates, disciplined plugin and theme hygiene.

## Prerequisites

- A reachable WordPress site (6.9+) with the REST API enabled (default).
- Access via the WordPress MCP adapter (`wp plugin install mcp-adapter --activate`), WP-CLI, or the REST API. WP-CLI is expected for update and backup workflows.
- Credentials from the environment, never inline: `WP_URL`, `WP_USER`, `WP_APP_PASSWORD` (or `WP_REST_USERNAME` / `WP_REST_PASSWORD`). Application passwords are secrets; never log or echo them.

## When to Use

- Routine site health check: uptime, core version, plugins, themes, environment.
- Applying WordPress core, plugin, or theme updates.
- Auditing installed plugins and themes and cleaning up unused ones.
- Verifying that backups exist and can be restored.

## Procedure

### 1. Read-only baseline

- Use the adapter's core abilities (get site info, get user info, get environment info) plus linked WP-CLI or REST to build a full inventory: core version, PHP version, plugin list with versions, theme list, and users with their roles.
- Record the baseline before any write. Step 1 changes nothing.

### 2. Health checks

- Site reachability (uptime probe), latest core/plugin/theme versions versus what is installed, known-vulnerability scan results if the workspace provides one, and disk/database health from the environment ability.
- Degraded items go into the report with a severity tag, not a silent fix.

### 3. Backups before updates

- No update without a backup taken first. Verify the backup is restorable — list its components and sizes; never trust a "backup created" message alone.
- Sequence updates core first, then must-keep plugins, then themes; one at a time, with a health check after each step.
- On a broken update (white screen, plugin error, route 500): restore from the verified backup or roll back the specific change, then re-check the site.

### 4. Plugin and theme hygiene

- Audit: every installed plugin and theme must have a stated purpose on this site. Orphaned items, duplicate-purpose entries, and stale ones (no updates in 12+ months or archived by the author) are removal candidates.
- Remove only with the owner's go-ahead. Deactivate first, verify health, then delete.
- Governance, modeled on the hardened community servers: per-tool on/off control, least-privilege AI identities, and prompt-injection protection on anything the agent touches. The agent's WordPress user is low-privilege and authenticates with an application password.

### 5. Credential and access hygiene

- Use revocable application passwords per agent or integration; delete ones no longer in use. Review user roles on a schedule — no stray admins.

### 6. Report

- Findings with severity, actions taken, actions awaiting approval, backup status, and the date of the next scheduled check.

## Output

A maintenance report: baseline inventory, severity-tagged health findings, updates applied with verification, hygiene recommendations awaiting approval, and a backup-verification result.

## Guardrails

- Read-only by default; writes only when the task requires them and the owner approved that action type.
- No update without a verified backup first.
- Plugin and theme removal only with the owner's explicit go-ahead, deactivate-before-delete.
- Never store or echo credentials; application passwords are secrets.
- Report honestly: an unverified backup is recorded as unverified, never as done.

## Verification

- [ ] Baseline captured before any change.
- [ ] Backup taken and its components verified before the first update.
- [ ] Every update confirmed healthy with a check after each step.
- [ ] Removals approved and deactivation-verified before deletion.
- [ ] Report lists severity-tagged findings and everything still awaiting approval.

## Pitfalls

- Updating without a restorable backup.
- Updating everything in one sweep and losing traceability.
- Deleting plugins before deactivation and a health check.
- Trusting "update successful" without a follow-up health check.
- Leaving agent credentials with admin scope.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
