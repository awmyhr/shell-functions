#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    2019-07-08
# Created:    2019-06-28
#==============================================================================
load "${BATS_INSTALL}/support/load.bash"
load "${BATS_INSTALL}/assert/load.bash"
load "${BATS_INSTALL}/file/load.bash"

@test "is_true() for true values" {
    RUN_UNIT_TEST='true' run src/is_true Yes
    assert_success
    RUN_UNIT_TEST='true' run src/is_true true
    assert_success
    RUN_UNIT_TEST='true' run src/is_true 1
    assert_success
}

@test "is_true() for false values" {
    RUN_UNIT_TEST='true' run src/is_true No
    assert_failure 1
    RUN_UNIT_TEST='true' run src/is_true false
    assert_failure 1
    RUN_UNIT_TEST='true' run src/is_true 0
    assert_failure 1
}

@test "is_true() for no value/non-sense value" {
    RUN_UNIT_TEST='true' run src/is_true
    assert_failure 64
    RUN_UNIT_TEST='true' run src/is_true something_else
    assert_failure 1
    RUN_UNIT_TEST='true' run src/is_true no yes
    assert_failure 64
}
