#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    2019-07-05
# Created:    2019-06-27
#==============================================================================
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'libs/bats-file/load'

@test "get_timestamp() for default" {
    RUN_UNIT_TEST='true' run src/get_timestamp
    assert_success
    assert_output --regexp '^[0-9]{8}$'
}

@test "get_timestamp() for specified format" {
    RUN_UNIT_TEST='true' run src/get_timestamp "+%Y"
    assert_success
    assert_output --regexp '^[0-9]{4}$'
}

@test "get_timestamp() for invalid format" {
    RUN_UNIT_TEST='true' run src/get_timestamp soor
    assert_failure
}
