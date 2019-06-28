#!./test/libs/bats/bin/bats
# Author:     MyHR, Andy <andy.myhr@metlife.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    2019-06-27
# Created:    2019-06-27
#==============================================================================
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'libs/bats-file/load'

@test "timestamp() for default" {
    RUN_UNIT_TEST='true' run src/timestamp
    assert_success
    assert_output --regexp '^[0-9]{8}$'
}

@test "timestamp() for specified format" {
    RUN_UNIT_TEST='true' run src/timestamp "+%Y"
    assert_success
    assert_output --regexp '^[0-9]{4}$'
}

@test "timestamp() for invalid format" {
    RUN_UNIT_TEST='true' run src/timestamp soor
    assert_failure
}
