lint:
	shfmt -w $(PWD)/hooks/*.sh
	shellcheck $(PWD)/hooks/*.sh

build: lint
	chmod -R +x ./hooks
