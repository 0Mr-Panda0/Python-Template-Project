# Contributing to Python Template Project

Thank you for your interest in contributing to this project!

## Development Setup

### Nix / NixOS Users (Recommended)

This project uses [Devenv](https://devenv.sh) to configure a hermetic developer shell with Python, uv, Ruff, Ty, pytest, and git pre-commit hooks.

1. Ensure Nix flakes are enabled on your machine.
2. Activate the developer shell:
   ```bash
   devenv shell
   ```
   *(Or allow `direnv` with `direnv allow` for automatic activation).*

### Non-Nix Users

1. Install [uv](https://docs.astral.sh/uv/):
   ```bash
   curl -LsSf https://astral.sh/uv/install.sh | sh
   ```
2. Sync all project and development dependencies:
   ```bash
   uv sync --all-groups
   ```

---

## Validation & Workflow Commands

Before submitting a pull request, ensure all validation checks pass:

### Using Just (Recommended)

```bash
# Run all quality and security checks
just check

# Run individual steps
just check-format
just lint
just typecheck
just test
just coverage
just audit
```

### Nix / Devenv

```bash
# Check code formatting without modifying files
devenv shell format-check

# Format files in place
devenv shell format

# Run Ruff linter
devenv shell lint

# Run type checker
devenv shell typecheck

# Run unit tests
devenv shell test

# Run supply chain security audit
devenv shell audit

# Run devenv integration tests and pre-commit hooks
devenv test
```

### Standard uv

```bash
# Check formatting
uv run ruff format --check .

# Format code
uv run ruff format .

# Lint code
uv run ruff check .

# Type check
uv run ty check .

# Run unit tests
uv run pytest

# Audit dependencies for vulnerabilities
uv run pip-audit
```

---

## Pull Request Guidelines

1. **Atomic Commits**: Keep commits focused and logically structured.
2. **Strict Code Quality**: Code must pass `ruff check`, `ruff format --check`, and `ty check`.
3. **Comprehensive Tests**: Add unit tests under `tests/` for any new functionality and maintain high coverage.
4. **Documentation**: Update docstrings and `README.md` for any CLI or API modifications.
