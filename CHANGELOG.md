# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.1.0] - 2026-09-14

### Added
- Standard modern Python `src/` layout with `src/greetings` and PEP 561 `py.typed` marker.
- Dedicated `tests/` directory with `conftest.py` shared fixtures and full test suite.
- CLI argument parsing via `argparse` (`--name`, `--formal`, `--version`) and `__main__.py` module execution.
- PEP 517/518 build system configuration using `hatchling` in `pyproject.toml`.
- Console script entrypoint `greetings` in `[project.scripts]`.
- Complete dependency groups in `pyproject.toml` (`lint`, `typecheck`, `test`, `audit`, `docs`).
- Hermetic development environment via Nix + Devenv with full script suite.
- Recipe automation via `Justfile` (`check`, `sync`, `lint`, `format`, `typecheck`, `test`, `coverage`, `audit`, `docs`, `build`, `clean`).
- Security auditing with `pip-audit`.
- Documentation generation with `pdoc`.
- Cross-platform CI matrix workflow (Ubuntu, macOS, Windows) across Python 3.10, 3.11, 3.12, and 3.13.
- Automated code coverage reporting and artifact upload in CI.
- Automated release workflow (`.github/workflows/release.yml`) triggered on `v*` tags with wheel and sdist packaging and SHA-256 checksums.
- Automated documentation deployment to GitHub Pages (`.github/workflows/docs.yml`).
- Automated dependency updates via GitHub Dependabot (`.github/dependabot.yml`).
- Developer configurations: `.editorconfig`, `.gitattributes`, `.vscode/settings.json`, and `.vscode/extensions.json`.
- Template instantiation support via `copier.yml` and `scripts/init-template.sh`.
- GitHub issue templates for bug reports and feature requests.

