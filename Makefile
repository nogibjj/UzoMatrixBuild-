install:
	pip install --upgrade pip &&\
pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C cool.py

test:
	python -m pytest -vv --cov=hello test_cool.py

all: install lint test