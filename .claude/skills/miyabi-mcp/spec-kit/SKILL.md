---
name: miyabi-spec-kit
description: Spec-Driven Development toolkit. Use when initializing specs, creating feature specifications, generating implementation plans, creating task lists, building checklists, or analyzing spec-implementation consistency. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read, Write, Edit
---

# Spec-Kit (10 tools)

Spec-Driven Development: define features formally, plan implementation, track tasks.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `speckit_init` | Initialize Spec-Kit in project (.speckit/) | `path` |
| `speckit_status` | Project status: features, specs, coverage | `path` |
| `speckit_specify` | Create formal specification from description | `feature` (required), `path` |
| `speckit_plan` | Generate implementation plan with dependencies | `feature` (required), `path` |
| `speckit_tasks` | Generate actionable task list from plan | `feature` (required), `path` |
| `speckit_checklist` | Create pre-implementation QA checklist | `feature` (required), `path` |
| `speckit_analyze` | Analyze spec-implementation consistency | `path` |
| `speckit_list_features` | List all features with status | `path` |
| `speckit_validate` | Validate spec completeness | `feature` (required), `path` |
| `speckit_constitution` | Read or update project constitution (principles, constraints) | `path` |

## Usage

```
mcp__miyabi-mcp-bundle__speckit_init { "path": "." }
mcp__miyabi-mcp-bundle__speckit_specify { "feature": "User authentication with JWT" }
mcp__miyabi-mcp-bundle__speckit_plan { "feature": "user-auth" }
mcp__miyabi-mcp-bundle__speckit_tasks { "feature": "user-auth" }
```

## Workflow

1. `speckit_init` → Initialize project
2. `speckit_specify` → Define feature specification
3. `speckit_plan` → Generate implementation plan
4. `speckit_tasks` → Create actionable tasks
5. `speckit_checklist` → QA checklist
6. Implement → Code the feature
7. `speckit_analyze` → Verify spec-implementation match
