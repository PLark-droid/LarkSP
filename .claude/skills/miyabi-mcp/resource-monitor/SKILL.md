---
name: miyabi-resource-monitor
description: System resource monitoring for CPU, memory, disk, network, battery, and temperature. Use when checking system performance, finding resource hogs, or monitoring system health. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Resource Monitor (10 tools)

Monitor system resources: CPU, memory, disk, processes, and hardware.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `resource_cpu` | CPU usage percentage (overall and per-core) | - |
| `resource_memory` | RAM and swap memory usage | - |
| `resource_disk` | Disk space usage for mounted filesystems | `path` |
| `resource_load` | System load average (1, 5, 15 min) | - |
| `resource_overview` | Comprehensive overview: CPU, memory, disk, top processes | - |
| `resource_processes` | Top processes sorted by CPU or memory | `sort` (cpu/memory), `limit` |
| `resource_uptime` | System uptime and boot timestamp | - |
| `resource_network_stats` | Network interface traffic statistics | - |
| `resource_battery` | Laptop battery status and charge level | - |
| `resource_temperature` | CPU and system temperatures | - |

## Usage

```
mcp__miyabi-mcp-bundle__resource_overview
mcp__miyabi-mcp-bundle__resource_processes { "sort": "memory", "limit": 5 }
mcp__miyabi-mcp-bundle__resource_disk { "path": "/" }
mcp__miyabi-mcp-bundle__resource_cpu
```

## When to Use

- Performance troubleshooting: `resource_overview`, `resource_cpu`
- Memory leak detection: `resource_memory`, `resource_processes`
- Disk space alerts: `resource_disk`
- Hardware monitoring: `resource_temperature`, `resource_battery`
