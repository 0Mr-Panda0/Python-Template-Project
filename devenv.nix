{ pkgs, ... }:

{

  packages = with pkgs; [
    uv
    just
    ty
    ruff
  ];

  languages.python = {
    enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };

  scripts = {
    lint.exec = "uv run ruff check . && uv run ruff format .";
    typecheck.exec = "uv run ty check .";
    test.exec = "uv run python -m pytest -vv --cov=greetings test_greet.py";
    build.exec = "lint; typecheck; test";
  };
}
