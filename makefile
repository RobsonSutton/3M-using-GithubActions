DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init: 
	${TF} init -input=false 

.PHONY: lint
lint: 
	${TF} fmt --recursive -input=false 

.PHONY: build
build: 
	${TF} plan -input=false

.PHONY: deploy
deploy: 
	${TF} apply --auto-approve -input=false