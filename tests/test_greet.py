"""Unit tests for greetings core logic."""

from greetings.core import Greeter


def test_greet(default_greeter: Greeter) -> None:
    """Test standard informal greeting."""
    assert default_greeter.greet() == "Hello, Panda!"


def test_greet_formal(default_greeter: Greeter) -> None:
    """Test formal greeting."""
    assert default_greeter.greet_formal() == "Good day, Panda."


def test_greet_empty_name() -> None:
    """Test greeting with an empty name."""
    g = Greeter("")
    assert g.greet() == "Hello, !"
    assert g.greet_formal() == "Good day, ."
