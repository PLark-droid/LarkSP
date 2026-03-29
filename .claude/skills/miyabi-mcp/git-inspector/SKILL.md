---
name: miyabi-git-inspector
description: Git repository inspection and analysis. Use when checking git status, branches, diffs, blame, history, stashes, conflicts, tags, contributors, submodules, LFS, hooks, or worktrees. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read, Grep, Glob
---

# Git Inspector (19 tools)

Comprehensive Git repository inspection using miyabi-mcp-bundle MCP tools.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `git_status` | Working tree status (modified, staged, untracked) | - |
| `git_branch_list` | All local/remote branches with tracking info | - |
| `git_current_branch` | Currently checked out branch name | - |
| `git_log` | Commit history with author, date, message | `limit` (default: 20) |
| `git_worktree_list` | Git worktrees for parallel development | - |
| `git_diff` | Unstaged changes in working directory | `file` (optional) |
| `git_staged_diff` | Changes staged for commit | - |
| `git_remote_list` | Configured remotes with fetch/push URLs | - |
| `git_branch_ahead_behind` | Commits ahead/behind upstream | `branch` (default: current) |
| `git_file_history` | Commit history for a specific file | `file` (required), `limit` |
| `git_stash_list` | All stashed changes with descriptions | - |
| `git_blame` | Who last modified each line of a file | `file` (required), `startLine`, `endLine` |
| `git_show` | Commit details including diff and metadata | `commit` (default: HEAD) |
| `git_tag_list` | Tags with associated commits | - |
| `git_contributors` | Contributors ranked by commit count | `limit` |
| `git_conflicts` | Files with merge conflicts | - |
| `git_submodule_status` | Submodule commit hash and sync state | - |
| `git_lfs_status` | Git LFS tracked files and status | - |
| `git_hooks_list` | Git hooks in .git/hooks directory | - |

## Usage

These tools are available via the miyabi-mcp-bundle MCP server. Invoke them using MCP tool calls:

```
mcp__miyabi-mcp-bundle__git_status
mcp__miyabi-mcp-bundle__git_log { "limit": 10 }
mcp__miyabi-mcp-bundle__git_blame { "file": "src/index.ts", "startLine": 1, "endLine": 50 }
mcp__miyabi-mcp-bundle__git_diff { "file": "README.md" }
```

## When to Use

- Before committing: `git_status`, `git_staged_diff`
- Before push/pull: `git_branch_ahead_behind`
- Debugging: `git_blame`, `git_file_history`
- Release management: `git_tag_list`, `git_contributors`
- Merge resolution: `git_conflicts`
- Parallel development: `git_worktree_list`
