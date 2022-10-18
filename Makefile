.PHONY: help run

help:
	@cat $(firstword $(MAKEFILE_LIST))

run:
	npx --no -- electron .
