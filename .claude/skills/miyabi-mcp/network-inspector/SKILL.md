---
name: miyabi-network-inspector
description: Network diagnostics and monitoring. Use when checking network interfaces, connections, ports, DNS, SSL certificates, ping, traceroute, WiFi, or bandwidth. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Network Inspector (15 tools)

Comprehensive network diagnostics and monitoring.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `network_interfaces` | Network interfaces with IP, MAC, status | - |
| `network_connections` | Active TCP/UDP connections | - |
| `network_listening_ports` | Ports services are listening on | `protocol` (tcp/udp/all) |
| `network_stats` | Network I/O: bytes, packets, errors per interface | - |
| `network_gateway` | Default gateway IP and interface | - |
| `network_ping` | Ping a host for connectivity/latency | `host` (required), `count` |
| `network_bandwidth` | Current bandwidth usage per interface | - |
| `network_dns_lookup` | Resolve hostname to IP (IPv4/IPv6) | `hostname` (required) |
| `network_port_check` | Check if TCP port is open on remote host | `host` (required), `port` (required) |
| `network_public_ip` | Your public IP address | - |
| `network_wifi_info` | WiFi SSID, signal strength, channel | - |
| `network_route_table` | IP routing table | - |
| `network_ssl_check` | SSL/TLS certificate check (expiry, issuer) | `host` (required), `port` |
| `network_traceroute` | Trace network path to host | `host` (required), `maxHops` |
| `network_http_check` | HTTP endpoint health check | `url` (required) |

## Usage

```
mcp__miyabi-mcp-bundle__network_ping { "host": "google.com", "count": 4 }
mcp__miyabi-mcp-bundle__network_ssl_check { "host": "example.com" }
mcp__miyabi-mcp-bundle__network_port_check { "host": "localhost", "port": 3000 }
mcp__miyabi-mcp-bundle__network_dns_lookup { "hostname": "api.example.com" }
```

## When to Use

- Connectivity issues: `network_ping`, `network_dns_lookup`, `network_traceroute`
- Port conflicts: `network_listening_ports`, `network_port_check`
- SSL monitoring: `network_ssl_check`
- Network debugging: `network_connections`, `network_route_table`
