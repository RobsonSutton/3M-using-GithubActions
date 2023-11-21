DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init: 
	cli_config_credentials_token=$(cli_config_credentials_token) \
	${TF} init -input=false 

.PHONY: lint
lint: 
	${TF} fmt --recursive 

.PHONY: build
build: 
	${TF} plan -input=false

.PHONY: deploy
deploy: 
	${TF} apply --auto-approve -input=false