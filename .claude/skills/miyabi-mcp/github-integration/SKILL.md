---
name: miyabi-github-integration
description: GitHub API integration for issues, pull requests, labels, milestones, workflows, releases, branches, and reviews. Use when managing GitHub resources programmatically. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# GitHub Integration (21 tools)

Full GitHub API integration for repository management.

## Issue Management

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `github_list_issues` | List issues with filters | `state`, `labels`, `per_page` |
| `github_get_issue` | Full issue details | `issue_number` (required) |
| `github_create_issue` | Create a new issue | `title` (required), `body`, `labels` |
| `github_update_issue` | Update issue title/body/state | `issue_number` (required), `title`, `body`, `state` |
| `github_add_comment` | Add comment to issue/PR | `issue_number` (required), `body` (required) |

## Pull Request Management

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `github_list_prs` | List PRs with state filter | `state`, `per_page` |
| `github_get_pr` | PR details with diff stats | `pull_number` (required) |
| `github_create_pr` | Create PR from branch | `title` (required), `head` (required), `base`, `body` |
| `github_merge_pr` | Merge PR (merge/squash/rebase) | `pull_number` (required), `merge_method` |

## Review Management

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `github_list_pr_reviews` | List reviews on a PR | `pull_number` (required) |
| `github_create_review` | Create PR review | `pull_number` (required), `body`, `event`, `comments` |
| `github_submit_review` | Submit pending review | `pull_number` (required), `review_id` (required), `event` (required) |

## Repository Management

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `github_list_labels` | All repository labels | - |
| `github_add_labels` | Add labels to issue/PR | `issue_number` (required), `labels` (required) |
| `github_list_milestones` | Milestones for release tracking | `state` |
| `github_list_workflows` | GitHub Actions workflows | `per_page` |
| `github_repo_info` | Repository metadata (stars, forks) | - |
| `github_list_releases` | Releases with tags and notes | `per_page` |
| `github_list_branches` | Branches with protection status | `per_page` |
| `github_compare_commits` | Compare branches/commits | `base` (required), `head` (required) |

## Usage

```
mcp__miyabi-mcp-bundle__github_list_issues { "state": "open", "labels": "type:bug" }
mcp__miyabi-mcp-bundle__github_create_issue { "title": "Fix login bug", "body": "Details...", "labels": ["type:bug", "priority:P1-High"] }
mcp__miyabi-mcp-bundle__github_create_pr { "title": "Fix auth", "head": "fix/auth", "base": "main" }
mcp__miyabi-mcp-bundle__github_merge_pr { "pull_number": 42, "merge_method": "squash" }
```

## When to Use

- Issue pipeline: `github_create_issue` → `github_add_labels` → `github_update_issue`
- PR workflow: `github_create_pr` → `github_create_review` → `github_merge_pr`
- Release management: `github_list_releases`, `github_compare_commits`
- Project overview: `github_repo_info`, `github_list_milestones`
