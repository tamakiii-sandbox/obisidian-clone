.PHONY: help install build check clean uninstall

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	node_modules

node_modules:
	npm install

build: \
	dist/index.html \
	dist/index.js \
	dist/preload.js \
	dist/renderer.js

dist/index.html: dist | src/index.html
	cp $| $@

dist/index.js: dist | src/index.ts
	npx --no esbuild $| --outfile=$@

dist/preload.js: dist | src/preload.ts
	npx --no esbuild $| --outfile=$@

dist/renderer.js: dist | src/renderer.tsx
	npx --no esbuild $| --bundle --platform=browser --target=chrome58,firefox57,safari11,edge16 --outfile=$@

dist:
	mkdir $@

check: | $(shell find src -name '*.ts' -o -name '*.tsx')
	npx --no -- tsc --noEmit $|

clean:
	rm -rf dist

uninstall:
	rm -rf node_modules
