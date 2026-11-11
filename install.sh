#!/bin/sh
# Agent Ops Skills installer
#
# Installs skill folders (each a directory containing SKILL.md) into an agent's
# skills directory. Works from a clone of this repo, or standalone via the
# one-liner below (downloads the repo into a temporary directory).
#
# Usage:
#   sh install.sh                    # detect common agent skill dirs, install all skills
#   sh install.sh -d <dir>           # install into an explicit skills directory
#   sh install.sh -s <skill>,<skill> # install only named skills
#   sh install.sh --dry-run          # show what would happen, change nothing
#   sh install.sh --help
#
# One-liner:
#   sh -c "$(curl -fsSL https://github.com/zfrqbl/agent-ops-skills/raw/main/install.sh)"
#
# Idempotent: an already-installed skill directory is left untouched.

set -u

REPO_NAME="agent-ops-skills"
REPO_URL="https://github.com/zfrqbl/agent-ops-skills"
TARBALL_URL="$REPO_URL/archive/refs/heads/main.tar.gz"
RAW_INSTALL_URL="$REPO_URL/raw/main/install.sh"

dry_run=0
target_dir=""
only=""
tmp=""

usage() {
    sed -n '2,/^$/p' "$0" | sed 's/^# \{0,1\}//'
    exit 0
}

default_targets() {
    # <label>|<path>, one per line, only for paths that already exist
    [ -n "${HOME:-}" ] || return 0
    if [ -d "$HOME/.claude/skills" ]; then printf '%s\n' "Claude Code|$HOME/.claude/skills"; fi
    if [ -d "$HOME/.codex/skills" ]; then printf '%s\n' "Codex|$HOME/.codex/skills"; fi
    if [ -d "$HOME/.codex/skill" ]; then printf '%s\n' "Codex|$HOME/.codex/skill"; fi
    if [ -d "$HOME/.cursor/skills" ]; then printf '%s\n' "Cursor|$HOME/.cursor/skills"; fi
    if [ -d "$HOME/.openclaw/skills" ]; then printf '%s\n' "OpenClaw|$HOME/.openclaw/skills"; fi
    if [ -d "$HOME/.hermes/skills" ]; then printf '%s\n' "Hermes|$HOME/.hermes/skills"; fi
    if [ -n "${XDG_CONFIG_HOME:-}" ] && [ -d "$XDG_CONFIG_HOME/agent-skills" ]; then
        printf '%s\n' "Generic|$XDG_CONFIG_HOME/agent-skills"
    elif [ -d "$HOME/.config/agent-skills" ]; then
        printf '%s\n' "Generic|$HOME/.config/agent-skills"
    fi
}

find_skills() {
    # directories under "$1" (default: current directory) that contain a SKILL.md
    search_dir="${1:-.}"
    for d in "$search_dir"/*/; do
        [ -d "$d" ] || continue
        [ -f "$d/SKILL.md" ] && printf '%s\n' "$(basename "$d")"
    done
}

warn() { printf '%s\n' "install: $*" >&2; }
die()  { warn "$*"; exit 1; }

# --- arguments ---
while [ $# -gt 0 ]; do
    case "$1" in
        --help|-h) usage ;;
        --dry-run) dry_run=1; shift ;;
        -d) [ $# -ge 2 ] || die "-d needs a directory argument"
            target_dir="$2"; shift 2 ;;
        -s) [ $# -ge 2 ] || die "-s needs a skill list argument"
            only="$2"; shift 2 ;;
        *) warn "ignoring unknown argument: $1"; shift ;;
    esac
done

# --- locate the source (a clone, or a temporary download) ---
src_dir="$(pwd)"
if [ -z "$(find_skills "$src_dir")" ]; then
    tmp="$(mktemp -d)" || die "could not create a temp directory"
    warn "no skills in $src_dir; downloading $REPO_NAME..."
    if ! (curl -fsSL "$TARBALL_URL" 2>/dev/null | tar xz --strip-components=1 -C "$tmp"); then
        rm -rf "$tmp"
        die "download failed; clone the repo and run: sh install.sh"
    fi
    src_dir="$tmp"
    [ -n "$(find_skills "$src_dir")" ] || { rm -rf "$tmp"; die "no skills found in the download"; }
fi

# --- resolve target directories ---
if [ -n "$target_dir" ]; then
    targets="Custom|$target_dir"
else
    targets="$(default_targets)"
    if [ -z "$targets" ]; then
        warn "no common agent skills directory detected; pass one with -d"
        printf '%s\n' "Common locations:"
        printf '%s\n' "  Claude Code  ~/.claude/skills"
        printf '%s\n' "  Codex        ~/.codex/skills"
        printf '%s\n' "  Cursor       ~/.cursor/skills"
        printf '%s\n' "  OpenClaw     ~/.openclaw/skills"
        printf '%s\n' "  Hermes       ~/.hermes/skills"
        exit 1
    fi
fi

# an explicitly named target directory is created if missing
if [ -n "$target_dir" ] && [ ! -d "$target_dir" ] && [ "$dry_run" -eq 0 ]; then
    mkdir -p "$target_dir" || die "could not create $target_dir"
fi

# --- select skills ---
available="$(find_skills "$src_dir")"
skills=""
if [ -n "$only" ]; then
    for s in $(printf '%s\n' "$only" | tr ',' ' '); do
        for have in $available; do
            [ "$have" = "$s" ] && skills="$skills $s"
        done
    done
else
    skills="$available"
fi
[ -n "$skills" ] || die "no skills matched"

# --- install ---
installed=0
skipped=0
old_ifs="$IFS"
IFS='
'
for entry in $targets; do
    IFS="$old_ifs"
    label="${entry%%|*}"
    dir="${entry#*|}"
    [ -n "$dir" ] || continue
    if [ ! -d "$dir" ]; then
        warn "target directory does not exist, skipping: $dir"
        continue
    fi
    printf '%s\n' "==> $label: $dir"
    for s in $skills; do
        if [ -e "$dir/$s" ]; then
            printf '%s\n' "    skip   $s (already present)"
            skipped=$((skipped + 1))
        elif [ "$dry_run" -eq 1 ]; then
            printf '%s\n' "    would  install $s"
        else
            if cp -R "$src_dir/$s" "$dir/$s"; then
                installed=$((installed + 1))
                printf '%s\n' "    ok     $s"
            else
                warn "failed to install $s into $dir"
            fi
        fi
    done
    IFS='
'
done
IFS="$old_ifs"

# --- summary ---
if [ "$dry_run" -eq 1 ]; then
    printf '%s\n' "Dry run: nothing was changed."
else
    printf '%s\n' "Done: installed=$installed skipped=$skipped."
    printf '%s\n' "Restart your agent session so the skills load, then ask:"
    printf '%s\n' '  "Triage my inbox today."'
fi

[ -n "$tmp" ] && rm -rf "$tmp"
exit 0
