# Justfile

sync:
  uv sync

test:
  uv run python -m pytest -vv --cov=greetings test_greet.py

typecheck:
  ty check .

lint:
  uv run ruff check .
  uv run ruff check --fix .
  uv run ruff format .

build: sync test typecheck lint
    @echo "Build completed!"
