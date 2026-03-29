---
name: miyabi-calculator-tools
description: Math expression evaluation and unit conversion. Use when calculating math expressions, converting units (length, weight, temperature), or computing statistics. Powered by miyabi-mcp-bundle.
allowed-tools: Bash
---

# Calculator Tools (3 tools)

Safe math evaluation, unit conversion, and statistics.

## Available Tools

| Tool | Description | Key Parameters |
|------|-------------|----------------|
| `calc_expression` | Evaluate math expression (sqrt, sin, cos, PI) | `expression` (required), `precision` (default: 10) |
| `calc_unit_convert` | Convert between units | `value` (required), `from` (required), `to` (required) |
| `calc_statistics` | Compute statistics on a dataset | `data` (required), `operations` |

## Usage

```
mcp__miyabi-mcp-bundle__calc_expression { "expression": "sqrt(16) + sin(PI/2)", "precision": 5 }
mcp__miyabi-mcp-bundle__calc_unit_convert { "value": 100, "from": "km", "to": "miles" }
mcp__miyabi-mcp-bundle__calc_unit_convert { "value": 37.5, "from": "celsius", "to": "fahrenheit" }
```

## Supported Units

- **Length**: km, miles, m, ft, in, cm, mm
- **Weight**: kg, lb, oz, g
- **Temperature**: celsius, fahrenheit, kelvin
- **Volume**: l, gal, ml, fl_oz
- **Speed**: km/h, mph, m/s
