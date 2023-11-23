DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} init

.PHONY: lint
lint: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} fmt --recursive 

.PHONY: build
build: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} plan -var TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token)

.PHONY: deploy
deploy: 
	TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token) \
	${TF} apply --auto-approve