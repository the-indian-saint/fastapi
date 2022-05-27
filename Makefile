PROJECT_NAME  					    ?= tree-api
PROJECT   							?= theindiansaint/tree-api
BUILD_TAG 						 	?= build-local
DOCKER_COMPOSE_PROJECT 	            ?= $(PROJECT_NAME)
IMAGE						         = $(PROJECT):$(BUILD_TAG)

prepare:
	python3 -m venv backend/.venv
	backend/.venv/bin/pip install --use-pep517 --quiet -r backend/requirements.txt

revision:
	$(eval GIT_COMMIT = $(shell git rev-parse HEAD))

build: revision
	docker build \
		--file Dockerfile \
		--label "git_commit=$(GIT_COMMIT)" \
		--tag $(PROJECT) \
		.

dev-up:
	docker-compose -f docker-compose.yml up --build --remove-orphans -d

dev-down:
	docker-compose -f docker-compose.yml down --remove-orphans -v

test-up:
	docker-compose -f docker-compose.yml up --build --remove-orphans -d

test-run:
	docker-compose -f docker-compose.yml exec api ash -c '/app/fastapi/run_test'

test-down:
	docker-compose -f docker-compose.yml down --remove-orphans -v

dev: dev-up
	docker-compose -f docker-compose.yml exec api ash

test: test-up test-run test-down

deploy: test build
	docker push $(PROJECT):latest
	
deploy-k8s: deploy
	kubectl apply -f k8s/namespace
	kubectl apply -f k8s/nginx
	kubectl apply -f k8s/code
