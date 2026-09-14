# Justfile for Python Template Project

default:
  @just --list

sync:
  uv sync --all-groups

format:
  uv run ruff format .
  uv run ruff check --fix .

check-format:
  uv run ruff format --check .

lint:
  uv run ruff check .

typecheck:
  uv run ty check .

test:
  uv run pytest

coverage:
  uv run pytest --cov=greetings --cov-report=term-missing --cov-report=lcov:lcov.info --cov-report=html

audit:
  uv run pip-audit

docs:
  uv run pdoc src/greetings -o docs_build

# Run all quality and safety checks without mutating code
check: check-format lint typecheck test audit

build: check
  uv build

clean:
  rm -rf dist build .pytest_cache .ruff_cache htmlcov .coverage lcov.info docs_build
