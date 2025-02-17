.PHONY: test lint typecheck format format-check check-all clean

test:
	pytest

lint:
	flake8 .

typecheck:
	mypy .

format:
	black .
	isort .

format-check:
	black --check .
	isort --check-only .

check-all: format-check lint typecheck test

clean:
	rm -rf .pytest_cache .coverage .mypy_cache __pycache__ portfolio/__pycache__ tests/__pycache__
