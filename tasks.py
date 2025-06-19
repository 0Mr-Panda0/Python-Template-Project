from invoke import task


@task
def manage_dependency(c):
    c.run("uv sync")


@task
def run_tests(c):
    c.run("uv run -m pytest -vv --cov=greetings test_greet.py")


@task
def type_hints_check(c):
    c.run("uv run mypy .")


@task
def lint_and_format_code(c):
    c.run("uv run ruff check .")
    c.run("uv run ruff check --fix .")
    c.run("uv run ruff format .")


@task(pre=[manage_dependency, run_tests, type_hints_check, lint_and_format_code])
def build(c):
    c.run("echo build completed!")
