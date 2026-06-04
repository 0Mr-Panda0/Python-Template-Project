import pytest

from greetings import Greeter


@pytest.fixture
def greeter() -> Greeter:
    return Greeter("Panda")


def test_greet(greeter: Greeter) -> None:
    assert greeter.greet() == "Hello, Panda!"


def test_greet_formal(greeter: Greeter) -> None:
    assert greeter.greet_formal() == "Good day, Panda."


def test_greet_empty_name() -> None:
    g = Greeter("")
    assert g.greet() == "Hello, !"
