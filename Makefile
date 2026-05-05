.PHONY: run test build

run:
	docker compose up

test:
	pytest tests/

build:
	docker build -t portfolio-app .
