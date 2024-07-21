install:
	pip install --upgrade pip && pip install -r requirements.txt

test:
	python -m pytest -vv --cov=greetings test_greetings.py

format:	
	black *.py 

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py

refactor: 
	format lint
		
all: install lint test format