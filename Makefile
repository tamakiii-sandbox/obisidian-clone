.PHONY: help build check clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

build: \
	dist/index.html \
	dist/index.js \
	dist/preload.js \
	dist/renderer.js

dist/index.html: dist | src/index.html
	cp $| $@

dist/index.js: dist | src/index.ts
	npx --no esbuild $| > $@

dist/preload.js: dist | src/preload.js
	cp $| $@

dist/renderer.js: dist | src/renderer.js
	cp $| $@

dist:
	mkdir $@

check: | $(shell find src -name '*.ts' -o -name '*.tsx')
	npx --no -- tsc --noEmit $|

clean:
	rm -rf dist
