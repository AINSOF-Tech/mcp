# AINSOF is a remote MCP server: the real implementation is hosted at
# https://mcp.ainsof.io and speaks Streamable HTTP with no key required.
#
# This image exists so that hosts and registries which expect a locally started,
# stdio-speaking process can still reach it. It starts mcp-remote, which bridges
# stdio to the hosted endpoint and forwards tools/list and every tool call
# unchanged. The tool surface it exposes is exactly the hosted one — 12 tools.

FROM node:22-alpine

WORKDIR /app
ENV MCP_ENDPOINT=https://mcp.ainsof.io

# Vendor the bridge into the image so startup does not depend on a package fetch.
RUN npm i --omit=dev --no-audit --no-fund mcp-remote@latest

ENTRYPOINT ["npx", "--no-install", "mcp-remote", "https://mcp.ainsof.io"]
