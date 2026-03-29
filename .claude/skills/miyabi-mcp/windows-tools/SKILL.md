---
name: miyabi-windows-tools
description: Windows service and event log management. Use when checking Windows service status or searching Windows Event Log. Windows only. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Windows Tools (2 tools)

Monitor Windows services and event logs.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `windows_service_status` | Service status, start type, dependencies | `service` |
| `windows_eventlog_search` | Search Windows Event Log | `log` (Application/System/Security), `level`, `source`, `maxEvents` |

## Usage

```
mcp__miyabi-mcp-bundle__windows_service_status { "service": "W3SVC" }
mcp__miyabi-mcp-bundle__windows_eventlog_search { "log": "Application", "level": "Error", "maxEvents": 20 }
```

## When to Use

- Service debugging: `windows_service_status`
- Error investigation: `windows_eventlog_search`
- Note: Windows only - not available on macOS/Linux
