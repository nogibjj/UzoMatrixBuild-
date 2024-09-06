install:
	pip install --upgrade pip && pip install -r requirements.txt

format:
	black *.py

lint:
	pylint --disable=R,C --ignore-patterns=test_*?py *.py

test:
	python -m pytest -cov=main test_main.py

docker-build:
	docker build -f .devcontainer/Dockerfile -t python-dev .

docker-run:
	docker run --rm -v "$(PWD)":/workspace -p 8000:8000 python-dev

all: install format lint test