install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv --cov=hello --cov=mylib test_*.py

format:
	black *.py mylib/*.py

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py * 

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#echo "deploy not implemented"

all: install lint test
