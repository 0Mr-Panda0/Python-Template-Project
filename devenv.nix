{ pkgs, ... }:

{
  packages = with pkgs; [
    uv
    just
    ty
    ruff
    pip-audit
  ];

  languages.python = {
    enable = true;
    uv = {
      enable = true;
      sync = {
        enable = true;
        allGroups = true;
      };
    };
  };

  scripts = {
    lint.exec = "uv run ruff check .";
    lint-fix.exec = "uv run ruff check --fix .";
    format.exec = "uv run ruff format .";
    format-check.exec = "uv run ruff format --check .";
    typecheck.exec = "uv run ty check .";
    test.exec = "uv run pytest";
    coverage.exec = "uv run pytest --cov=greetings --cov-report=term-missing --cov-report=lcov:lcov.info --cov-report=html";
    audit.exec = "uv run pip-audit";
    docs.exec = "uv run pdoc src/greetings -o docs_build";
    build.exec = "uv build";
  };

  git-hooks.hooks = {
    ruff.enable = true;
    ruff-format.enable = true;
  };

  enterTest = ''
    uv run pytest
  '';
}
