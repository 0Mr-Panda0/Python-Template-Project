"""Command-line interface for greetings."""

import argparse
import sys
from collections.abc import Sequence

from greetings import __version__
from greetings.core import Greeter


def parse_args(args: Sequence[str] | None = None) -> argparse.Namespace:
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser(
        prog="greetings",
        description="A friendly greeting CLI application.",
    )
    parser.add_argument(
        "-n",
        "--name",
        type=str,
        default="World",
        help="The name of the person to greet (default: World)",
    )
    parser.add_argument(
        "-f",
        "--formal",
        action="store_true",
        help="Use formal greeting style",
    )
    parser.add_argument(
        "-v",
        "--version",
        action="version",
        version=f"%(prog)s {__version__}",
    )
    return parser.parse_args(args)


def main(args: Sequence[str] | None = None) -> int:
    """Entrypoint for the greetings CLI."""
    parsed = parse_args(args)
    greeter = Greeter(parsed.name)
    if parsed.formal:
        print(greeter.greet_formal())
    else:
        print(greeter.greet())
    return 0


if __name__ == "__main__":
    sys.exit(main())
