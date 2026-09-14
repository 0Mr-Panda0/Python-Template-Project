# Python Template Project

This is a modern Python project template featuring rapid environment provisioning, strict linting, fast type-checking, and seamless integration for both Nix and non-Nix users.

[![CI Pipeline](https://github.com/0Mr-Panda0/Python-Template-Project/actions/workflows/main.yaml/badge.svg)](https://github.com/0Mr-Panda0/Python-Template-Project/actions/workflows/main.yaml)
[![Documentation](https://github.com/0Mr-Panda0/Python-Template-Project/actions/workflows/docs.yml/badge.svg)](https://0mr-panda0.github.io/Python-Template-Project/)
[![License: CC0-1.0](https://img.shields.io/badge/License-CC0_1.0-lightgrey.svg)](https://creativecommons.org/publicdomain/zero/1.0/)
[![Python: >=3.10](https://img.shields.io/badge/Python->=3.10-blue.svg)](https://www.python.org/)

---

## Using this Template

### Option A: Via Copier (Recommended)

Generate a personalized project with interactive configuration prompts:

```bash
uvx copier copy gh:0Mr-Panda0/Python-Template-Project my-project
```

### Option B: Via GitHub & Initialization Script

1. Click the green **"Use this template"** button at the top of the repository to create your new repository.
2. Clone your new repository and run the zero-dependency initializer:

```bash
git clone https://github.com/<your-username>/<your-repo-name>
cd <your-repo-name>
./scripts/init-template.sh
```

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

4. **Optional: Configure `direnv` for automatic activation when entering the directory:**
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
# Windows
winget install --id=astral-sh.uv -e

# macOS / Linux
curl -LsSf https://astral.sh/uv/install.sh | sh
```

3. **Sync all project and developer dependencies:**
```bash
uv sync --all-groups
```

---

## CLI Usage

The template packages a complete command-line interface:

```bash
# Display help and options
uv run greetings --help

# Run with default greeting
uv run greetings

# Greet a specific person
uv run greetings --name Panda

# Use formal greeting
uv run greetings --name Panda --formal

# Check version
uv run greetings --version

# Module execution syntax
uv run python -m greetings
```

---

## Required Tools

| Tool | Purpose |
| :--- | :--- |
| `uv` | Ultra-fast Python package and project manager |
| `hatchling` | Modern PEP 517/518 build backend |
| `ruff` | Extremely fast Python linter and formatter |
| `ty` | Astral's high-performance Python type checker |
| `pytest` | Testing framework |
| `pytest-cov` | Code coverage reporting |
| `pip-audit` | Vulnerability and CVE dependency scanner |
| `pdoc` | Automatic API documentation generator |
| `just` | Command runner |

---

## Devenv Commands (Nix / NixOS Users)

| Command | Description |
| :--- | :--- |
| `devenv shell lint` | Lint code with Ruff |
| `devenv shell lint-fix` | Lint code and apply automatic fixes |
| `devenv shell format` | Format code in place with Ruff |
| `devenv shell format-check` | Check code formatting without mutating files |
| `devenv shell typecheck` | Run type checking with Ty |
| `devenv shell test` | Run unit tests with Pytest |
| `devenv shell coverage` | Generate terminal, LCOV, and HTML coverage reports |
| `devenv shell audit` | Audit dependencies for CVEs with pip-audit |
| `devenv shell docs` | Build API documentation with pdoc |
| `devenv shell build` | Build distributable wheel and sdist with uv |
| `devenv test` | Run devenv integration tests and git hooks |

---

## Just Recipes (All Users)

A [Justfile](Justfile) is included for convenient recipe execution:

| Recipe | Description |
| :--- | :--- |
| `just sync` | Synchronize all dependencies and virtual environment |
| `just format` | Format and fix lint errors with Ruff |
| `just check-format` | Verify code formatting without modifications |
| `just lint` | Run Ruff linter |
| `just typecheck` | Run Ty type checks |
| `just test` | Run Pytest test suite |
| `just coverage` | Run test suite with comprehensive coverage reports |
| `just audit` | Scan installed packages for vulnerabilities with pip-audit |
| `just docs` | Generate HTML API documentation |
| `just check` | Run all verification checks (format, lint, typecheck, test, audit) |
| `just build` | Verify and build wheel and source distribution (`dist/`) |
| `just clean` | Remove caches, coverage files, and build artifacts |

---

## CI/CD Pipelines

This repository includes a production-ready GitHub Actions suite:

### Continuous Integration (`main.yaml`)
Triggered on every push and pull request to `main`:
- **Nix hermetic environment test**: Runs `format-check`, `lint`, `typecheck`, `test`, and `devenv test`.
- **Cross-platform matrix test**: Tests on `ubuntu-latest`, `macos-latest`, and `windows-latest` across Python `3.10`, `3.11`, `3.12`, and `3.13`.
- **Security audit**: Runs `pip-audit` to detect supply chain vulnerabilities.
- **Coverage reporting**: Generates LCOV and HTML reports and uploads them as workflow artifacts.

### Documentation Deployment (`docs.yml`)
Triggered on pushes to `main` affecting Python source or configuration:
- Builds clean HTML API documentation using `pdoc`.
- Automatically deploys the documentation to **GitHub Pages**.

### Automated Releases (`release.yml`)
Triggered upon pushing a version tag (e.g. `git tag v0.1.0 && git push origin v0.1.0`):
- Builds verified `.whl` and `.tar.gz` distribution packages with `uv build`.
- Computes cryptographic SHA-256 checksums (`SHA256SUMS`).
- Automatically creates a GitHub Release with build assets attached.

---

## Notes

- `.direnv`, `.devenv`, and `.venv` are intentionally excluded from version control.
- `devenv.lock` and `uv.lock` are tracked in Git to guarantee strict environment reproducibility across machines.
- `dist/`, `build/`, `htmlcov/`, and `docs_build/` are ignored build artifacts.
