DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init: 
	${TF} init

.PHONY: lint
lint: 
	${TF} fmt --recursive 

.PHONY: build
build: 
	${TF} plan -var cli_config_credentials_token=$(cli_config_credentials_token)

.PHONY: deploy
deploy: 
	${TF} apply --auto-approve