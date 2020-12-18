#!/usr/bin/env bash
set -e

TMP_TSCONFIG="$(dirname "$0")/../tsconfig.tmp.json"

# -----------------------------------------------------------------------------------------
# Clever solution which creates an intermediate tsconfig to validate
# on a per file basis (for tools like lint-staged which pass the current staged file to $@)
#
# Arguments:
#   $@: A list of files to be included in compilation
# ------------------------------------------------------------------------------------------
function create_tmp_tsconfig() {
	cat >"$TMP_TSCONFIG" <<EOF
{
  "extends": "./tsconfig.json",
  "include": [
EOF
	for file in "$@"; do
		echo "    \"$file\"," >>"$TMP_TSCONFIG"
	done
	cat >>"$TMP_TSCONFIG" <<EOF
    "./decls/*"
  ]
}
EOF
}

function compile() {
	create_tmp_tsconfig "$@"
	npx tsc --project "$TMP_TSCONFIG" || rm "$TMP_TSCONFIG"
	rm "$TMP_TSCONFIG"
}

compile "$@"
