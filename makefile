DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init: 
	export TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token)
	${TF} init -input=false 

.PHONY: lint
lint: 
	export TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token)
	${TF} fmt --recursive 

.PHONY: build
build: 
	export TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token)
	${TF} plan -input=false

.PHONY: deploy
deploy: 
	export TF_VAR_cli_config_credentials_token=$(TF_VAR_cli_config_credentials_token)
	${TF} apply --auto-approve -input=false