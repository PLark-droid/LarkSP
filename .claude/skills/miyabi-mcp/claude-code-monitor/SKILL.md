---
name: miyabi-claude-code-monitor
description: Claude Code and Claude Desktop monitoring. Use when checking Claude configuration, MCP server status, session info, logs, or background shell processes. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read, Grep
---

# Claude Code Monitor (8 tools)

Monitor Claude Code/Desktop configuration, sessions, and logs.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `claude_config` | Claude Desktop configuration (MCP servers, settings) | - |
| `claude_mcp_status` | MCP server connection status | - |
| `claude_session_info` | Claude Code session details (processes, CPU, memory) | - |
| `claude_logs` | Recent Claude Code logs | `lines` (default: 50) |
| `claude_log_search` | Search Claude logs for patterns | `query` (required) |
| `claude_log_files` | List all Claude Code log files | - |
| `claude_background_shells` | Background shell processes by Claude Code | - |
| `claude_status` | Complete Claude status: config, MCP servers, session, logs | - |

## Usage

```
mcp__miyabi-mcp-bundle__claude_config
mcp__miyabi-mcp-bundle__claude_mcp_status
mcp__miyabi-mcp-bundle__claude_log_search { "query": "error" }
mcp__miyabi-mcp-bundle__claude_logs { "lines": 100 }
```

## When to Use

- MCP debugging: `claude_mcp_status`, `claude_config`
- Performance monitoring: `claude_session_info`
- Error investigation: `claude_log_search`, `claude_logs`
- Session management: `claude_background_shells`
