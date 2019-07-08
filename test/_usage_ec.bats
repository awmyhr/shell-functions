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

@test '_usage_ec() test cases' {
    RUN_UNIT_TEST='true' run src/_usage_ec
    assert_success
    assert_line --partial '|  64 | Invalid argument'
    assert_line --partial '|  77 | Must be run as root.'
    assert_line --partial '|  78 | Invalid hostname (see RFC 1123).'
}
