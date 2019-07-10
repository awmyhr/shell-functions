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

@test "is_false() for true values" {
    RUN_UNIT_TEST='true' run src/is_false Yes
    assert_failure 1
    RUN_UNIT_TEST='true' run src/is_false true
    assert_failure 1
    RUN_UNIT_TEST='true' run src/is_false 1
    assert_failure 1
}

@test "is_false() for false values" {
    RUN_UNIT_TEST='true' run src/is_false No
    assert_success
    RUN_UNIT_TEST='true' run src/is_false false
    assert_success
    RUN_UNIT_TEST='true' run src/is_false 0
    assert_success
}

@test "is_false() for no value/non-sense value" {
    RUN_UNIT_TEST='true' run src/is_false
    assert_failure 64
    RUN_UNIT_TEST='true' run src/is_false something_else
    assert_failure 1
    RUN_UNIT_TEST='true' run src/is_true no yes
    assert_failure 64
}
