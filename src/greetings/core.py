"""Core greetings functionality."""


class Greeter:
    """A simple greeter class."""

    def __init__(self, name: str) -> None:
        self.name = name

    def greet(self) -> str:
        """Return an informal greeting."""
        return f"Hello, {self.name}!"

    def greet_formal(self) -> str:
        """Return a formal greeting."""
        return f"Good day, {self.name}."
