---
name: miyabi-mcp-tool-discovery
description: MCP tool search and discovery. Use when searching for available MCP tools, listing tool categories, or getting detailed tool information. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# MCP Tool Discovery (3 tools)

Search and discover available MCP tools across all categories.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `mcp_search_tools` | Search tools by name or description | `query`, `category` (prefix filter) |
| `mcp_list_categories` | List all categories with tool counts | - |
| `mcp_get_tool_info` | Detailed tool info with parameters | `tool` (required) |

## Usage

```
mcp__miyabi-mcp-bundle__mcp_list_categories
mcp__miyabi-mcp-bundle__mcp_search_tools { "query": "docker", "category": "docker" }
mcp__miyabi-mcp-bundle__mcp_get_tool_info { "tool": "git_blame" }
```

## When to Use

- Tool discovery: find the right tool for a task
- Self-documentation: get parameter details for any tool
- Category overview: understand available capabilities
