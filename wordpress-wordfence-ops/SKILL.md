---
name: wordpress-wordfence-ops
description: "Use when checking or acting on WordPress site security with Wordfence: scan results, severity, firewall, blocking, and remediation steps."
version: 1.0.0
author: Hermes Agent
license: MIT
compatibility: "Wordfence (free or premium) on WordPress 6.9+; agent with bash + https tooling; premium API for programmatic scan access."
metadata:
  hermes:
    tags: [WordPress, Wordfence, Security, Scan, Firewall, WAF]
---

# WordPress Wordfence Ops

Work with Wordfence on a WordPress site: run and interpret scans, understand severity levels, check firewall and blocking state, and drive safe remediation. Wordfence is the most-installed security plugin on WordPress (4M+ active installs).

## When to Use

- The site runs Wordfence and the task is security: read scan results, classify findings, confirm firewall/WAF state, review blocks and lockouts.
- After a security alert or a suspected compromise: gather scan evidence and propose a remediation sequence.
- Routine security posture checks as part of the maintenance-ops health pass.

## Prerequisites

- Wordfence installed (free or premium; premium adds scheduling control and Central).
- Reads: scan results and firewall state are available in the admin UI; the Wordfence API (documented under Advanced > Wordfence API) is the programmatic path, typically premium/API-key based, from the environment (`WORDFENCE_API_KEY`; secret, never logged or echoed).
- No agent write path that bypasses the owner: blocking, unblocking, and firewall-rule changes are consequential and need explicit approval.

## Procedure

### 1. Read scan state

- Fetch current scan results and their severity levels: Critical (act immediately), High (as soon as possible), Medium, Low. List what was found, not just the count.
- Confirm whether the last scan ran on schedule (manual scan = one-off; scheduled scan = recurring, alerting on findings).

### 2. Interpret findings

- Classify each finding: known malicious code/backdoor, suspicious URLs, core/plugin/theme changes, admin-user anomalies, option/audit issues.
- Cross-check against the site's own history in the report: a "core file changed" finding during a legit release window is different from one at 3 AM with no deploy record.

### 3. Check firewall and blocking

- Confirm WAF mode (basic vs optimized) and whether learning mode is stuck on. Review active blocks and lockouts — long-lived IP blocks of legit traffic are a real outage risk.

### 4. Propose remediation, act only with approval

- Draft the remediation sequence with evidence: reinstall core/plugin/theme to clear modified files, remove unknown users, rotate application passwords, clean up suspicious options, review firewall rules.
- Execute destructive or site-visible steps (deleting files, blocking IPs, changing users) only with the owner's explicit approval; verify each step by re-scan or re-read.

## Output

A security report: scan status and findings by severity, firewall/blocking state, what was done vs proposed, and evidence-linked remediation steps awaiting approval.

## Guardrails

- No file deletion, user removal, IP blocking, or firewall changes without the owner's explicit approval.
- Never claim a site is clean from one scan; re-scan after remediation and state the verification.
- Don't treat premium/API features as available on free installs — check the license before promising programmatic access.

## Verification

- [ ] Findings reported with severity levels.
- [ ] Remediation steps evidence-linked; destructive steps approved and verified.
- [ ] Final state confirmed by a re-scan or read-back.

## Pitfalls

- Confusing free vs premium/API capabilities.
- Copying scan output verbatim into reports without classification.
- Acting on blocks/lockouts without checking whether legit traffic is affected.
- Claiming "clean" without a post-remediation re-scan.

## Sources

Full source list with links: `references/sources.md`. Write original procedure text; use sources for facts, links, and capability lists only.
