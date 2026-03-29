---
name: miyabi-log-aggregator
description: Log file aggregation and analysis. Use when searching logs, finding errors/warnings, tailing log files, or getting log statistics. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read, Grep
---

# Log Aggregator (7 tools)

Aggregate and analyze log files from configured directories.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `log_sources` | List available log files | - |
| `log_get_recent` | Recent log entries with filtering | `source`, `limit`, `minutes` |
| `log_search` | Search logs for a pattern (case-insensitive) | `query` (required), `source` |
| `log_get_errors` | Error-level log entries | `minutes` |
| `log_get_warnings` | Warning-level log entries | `minutes` |
| `log_tail` | Last N lines from a log file | `source` (required), `lines` |
| `log_stats` | Log file statistics (size, line count, error frequency) | - |

## Usage

```
mcp__miyabi-mcp-bundle__log_sources
mcp__miyabi-mcp-bundle__log_search { "query": "connection refused" }
mcp__miyabi-mcp-bundle__log_get_errors { "minutes": 30 }
mcp__miyabi-mcp-bundle__log_tail { "source": "app.log", "lines": 100 }
```

## When to Use

- Incident investigation: `log_get_errors`, `log_search`
- Monitoring: `log_tail`, `log_get_warnings`
- Capacity planning: `log_stats`
