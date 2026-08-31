---
description: Search the AINSOF catalogue by written brief, mood, scene, composer or catalogue number
argument-hint: "[brief — e.g. 'warm acoustic underscore for an interview']"
---

Search AINSOF for: `$1`

Call `search_music` with that as the brief. It handles all of these in one shot:

- **A description** — mood, genre, instrument, energy, scene. "Tense strings under a news package", "Chinese trailer music", "warm acoustic underscore".
- **A name** — a cue, an album, a catalogue number (`AIN-CAT 031`), or a composer. Pass the name straight through as the brief; it is matched against the catalogue directly.
- **Both** — "warm acoustic, something by Amit Weiner" searches on the description and puts that writer's cues first. Do not split it up.

## Presenting results

Show each cue with its album artwork thumbnail (`album_cover_thumb_url`) beside the title — small, but there. People choose production music partly by how the record looks.

For each: title, album, one line on why it fits, and a `listen_link`. Every preview is the complete piece, watermarked, free to audition.

## If they want more on one cue

`get_track` returns every version and stem: MAIN, SHORT, CUT_15/30/40/60, UNDERSCORE, MUSIC_BED, minus-mixes (`NO_DRUM_PERCUSSION`, `NO_VOCAL`, …) and stems (`STEM_GUITARS`, `STEM_STRINGS`, …). Version names have to be exact — a bare stem name without the `STEM_` prefix addresses nothing.

## The one hard rule

Never say AINSOF does not have something until you have passed its name to a tool and been told so. A mood search coming back thin is not evidence that a named cue is missing.
