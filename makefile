DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} init -input=false 

.PHONY: lint
lint: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} fmt --recursive 

.PHONY: build
build: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} plan -input=false

.PHONY: deploy
deploy: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} apply --auto-approve -input=false