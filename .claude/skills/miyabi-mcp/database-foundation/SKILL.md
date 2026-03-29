---
name: miyabi-database-foundation
description: Database operations for SQLite, PostgreSQL, and MySQL. Use when connecting to databases, listing tables, running queries, analyzing query plans, or checking database health. Powered by miyabi-mcp-bundle.
allowed-tools: Bash, Read
---

# Database Foundation (6 tools)

Database operations supporting SQLite, PostgreSQL, and MySQL.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `db_connect` | Test database connection | `type` (required: sqlite/postgresql/mysql), `connection`, `host`, `port`, `database`, `user`, `password` |
| `db_tables` | List all tables with row counts | `type` (required), connection params |
| `db_schema` | Get table schema (columns, types, constraints) | `type` (required), `table` (required), connection params |
| `db_query` | Execute read-only SELECT query (max 100 rows) | `type` (required), `query` (required), `limit`, connection params |
| `db_explain` | Query execution plan for optimization | `type` (required), `query` (required), connection params |
| `db_health` | Database health check (connection, size, stats) | `type` (required), connection params |

## Usage

```
mcp__miyabi-mcp-bundle__db_connect { "type": "sqlite", "connection": "./data.db" }
mcp__miyabi-mcp-bundle__db_tables { "type": "sqlite", "connection": "./data.db" }
mcp__miyabi-mcp-bundle__db_query { "type": "postgresql", "query": "SELECT * FROM users LIMIT 10", "host": "localhost", "database": "myapp" }
mcp__miyabi-mcp-bundle__db_explain { "type": "mysql", "query": "SELECT * FROM orders WHERE status = 'pending'" }
```

## When to Use

- Database exploration: `db_connect`, `db_tables`, `db_schema`
- Data analysis: `db_query`
- Query optimization: `db_explain`
- Health monitoring: `db_health`
