---
name: miyabi-sequential-thinking
description: Structured reasoning and thinking chains. Use when recording reasoning steps, creating alternative thinking branches, or summarizing analysis sessions. Powered by miyabi-mcp-bundle.
allowed-tools: Bash
---

# Sequential Thinking (3 tools)

Structured reasoning with thinking chains, branches, and summaries.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `think_step` | Record a reasoning step | `thought` (required), `type` (observation/hypothesis/analysis/conclusion/question), `confidence` (0-1), `sessionId` |
| `think_branch` | Create alternative thinking branch | `sessionId` (required), `branchName` (required), `fromStep` |
| `think_summarize` | Summarize thinking session | `sessionId` (required), `includeAlternatives` |

## Usage

```
mcp__miyabi-mcp-bundle__think_step { "thought": "The error occurs only on POST requests", "type": "observation", "confidence": 0.9 }
mcp__miyabi-mcp-bundle__think_step { "thought": "Could be a CORS middleware issue", "type": "hypothesis", "confidence": 0.6, "sessionId": "abc123" }
mcp__miyabi-mcp-bundle__think_branch { "sessionId": "abc123", "branchName": "auth-theory", "fromStep": 2 }
mcp__miyabi-mcp-bundle__think_summarize { "sessionId": "abc123", "includeAlternatives": true }
```

## Thinking Step Types

| Type | Use Case |
|------|----------|
| `observation` | Facts and data points observed |
| `hypothesis` | Possible explanations to test |
| `analysis` | Evaluation of evidence |
| `conclusion` | Final determination |
| `question` | Open questions to investigate |

## When to Use

- Complex debugging: trace reasoning across multiple hypotheses
- Architecture decisions: evaluate alternatives formally
- Root cause analysis: structured investigation with confidence tracking
