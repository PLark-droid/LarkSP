---
name: miyabi-generator-tools
description: UUID, random number, hash, and password generation. Use when generating UUIDs, random values, hashing strings, or creating secure passwords. Powered by miyabi-mcp-bundle.
allowed-tools: Bash
---

# Generator Tools (4 tools)

Generate UUIDs, random numbers, hashes, and passwords.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `gen_uuid` | Generate UUID (v1 time-based or v4 random) | `version` (1 or 4, default: 4), `count` (max 100) |
| `gen_random` | Generate random integers or floats | `min` (default: 0), `max` (default: 100), `count` (max 1000), `type` (integer/float) |
| `gen_hash` | Hash a string (MD5, SHA1, SHA256, SHA512) | `input` (required), `algorithm` (default: sha256), `encoding` (hex/base64) |
| `gen_password` | Generate secure password | `length`, `uppercase`, `lowercase`, `numbers`, `symbols` |

## Usage

```
mcp__miyabi-mcp-bundle__gen_uuid { "version": 4, "count": 5 }
mcp__miyabi-mcp-bundle__gen_random { "min": 1, "max": 1000, "count": 10, "type": "integer" }
mcp__miyabi-mcp-bundle__gen_hash { "input": "hello world", "algorithm": "sha256", "encoding": "hex" }
mcp__miyabi-mcp-bundle__gen_password { "length": 32 }
```

## When to Use

- Database seeding: `gen_uuid`, `gen_random`
- Data integrity: `gen_hash`
- Security: `gen_password`
- Testing: `gen_random` for test data
