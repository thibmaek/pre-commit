#!/usr/bin/env bash
set -e

function is_shellcheck_available() {
	if ! command -v shellcheck >/dev/null; then
		echo ""
		echo "You need shellcheck available on your PATH to be able to use this hook."
		echo ""
		echo "Install it with:"

		if [ "$(uname)" == "Linux" ]; then
			echo "  $ sudo apt get install shellcheck"
		elif [ "$(uname)" == "Darwin" ]; then
			echo "  $ brew install shellcheck"
		fi
		echo ""
		echo "then re-commit your files or run this hook again."
		exit 1
	fi
}

function run_shellcheck() {
	is_shellcheck_available &&
		shellcheck "$1"
}

run_shellcheck "$@"
