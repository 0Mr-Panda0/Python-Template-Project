class Greeter:
    def __init__(self, name: str) -> None:
        self.name = name

    def greet(self) -> str:
        return f"Hello, {self.name}!"

    def greet_formal(self) -> str:
        return f"Good day, {self.name}."
