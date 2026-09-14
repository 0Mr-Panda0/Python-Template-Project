"""Unit tests for greetings CLI."""

import pytest

from greetings.cli import main, parse_args


def test_cli_default_args() -> None:
    """Test argument parser with default values."""
    args = parse_args([])
    assert args.name == "World"
    assert args.formal is False


def test_cli_custom_name() -> None:
    """Test argument parser with custom name flag."""
    args = parse_args(["--name", "Alice"])
    assert args.name == "Alice"
    assert args.formal is False


def test_cli_formal_flag() -> None:
    """Test argument parser with formal flag."""
    args = parse_args(["-n", "Bob", "-f"])
    assert args.name == "Bob"
    assert args.formal is True


def test_cli_main_default(capsys: pytest.CaptureFixture[str]) -> None:
    """Test main function execution with default arguments."""
    exit_code = main([])
    captured = capsys.readouterr()
    assert exit_code == 0
    assert captured.out.strip() == "Hello, World!"


def test_cli_main_formal(capsys: pytest.CaptureFixture[str]) -> None:
    """Test main function execution with formal flag."""
    exit_code = main(["--name", "Panda", "--formal"])
    captured = capsys.readouterr()
    assert exit_code == 0
    assert captured.out.strip() == "Good day, Panda."
