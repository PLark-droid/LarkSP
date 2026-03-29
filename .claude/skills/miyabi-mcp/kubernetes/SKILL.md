---
name: miyabi-kubernetes
description: Kubernetes cluster monitoring. Use when listing deployments, pods, services, getting pod logs, or describing K8s resources. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Kubernetes (6 tools)

Monitor and inspect Kubernetes cluster resources.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `k8s_get_pods` | List pods with status and restarts | `namespace`, `allNamespaces` |
| `k8s_get_deployments` | List deployments with replica status | `namespace`, `allNamespaces` |
| `k8s_get_services` | List services with types and ports | `namespace`, `allNamespaces` |
| `k8s_logs` | Get pod logs | `pod` (required), `namespace`, `container`, `tail`, `since` |
| `k8s_describe` | Detailed resource info (events, conditions) | `resource` (required), `name` (required), `namespace` |
| `k8s_get_nodes` | List cluster nodes with status | - |

## Usage

```
mcp__miyabi-mcp-bundle__k8s_get_pods { "namespace": "production" }
mcp__miyabi-mcp-bundle__k8s_logs { "pod": "web-abc123", "tail": 100, "since": "1h" }
mcp__miyabi-mcp-bundle__k8s_describe { "resource": "deployment", "name": "web", "namespace": "production" }
mcp__miyabi-mcp-bundle__k8s_get_deployments { "allNamespaces": true }
```

## When to Use

- Pod debugging: `k8s_logs`, `k8s_describe`
- Cluster overview: `k8s_get_pods`, `k8s_get_deployments`, `k8s_get_nodes`
- Service discovery: `k8s_get_services`
