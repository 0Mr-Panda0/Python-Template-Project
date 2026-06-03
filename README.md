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

3. **Install just:**
```bash
   winget install Casey.Just  # Windows
   brew install just           # macOS
```

4. **Install dependencies:**
```bash
   just sync
```

## Required Tools

|     Tool     |                Purpose             |
| ------------ | ---------------------------------- |
| `uv`         | Python package and project manager |
| `ruff`       | Linter and formatter               |
| `ty`         | Type checker                       |
| `just`       | Task runner                        |
| `pytest`     | Testing framework                  |
| `pytest-cov` | Test coverage reports              |

## Justfile Commands

| Command              | Description                      |
| -------------------- | -------------------------------- |
| `just`               | Runs everything (default: build) |
| `just sync`          | Install and sync dependencies    |
| `just lint`          | Lint and format code with ruff   |
| `just typecheck`     | Run type checks with ty          |
| `just test`          | Run tests with pytest            |
| `just build`         | Run all of the above in order    |

## CI Pipeline

This project uses GitHub Actions for continuous integration. The pipeline is triggered on every push and pull request to `main` and runs the following steps in order:

- Dependency installation via `just sync`
- Linting and formatting via `just lint`
- Type checking via `just typecheck`
- Tests via `just test`

Tools used in CI: `uv`, `ruff`, `ty`, and `just` — each installed via their official GitHub Actions or uv tooling.

## Notes

- `.direnv`, `.devenv`, and `.venv` are intentionally excluded from version control.
- `devenv.lock` and `uv.lock` are tracked in Git to guarantee strict environment reproducibility across machines.
