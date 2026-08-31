---
name: setup
description: Connect and verify the AINSOF MCP server after installing the plugin, and raise the rate limit with a free API key. Use when the AINSOF tools are missing, returning connection errors, or hitting a daily limit.
---

# Setting up AINSOF

The AINSOF server is a remote, authless MCP endpoint: `https://mcp.ainsof.io`. Installing the plugin is normally all it takes — there is no OAuth flow, no account and no key required to start.

## Verify the connection

Check that the AINSOF tools are present. The quickest confirmation is to call `about_ainsof`, which is read-only and returns catalogue, licensing and privacy details. Twelve tools should be available:

`search_music` · `search_by_reference` · `find_soundtrack` · `get_track` · `listen_link` · `cue_sheet` · `analyze_video` · `score_my_video` · `get_upload_link` · `deliver_score` · `about_ainsof` · `feedback`

## If the tools are missing

Add the server directly:

```bash
claude mcp add --transport http ainsof https://mcp.ainsof.io
```

In other hosts:

- **Claude.ai / Claude Desktop** — Settings → Connectors → Add custom connector → `https://mcp.ainsof.io`
- **Cursor** — add to `.cursor/mcp.json` (project) or `~/.cursor/mcp.json` (global):
  ```json
  { "mcpServers": { "ainsof": { "url": "https://mcp.ainsof.io" } } }
  ```
- **ChatGPT** — Developer mode → Connectors → `https://mcp.ainsof.io`

## Rate limits

| Tier | Calls per day |
|---|---|
| No key | 300 |
| With an API key | 1,000 |
| More than that | email info@ainsof.io |

Keys are free. Email **info@ainsof.io**, then send the key as a bearer token:

```bash
claude mcp add --transport http ainsof https://mcp.ainsof.io \
  --header "Authorization: Bearer ain_live_…"
```

## Two replies that are not errors

1. `search_by_reference` returning `{ ok: false, error: "still_running" }` — the search is listening to the reference. Call it again with the same link.
2. `find_soundtrack` erroring without `duration_sec` — that is a missing argument, not an empty catalogue. Supply the length, or use `search_music`.

## Privacy

The server receives only the tool calls sent to it, never the rest of the conversation. Full policy: https://ainsof.io/privacy.html
