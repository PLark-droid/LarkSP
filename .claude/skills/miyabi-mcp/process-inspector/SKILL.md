---
name: miyabi-process-inspector
description: Process monitoring and analysis. Use when inspecting processes by PID, finding resource-heavy processes, viewing process trees, checking open file descriptors, threads, I/O stats, or network ports. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Process Inspector (14 tools)

Monitor and analyze running processes in detail.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `process_info` | Detailed process info by PID | `pid` (required) |
| `process_list` | Running processes with CPU/memory | `sort` (cpu/memory/pid/name), `limit` |
| `process_search` | Find processes by name or command | `query` (required) |
| `process_tree` | Process hierarchy (parent-child) | - |
| `process_file_descriptors` | Open files and sockets for a process | `pid` (required) |
| `process_children` | Child processes of a parent PID | `pid` (required) |
| `process_top` | Top N processes by resource usage | `limit` (default: 10) |
| `process_ports` | Network ports used by a process | `pid` (required) |
| `process_cpu_history` | CPU usage trend for a process | `pid` (required) |
| `process_memory_detail` | Detailed memory breakdown (RSS, virtual) | `pid` (required) |
| `process_threads` | Threads within a process | `pid` (required) |
| `process_io_stats` | Disk I/O statistics (Linux only) | `pid` (required) |
| `process_environment` | Environment variables of a process | `pid` (required) |
| `process_signals` | Send signals to process | `pid` (required), `signal` |

## Usage

```
mcp__miyabi-mcp-bundle__process_search { "query": "node" }
mcp__miyabi-mcp-bundle__process_top { "limit": 5 }
mcp__miyabi-mcp-bundle__process_memory_detail { "pid": 1234 }
mcp__miyabi-mcp-bundle__process_ports { "pid": 1234 }
```

## When to Use

- Performance debugging: `process_top`, `process_cpu_history`
- Memory leak investigation: `process_memory_detail`, `process_file_descriptors`
- Service discovery: `process_search`, `process_ports`
- Process hierarchy analysis: `process_tree`, `process_children`
