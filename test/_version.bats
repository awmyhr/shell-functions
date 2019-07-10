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

@test "_version() for default output" {
    RUN_UNIT_TEST='true' run src/_version
    assert_success
    assert_output 'unknown (unknown) x.y.z'
}

@test "_version() for gnu output" {
    RUN_UNIT_TEST='true' run src/_version gnu
    assert_success
    assert_line 'unknown (unknown) x.y.z'
    assert_line 'Copyright yyyy unknown'
    assert_line 'License unknown'
}
