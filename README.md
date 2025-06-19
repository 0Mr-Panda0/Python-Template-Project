# Python-Template-Project

This repository serves as a template for Python projects. It provides a structured approach to setting up your project, including virtual environments, testing, and automation.

## Getting Started

1. **Installing uv for python project management:**
   ```
   winget install --id=astral-sh.uv  -e
   ```

2. **Create a Codespace:**
   Set up a new codespace for your project by
   ```
   uv init <name_of_project>
   ```

3. **Adding packages to the project:**
   In the terminal, run the following command:

   ```bash
   uv add <package_name>
   ```

4. **Write Your Code:**
   Develop your project code within the virtual environment.

5. **Add Testing Code:**
   Write your testing code to ensure code quality.

6. **Required Packages:**
   
   - `uv`
   - `ruff`
   - `mypy`
   - `pytest`
   - `pytest-cov`
   - `invoke`

7. **Run Tasks and Debug:**
   Execute the following commands:
   - Install packages and update pip: `uv run invoke manage-dependency`
   - Test and check coverage: `uv run invoke run-tests`
   - Format and Lint the code: `uv run invoke type-hints-check`
   - Type checks: `uv run invoke lint-and-format-code`
   - Run all the above: `uv run invke build`

8. **Push to Repository:**
   - Check staged files: `git status`
   - Add files to the staging area: `git add *` (or selectively with `git add <file_name>`)
   - Commit with a descriptive message: `git commit -m "<message>"`
   - Push to your repository: `git push`

9. **Continuous Integration (CI) Pipeline:**
    
    Set up a GitHub Actions workflow to create an automated pipeline triggered by pushes and pulls.


[![CI Pipeline](https://github.com/0Mr-Panda0/Python-Template-Project/actions/workflows/main.yaml/badge.svg)](https://github.com/0Mr-Panda0/Python-Template-Project/actions/workflows/main.yaml)
