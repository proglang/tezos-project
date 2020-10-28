SHELL := /bin/bash
DOC_DIR=./doc
BUILD_DIR=./_build
BUILD_DIR_DOCS=./_build/default/_doc/_html

.PHONY: clean build all doc

clean:
	rm -rf $(BUILD_DIR)

build:
	dune build test.exe

all:
	{ \
	dune build test.exe ;\
	dune build @doc-private ;\
	cp -r $(BUILD_DIR_DOCS)/tezos_api@*/Tezos_api $(DOC_DIR)/$(BASEDIR) ;\
	cp  $(BUILD_DIR_DOCS)/highlight.pack.js $(DOC_DIR) ;\
	cp  $(BUILD_DIR_DOCS)/odoc.css $(DOC_DIR) ;\
	}

doc:
	{ \
	dune build @doc-private ;\
	cp -r $(BUILD_DIR_DOCS)/tezos_api@* $(DOC_DIR)/ ;\
	rm -rf $(DOC_DIR)/tezos_api@*/Tezos_api__Api ;\
	rm -rf $(DOC_DIR)/tezos_api@*/Tezos_api__Api_context ;\
	rm -rf $(DOC_DIR)/tezos_api@*/Tezos_api__Api_error ;\
	cp  $(BUILD_DIR_DOCS)/highlight.pack.js $(DOC_DIR) ;\
	cp  $(BUILD_DIR_DOCS)/odoc.css $(DOC_DIR) ;\
	}
