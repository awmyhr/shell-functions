# Shell Functions _(shell-functions)_

> A collection of useful shell functions with unit tests.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Maintainers](#maintainers)
- [Contribute](#contribute)
- [License](#license)

## Install

```
```

### Install bats for testing

Execute these:

    BATS_INSTALL="${HOME}/.local/share/bats"
    mkdir -p "${BATS_INSTALL}"
    cd "${BATS_INSTALL}"
    git clone --recurse-submodules https://github.com/sstephenson/bats      core
    git clone --recurse-submodules https://github.com/ztombol/bats-support  support
    git clone --recurse-submodules https://github.com/ztombol/bats-assert   assert
    git clone --recurse-submodules https://github.com/ztombol/bats-file     file
    cd core
    ./install.sh "${HOME}/.local"

Add to shell init scripts:

    BATS_INSTALL="${HOME}/.local/share/bats"
    PATH=$PATH:${HOME}/.local/bin:${HOME}/.local/libexec
    export PATH BATS_INSTALL

Use in _testname_.bats files:

    load "${BATS_INSTALL}/support/load.bash"
    load "${BATS_INSTALL}/assert/load.bash"
    load "${BATS_INSTALL}/file/load.bash"

## Usage

Function naming scheme:
 - \__name_ - Support functions not likely used in body of script.
 - get\__name_ - Prints string suitable for assigning to variable.
 - is\__name_ - Typically a true/false test.
 - mk\__name_ - Creates something, typically a file or directory.
 - set\__name_ - Sets one or more variables, typically in script environment.

Files which are not (just) functions are in CamelCase. These set global variables
and/or execute code which may or may not have side-effects.

Most functions are designed to be used as-is, however these are specifically
designed to be over-ridden:

    parse_options
    PreambleFull
    Main

## Maintainers

- awmyhr <awmyhr@gmail.com>

## Contribute

PRs accepted.

## License

Apache-2.0 (c) 2019 awmyhr