---
description: Find AINSOF cues that sound like a reference track or link
argument-hint: "[Spotify / YouTube / Apple Music / Deezer link, or artist and title]"
---

Reference: `$1`

Call `search_by_reference` with it. The server resolves the recording through public or authorised metadata and compares a permitted preview clip **by sound**, not by tags.

## What the first reply looks like

Usually `{ ok: false, error: "still_running" }`. That is the search running. Call `search_by_reference` again with the same link — it picks up the search already in progress. Do not report it as a failure and do not fall back to a text search on the first try.

## Links that are not supported

SoundCloud and TikTok cannot be resolved. Ask for the artist and title instead, then pass those to `search_music`.

## What is actually being asked

An AINSOF cue that *sounds like* that reference. Records by other artists cannot be licensed from AINSOF, so a list of them does not answer the request. Everything you return has to come back from the tool.

## Presenting the match

Three cues, each with its album artwork thumbnail, a `listen_link`, and one line naming what carries over from the reference — the tempo, the instrumentation, the way it builds. If the closest match is only a loose fit, say that rather than overselling it.
