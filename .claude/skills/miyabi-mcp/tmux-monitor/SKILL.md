---
name: miyabi-tmux-monitor
description: Tmux session and pane monitoring. Use when listing tmux sessions, sending keys to panes, capturing terminal output, searching pane content, checking if panes are busy, or getting session info. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Tmux Monitor (10 tools)

Monitor and interact with tmux sessions, windows, and panes.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `tmux_list_sessions` | List all sessions with window count and status | - |
| `tmux_list_windows` | List windows in a session | `session` (optional) |
| `tmux_list_panes` | List panes with dimensions and commands | `session` (optional) |
| `tmux_send_keys` | Send keystrokes/text to a pane | `target` (required), `keys` (required) |
| `tmux_pane_capture` | Capture terminal output from a pane | `target`, `lines` |
| `tmux_pane_search` | Search pane content for a pattern | `pattern` (required), `target` |
| `tmux_pane_tail` | Get last N lines from pane output | `target`, `lines` |
| `tmux_pane_is_busy` | Check if pane is running a command | `target` |
| `tmux_pane_current_command` | Get currently running command in a pane | `target` |
| `tmux_session_info` | Detailed session info with creation time | `session` (required) |

## Usage

```
mcp__miyabi-mcp-bundle__tmux_list_sessions
mcp__miyabi-mcp-bundle__tmux_send_keys { "target": "main:0.0", "keys": "npm test" }
mcp__miyabi-mcp-bundle__tmux_pane_capture { "target": "main:0.0", "lines": 50 }
mcp__miyabi-mcp-bundle__tmux_pane_search { "pattern": "ERROR" }
```

## When to Use

- Multi-agent orchestration: manage parallel terminal sessions
- Monitoring long-running processes: `tmux_pane_is_busy`, `tmux_pane_tail`
- Automation: `tmux_send_keys` to control remote processes
- Debugging: `tmux_pane_capture`, `tmux_pane_search`
