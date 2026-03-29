---
name: miyabi-time-tools
description: Timezone conversion, time formatting, and time difference calculation. Use when working with timezones, formatting dates, or calculating duration between dates. Powered by miyabi-mcp-bundle.
allowed-tools: Bash
---

# Time Tools (4 tools)

Timezone-aware time operations: current time, conversion, formatting, and diff.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `time_current` | Current time in any timezone | `timezone` (e.g. Asia/Tokyo), `format` (iso/unix/human) |
| `time_convert` | Convert time between timezones | `time` (required), `from`, `to` (required) |
| `time_format` | Format datetime with custom pattern | `time` (required), `format` (required, e.g. YYYY-MM-DD), `timezone` |
| `time_diff` | Calculate time difference | `start` (required), `end` (default: now), `unit` (seconds/minutes/hours/days/weeks) |

## Usage

```
mcp__miyabi-mcp-bundle__time_current { "timezone": "Asia/Tokyo", "format": "human" }
mcp__miyabi-mcp-bundle__time_convert { "time": "2026-03-29T10:00:00Z", "to": "America/New_York" }
mcp__miyabi-mcp-bundle__time_diff { "start": "2026-01-01", "unit": "days" }
mcp__miyabi-mcp-bundle__time_format { "time": "2026-03-29T10:00:00Z", "format": "YYYY年MM月DD日 HH:mm" }
```

## When to Use

- International coordination: `time_current`, `time_convert`
- Report generation: `time_format`
- Duration calculation: `time_diff`
