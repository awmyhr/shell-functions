#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    2019-07-08
# Created:    2019-06-27
#==============================================================================
load "${BATS_INSTALL}/support/load.bash"
load "${BATS_INSTALL}/assert/load.bash"
load "${BATS_INSTALL}/file/load.bash"

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
