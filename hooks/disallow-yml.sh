#! /usr/bin/env bash
set -e

if basename "$1" | grep --quiet ".*\.yml$"; then
	echo "File '$1' does not have a valid .yaml extension"
	exit 1
else
	exit 0
fi
