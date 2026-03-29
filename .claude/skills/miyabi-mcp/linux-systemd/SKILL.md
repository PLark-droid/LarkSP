---
name: miyabi-linux-systemd
description: Linux systemd service management and journal logs. Use when listing systemd units, checking service status, or searching journal logs. Linux only. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Linux Systemd (3 tools)

Manage and monitor Linux systemd services and logs.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `linux_systemd_units` | List systemd units with status | `type` (service/timer/socket/mount/target), `state` (running/failed/inactive) |
| `linux_systemd_status` | Detailed unit status with logs | `unit` (required, e.g. nginx.service) |
| `linux_journal_search` | Search systemd journal logs | `unit`, `priority` (emerg-debug), `since`, `lines` |

## Usage

```
mcp__miyabi-mcp-bundle__linux_systemd_units { "type": "service", "state": "running" }
mcp__miyabi-mcp-bundle__linux_systemd_status { "unit": "nginx.service" }
mcp__miyabi-mcp-bundle__linux_journal_search { "unit": "app.service", "priority": "err", "since": "1h ago" }
```

## When to Use

- Service monitoring: `linux_systemd_units`, `linux_systemd_status`
- Log analysis: `linux_journal_search`
- Note: Linux only - not available on macOS/Windows
