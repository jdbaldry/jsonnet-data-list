.ONESHELL:
.DELETE_ON_ERROR:
SHELL       := bash
SHELLFLAGS  := -euf -o pipefail
MAKEFLAGS   += --warn-undefined-variables
MAKEFLAGS   += --no-builtin-rule

all: test README.md

README.md: main.libsonnet
	docsonnet <(jsonnet -J vendor main.libsonnet) -o .

.PHONY: test
test: main.libsonnet $(wildcard tests/*)
	cd tests
	JSONNET_BIN=jsonnet run_tests.sh

tests/%.jsonnet.golden:
	cd tests
	JSONNET_BIN=jsonnet refresh_golden.sh $(patsubst tests/%.golden, %, $@)
