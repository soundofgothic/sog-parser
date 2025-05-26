.PHONY: jsons sql docker run psql stop clean

# Get version from git
VERSION := $(shell git describe --tags --always --dirty)
DOCKER_CMD := docker
# use podman if available
ifneq (, $(shell which podman))
  DOCKER_CMD := podman
endif

# Set pythonpath
export PYTHONPATH := $(shell pwd)

jsons:
	@echo "Generating JSON files..."
	@bash ./process_scripts.sh
	@echo "Done."

sql:
	@echo "Generating SQL files..."
	@python3 ./mappers/postgres/prepare.py
	@echo "Done."

docker:
	cd mappers/postgres && \
	$(DOCKER_CMD) build --no-cache . -t soundofgothic/db:$(VERSION)

run: 
	$(DOCKER_CMD) run --name sog-db --rm -p 5432:5432 -d soundofgothic/db:$(VERSION)

psql: 
	$(DOCKER_CMD) exec -it sog-db psql -U postgres

stop:
	$(DOCKER_CMD) stop sog-db

clean:
	rm -f ./results/gothic_1/*
	rm -f ./results/gothic_2/*
	rm ./mappers/postgres/02-data.sql

