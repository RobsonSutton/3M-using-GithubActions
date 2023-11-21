DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform
Token= ${{ TF_API_TOKEN }}

.PHONY: init
init: 
	echo $(Token)
	cli_config_credentials_token=$(Token) \
	${TF} init

.PHONY: lint
lint: 
	${TF} fmt --recursive 

.PHONY: build
build: 
	${TF} plan -input=false

.PHONY: deploy
deploy: 
	${TF} apply --auto-approve -input=false
