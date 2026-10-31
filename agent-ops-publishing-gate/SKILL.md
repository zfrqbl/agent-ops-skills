---
name: agent-ops-publishing-gate
description: "Use when publishing content. Review first, then publish."
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [Publishing, Review, Approval, Content, Website]
---

# Review-First Publishing Gate

Publish content only on the owner's explicit approval word. Draft first, review second, publish third, verify fourth.

## When to Use

- Publishing essays, notes, blog posts, or social posts for an owner who wants to see and approve the piece first.
- Any workflow where the published voice must match the owner's established style.

## Procedure

### 1. Draft in the owner's voice

- Write the piece following the owner's established voice rules (tone, length, structure).
- Include title candidates and the exact approval word in the review request.

### 2. Send for review

- Deliver the draft with: title candidates, where it will be published, planned date, and the exact word that means approve.
- Ask explicitly; do not assume silence is consent.

### 3. Publish only on the approval word

- Treat as approvals: "publish it directly", "take it live", "approved", "go".
- Treat as NOT approvals: "looks good", "nice", comments without the approval word, and silence.
- Honor any dates the owner gives. If a date changes, update the schedule and say so.

### 4. Verify the live artifact

- After publishing, verify before reporting success: HTTP 200 on the URL, correct metadata, feed entries present.
- Update discovery surfaces: sitemap, feed, index.

### 5. Archive the paper trail

- Keep the review copy archived with the approval, so every published piece has a record of consent.

## Guardrails

- No publication without the explicit approval word. Ambiguous praise is not approval.
- No fabricated verification: a live URL is claimed only after a real fetch returned the expected artifact.
- No subverting the gate through a different channel (publishing to another platform because the primary one was not approved).
- Dates the owner gives are honored; changing them requires telling the owner.
- Drafts that fail the owner's voice rules are fixed, not published.

## Output

A published artifact with a verified URL, or a draft awaiting the approval word.

## Verification

- [ ] Approval word present in the owner's message before any publication.
- [ ] Live artifact fetched and checked (status, metadata, feed).
- [ ] Discovery surfaces updated.
- [ ] Review copy plus approval archived.

## Pitfalls

- Treating "looks good" or a like as approval.
- Reporting success from the publish API's exit code without fetching the live URL.
- Silently letting an approved date slip without telling the owner.
