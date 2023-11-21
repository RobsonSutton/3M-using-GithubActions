DOCKER_COMPOSE := docker compose run -it 
TF := ${DOCKER_COMPOSE} terraform


.PHONY: lint
lint: 
	${TF} fmt --recursive

.PHONY: build
build: 
	${TF} plan

.PHONY: deploy
deploy: 
	${TF} apply --auto-approve