---
description: Score a video with licensed AINSOF music, synced to the cut
argument-hint: "[video URL or file path] [optional: mood or reference]"
---

The user wants music on a video. Take it all the way to a finished, synced score — do not stop at a list of titles.

Target: `$1`
Direction, if they gave any: `$2`

## 1. Measure the cut — never guess it

- Video at a URL → call `analyze_video`. It returns the exact duration, frame rate, whether the file already carries audio, how many shots it holds and how fast it cuts.
- Local file → read the duration yourself:
  ```bash
  ffprobe -v error -show_entries format=duration -of csv=p=0 <file>
  ```

The length is the whole point. A 22-second cut needs a version that resolves at 22 seconds, not a three-minute track faded out.

## 2. Find the music

- A pasted Spotify / YouTube / Apple Music / Deezer link, or a named record → `search_by_reference`. Its first reply is usually `{ ok: false, error: "still_running" }` — that is the search listening to the reference, not a failure. Call it again with the same link.
- A described mood, genre, scene or energy → `find_soundtrack` with `duration_sec` set to the real length.
- A named cue, album, catalogue number or composer → `search_music` with that name as the brief.

## 3. Show three, not ten

Present three cues with their album artwork thumbnails (`album_cover_thumb_url`), one line each on why it fits this cut, and a `listen_link` for each. Previews are complete and watermarked — they can audition freely.

## 4. Score it

Once they pick one:
- Local file → `get_upload_link`, upload, then `score_my_video`.
- Hosted file → `score_my_video` directly.
- Then `deliver_score` for the finished files.

## 5. Close the paperwork

Offer `cue_sheet` for the cue they used — writers, splits, ISRC and publisher, which is what a broadcaster or platform will ask for.

Never invent a track, a title or a track_id. If nothing fits, say so plainly and offer the closest cue with a one-line reason.
