# Contributing

## Setup

Follow the [Getting Started](README.md#getting-started) section for your environment.

## Workflow

Before submitting a PR, make sure all checks pass:

```bash
devenv shell lint
devenv shell typecheck
devenv shell test
```

## Style

- Formatter: `ruff format`
- Linter: `ruff check`
- Type checker: `ty`

All three are enforced in CI and via pre-commit hooks.
