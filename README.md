# Python Template Project

This is a modern Python project template featuring rapid environment provisioning, strict linting, type-checking, and seamless integration for both Nix and non-Nix users.

[![CI Pipeline](https://github.com/0Mr-Panda0/Python-Template-Project/actions/workflows/main.yaml/badge.svg)](https://github.com/0Mr-Panda0/Python-Template-Project/actions/workflows/main.yaml)

---

## Getting Started

### Nix / NixOS Users

1. **Clone the repository:**
```bash
   git clone https://github.com/0Mr-Panda0/Python-Template-Project
   cd Python-Template-Project
```

2. **Enable experimental features in your `configuration.nix` (if you haven't already):**
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

3. **Activate the developer environment:**
```bash
devenv shell
```

4. **Optional: Configure `direnv` for automatic activation when entering the project directory:**
```bash
echo "use devenv" > .envrc
   direnv allow
```

### General Users (Non-NixOS)

1. **Clone the repository:**
```bash
   git clone https://github.com/0Mr-Panda0/Python-Template-Project
   cd Python-Template-Project
```

2. **Install uv:**
```bash
   winget install --id=astral-sh.uv -e  # Windows
   curl -LsSf https://astral.sh/uv/install.sh | sh  # macOS/Linux
```

3. **Install and sync dependencies:**
```bash
   uv sync
```


## Required Tools

|     Tool     |                Purpose             |
| ------------ | ---------------------------------- |
| `uv`         | Python package and project manager |
| `ruff`       | Linter and formatter               |
| `ty`         | Type checker                       |
| `pytest`     | Testing framework                  |
| `pytest-cov` | Test coverage reports              |

## Devenv Commands (Nix / NixOS Users)

| Command                  | Description                      |
| ------------------------ | -------------------------------- |
| `devenv shell lint`      | Lint and format code with ruff   |
| `devenv shell typecheck` | Run type checks with ty          |
| `devenv shell test`      | Run tests with pytest            |

## Normal Commands

| Command                                                                       | Description                      |
| ----------------------------------------------------------------------------- | -------------------------------- |
| `uvx run ruff check . && uvx run ruff check --fix . && uvx run ruff format .` | Lint and format code with ruff   |
| `uvx run ty check .`                                                          | Run type checks with ty          |
| `uvx run python -m pytest -vv --cov=greetings test_greet.py`                  | Run tests with pytest            |

## CI Pipeline

This project uses GitHub Actions for continuous integration. The pipeline is triggered on every push and pull request to `main` and runs the following steps in order:

- Linting and formatting via `devenv shell lint`
- Type checking via `devenv shell typecheck`
- Tests via `devenv shell test`

Tools used in CI: `uv`, `ruff` and `ty` — each installed via their official GitHub Actions or uv tooling.

## Notes

- `.direnv`, `.devenv`, and `.venv` are intentionally excluded from version control.
- `devenv.lock` and `uv.lock` are tracked in Git to guarantee strict environment reproducibility across machines.
