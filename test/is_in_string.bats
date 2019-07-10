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

@test "is_in_string() for needle in haystack" {
    RUN_UNIT_TEST='true' run src/is_in_string 'yes' 'in here yes it is'
    assert_success
}

@test "is_in_string() for needle NOT in haystack" {
    RUN_UNIT_TEST='true' run src/is_in_string 'no' 'in here yes it is'
    assert_failure
}
