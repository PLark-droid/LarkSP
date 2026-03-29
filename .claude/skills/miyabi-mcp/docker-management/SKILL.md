---
name: miyabi-docker-management
description: Docker container and image management. Use when listing containers/images, viewing logs, inspecting containers, checking stats, executing commands, or managing container lifecycle (start/stop/restart/build). Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Docker Management (10 tools)

Manage Docker containers and images.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `docker_ps` | List running containers | `all` (include stopped) |
| `docker_images` | List Docker images | `all`, `dangling` |
| `docker_logs` | Container logs | `container` (required), `tail`, `since`, `timestamps` |
| `docker_inspect` | Detailed container/image config | `target` (required), `type` (container/image) |
| `docker_stats` | Live CPU/memory usage | `container`, `noStream` |
| `docker_exec` | Execute command in container | `container` (required), `command` (required), `user` |
| `docker_start` | Start a stopped container | `container` (required) |
| `docker_stop` | Stop a running container | `container` (required), `timeout` |
| `docker_restart` | Restart a container | `container` (required), `timeout` |
| `docker_build` | Build Docker image | `path`, `tag`, `dockerfile`, `noCache` |

## Usage

```
mcp__miyabi-mcp-bundle__docker_ps { "all": true }
mcp__miyabi-mcp-bundle__docker_logs { "container": "web", "tail": 50 }
mcp__miyabi-mcp-bundle__docker_exec { "container": "web", "command": "ls -la /app" }
mcp__miyabi-mcp-bundle__docker_stats { "noStream": true }
```

## When to Use

- Container debugging: `docker_logs`, `docker_exec`, `docker_inspect`
- Resource monitoring: `docker_stats`
- Lifecycle management: `docker_start`, `docker_stop`, `docker_restart`
- Image management: `docker_images`, `docker_build`
