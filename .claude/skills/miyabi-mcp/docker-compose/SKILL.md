---
name: miyabi-docker-compose
description: Docker Compose service management. Use when listing Compose services, stopping services, or viewing combined logs. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Docker Compose (4 tools)

Manage multi-container Docker Compose applications.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `compose_ps` | List Compose service status, ports, health | `path`, `all` |
| `compose_up` | Start Compose services | `path`, `detach`, `build` |
| `compose_down` | Stop services, optionally remove volumes | `path`, `volumes`, `removeOrphans` |
| `compose_logs` | Combined logs from Compose services | `path`, `services`, `tail`, `timestamps` |

## Usage

```
mcp__miyabi-mcp-bundle__compose_ps { "path": "./docker-compose.yml" }
mcp__miyabi-mcp-bundle__compose_logs { "services": ["web", "db"], "tail": 50 }
mcp__miyabi-mcp-bundle__compose_down { "volumes": true, "removeOrphans": true }
```

## When to Use

- Service orchestration: `compose_ps`, `compose_up`, `compose_down`
- Multi-service debugging: `compose_logs`
