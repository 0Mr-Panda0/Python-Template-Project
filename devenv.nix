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
      sync = {
        enable = true;
        allGroups = true;
      };
    };
  };

  scripts = {
    lint.exec = "uv run ruff check . && uv run ruff format .";
    typecheck.exec = "uv run ty check .";
    test.exec = "uv run python -m pytest";
  };

  git-hooks.hooks = {
    ruff.enable = true;
    ruff-format.enable = true;
  };
}
