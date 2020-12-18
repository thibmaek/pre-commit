# pre-commit

<!-- Banner & Badges. Badges should have newlines -->
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

Hooks to apply to projects that use [pre-commit](https://pre-commit.com).

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Maintainers](#maintainers)
- [License](#license)

## Install

Make sure to have pre-commit installed (`pip install pre-commit`).

Add the following to your `.pre-commit-config.yaml`:

```yaml
repos:
  - repo: https://github.com/thibmaek/pre-commit
    rev: '' # point to tag or commit
    hooks:
      - id: disallow-yml
      - id: shellcheck
      - id: tsc
      - ...
```

If you don't want to point to a tag and look it up just copy the config and run `pre-commit autoupdate`.

## Usage

These hooks are currently available:

| Hook ID | Description | Notes |
| - | - | - |
| `disallow-yaml` | Disallows the usage of the .yml file extension in favour of .yaml
| `shellcheck` | Runs shellcheck to lint shell scripts
| `shfmt` | Runs shfmt to format shell scripts
| `tsc` | Compiles individual files with the Typescript Compiler (`tsc`) | This will create a temporary `tsconfig.json` with only the files passed by pre-commit in the `include` directive. The file is automatically deleted afterwards.

## Maintainer(s)

- [@thibmaek](https://github.com/thibmaek)

## License

MIT

For more info, see [license file](./LICENSE)
