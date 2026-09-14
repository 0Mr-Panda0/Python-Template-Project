#!/usr/bin/env bash
set -euo pipefail

echo "========================================="
echo "   Python Template Project Initializer   "
echo "========================================="

read -rp "Enter new project name (e.g., my-awesome-app): " PROJECT_NAME
read -rp "Enter Python package name (e.g., my_awesome_app): " PACKAGE_NAME
read -rp "Enter project description: " DESCRIPTION
read -rp "Enter author name: " AUTHOR_NAME
read -rp "Enter GitHub username or organization: " GITHUB_USER

if [[ -z "$PROJECT_NAME" || -z "$PACKAGE_NAME" ]]; then
    echo "Error: Project name and package name cannot be empty."
    exit 1
fi

echo "Renaming package directory..."
if [[ -d "src/greetings" && "$PACKAGE_NAME" != "greetings" ]]; then
    mv src/greetings "src/$PACKAGE_NAME"
fi

echo "Updating pyproject.toml..."
sed -i "s/name = \"python-template-project\"/name = \"$PROJECT_NAME\"/g" pyproject.toml
sed -i "s/packages = \[\"src\/greetings\"\]/packages = \[\"src\/$PACKAGE_NAME\"\]/g" pyproject.toml
sed -i "s/source = \[\"greetings\"\]/source = \[\"$PACKAGE_NAME\"\]/g" pyproject.toml
sed -i "s/addopts = \"-vv --cov=greetings/addopts = \"-vv --cov=$PACKAGE_NAME/g" pyproject.toml
sed -i "s/greetings = \"greetings.cli:main\"/$PACKAGE_NAME = \"$PACKAGE_NAME.cli:main\"/g" pyproject.toml
sed -i "s/0Mr-Panda0/$GITHUB_USER/g" pyproject.toml
sed -i "s/Python-Template-Project/$PROJECT_NAME/g" pyproject.toml

if [[ -n "$DESCRIPTION" ]]; then
    sed -i "s/description = \".*\"/description = \"$DESCRIPTION\"/g" pyproject.toml
fi
if [[ -n "$AUTHOR_NAME" ]]; then
    sed -i "s/{ name = \"0Mr-Panda0\" }/{ name = \"$AUTHOR_NAME\" }/g" pyproject.toml
fi

echo "Updating references across files..."
grep -rl "greetings" src/ tests/ main.py Justfile devenv.nix 2>/dev/null | xargs sed -i "s/greetings/$PACKAGE_NAME/g" || true
grep -rl "0Mr-Panda0" .github/ README.md 2>/dev/null | xargs sed -i "s/0Mr-Panda0/$GITHUB_USER/g" || true
grep -rl "Python-Template-Project" .github/ README.md 2>/dev/null | xargs sed -i "s/Python-Template-Project/$PROJECT_NAME/g" || true

echo "Regenerating lockfile..."
uv sync --all-groups

echo "Running verification..."
uv run pytest

echo "Initialization complete! Project '$PROJECT_NAME' is ready."

