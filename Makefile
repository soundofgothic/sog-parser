.PHONY: jsons

# Get version from git
VERSION := $(shell git describe --tags --always --dirty)

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
	docker build . -t soundofgothic/db:$(VERSION)

run: 
	docker run --name sog-db --rm -p 5432:5432 -d soundofgothic/db:$(VERSION)

psql: 
	docker exec -it sog-db psql -U postgres

stop:
	docker stop sog-db

clean:
	rm -f ./results/gothic_1/*
	rm -f ./results/gothic_2/*
	rm ./mappers/postgres/02-data.sql

