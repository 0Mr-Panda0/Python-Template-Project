from greetings.core import Greeter

if __name__ == "__main__":
    name = input("Enter your name: ")
    greeter = Greeter(name)
    print(greeter.greet())
    print(greeter.greet_formal())
