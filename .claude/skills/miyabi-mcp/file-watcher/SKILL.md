---
name: miyabi-file-watcher
description: File system monitoring and analysis. Use when checking file stats, finding recent changes, searching files by glob pattern, viewing directory trees, comparing files, computing checksums, or finding duplicates. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read, Glob, Grep
---

# File Watcher (10 tools)

Monitor and analyze file system changes and structure.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `file_stats` | File metadata (size, permissions, modified time) | `path` (required) |
| `file_recent_changes` | Recently modified files in a time window | `directory`, `minutes`, `limit`, `pattern` |
| `file_search` | Find files matching glob pattern | `pattern` (required), `directory` |
| `file_tree` | Directory tree structure visualization | `directory`, `depth` (default: 3) |
| `file_compare` | Compare two files (size, timestamps, hash) | `path1` (required), `path2` (required) |
| `file_changes_since` | Files modified after a timestamp | `since` (required, ISO), `directory`, `pattern` |
| `file_read` | Read text file contents safely (max 100KB) | `path` (required), `encoding`, `maxLines` |
| `file_checksum` | Calculate file hash (MD5, SHA256, SHA512) | `path` (required), `algorithm` |
| `file_size_summary` | Directory size breakdown by subdirectory | `directory` |
| `file_duplicates` | Find duplicate files by content hash | `directory`, `pattern` |

## Usage

```
mcp__miyabi-mcp-bundle__file_recent_changes { "directory": "src", "minutes": 60, "pattern": "*.ts" }
mcp__miyabi-mcp-bundle__file_tree { "directory": ".", "depth": 2 }
mcp__miyabi-mcp-bundle__file_checksum { "path": "package.json", "algorithm": "sha256" }
mcp__miyabi-mcp-bundle__file_duplicates { "directory": "src" }
```

## When to Use

- Track changes: `file_recent_changes`, `file_changes_since`
- Project structure: `file_tree`, `file_search`
- Integrity verification: `file_checksum`, `file_compare`
- Disk cleanup: `file_size_summary`, `file_duplicates`
