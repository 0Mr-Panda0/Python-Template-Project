"""Pytest configuration and shared fixtures."""

import pytest

from greetings.core import Greeter


@pytest.fixture
def default_greeter() -> Greeter:
    """Provide a Greeter instance with a default name."""
    return Greeter("Panda")
