DOCKER_COMPOSE := docker compose run
TF := ${DOCKER_COMPOSE} terraform

.PHONY: init
init: 
	TF_TOKEN_app_terraform_io=$(TF_TOKEN_app_terraform_io) \
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