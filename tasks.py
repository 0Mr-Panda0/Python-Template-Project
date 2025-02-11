from invoke import task


@task
def install(c):
    c.run("python -m pip install --upgrade pip && pip install -r requirements.txt")


@task
def test(c):
    c.run("python -m pytest -vv --cov=greetings test_greetings.py")


@task
def lint(c):
    c.run("pylint --disable=R,C --ignore-patterns=test_.*?py *.py")


@task
def design(c):
    c.run("black *.py")
