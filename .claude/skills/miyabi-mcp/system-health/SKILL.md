---
name: miyabi-system-health
description: Comprehensive system health check. Use when running full diagnostics on Git, GitHub API, system resources, and MCP server status. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# System Health (1 tool)

Run a comprehensive system-wide health check.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `health_check` | Full health check: Git, GitHub API, system resources, MCP status | - |

## Usage

```
mcp__miyabi-mcp-bundle__health_check
```

## What It Checks

- **Git**: repository status, remote connectivity
- **GitHub API**: authentication, rate limits
- **System Resources**: CPU, memory, disk
- **MCP**: server connection status
- **Network**: internet connectivity

## When to Use

- Start of session: verify all systems operational
- After configuration changes: validate setup
- Debugging: identify which subsystem has issues
