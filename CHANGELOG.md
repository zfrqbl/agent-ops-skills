# Changelog

All notable changes to this repo, newest first. Follows [Keep a Changelog](https://keepachangelog.com/) loosely.

## [Unreleased]

### Planned
- Demo screencasts per flagship skill (morning brief, inbox triage, WordPress publication flow).
- Live sample output pages for more skills.

## 2026-11-11

### Added
- `install.sh`: one-command installer that detects common agent skills directories (Claude Code, Codex, Cursor, OpenClaw, Hermes) and copies skill folders in — idempotent, with `-d`, `-s`, and `--dry-run` options.
- `LICENSE` (MIT) matching the license already declared in the README and skill frontmatter.
- `CONTRIBUTING.md`: the six-part skeleton, guardrails requirements, and pull-request process for new skills.
- GitHub issue templates: bug report, feature request, skill request.
- `docs/morning-brief-sample.md`: a redacted sample of the morning brief output shape.

### Changed
- README: badges (stars, forks, license, last commit), one-line install via `install.sh`, live-example link, clearer contributing section.

## 2026-11-09

### Changed
- README rewritten as a landing page: quick start, folder map, one usage example per skill. Repo topics and description refreshed (15 skills).
