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

@test "_debug_info() no args" {
    RUN_UNIT_TEST='true' run src/_debug_info
    assert_success
    assert_line 'debug Cononical: unknown'
    assert_line 'debug Args List: '
}

@test "_debug_info() with args" {
    RUN_UNIT_TEST='true' run src/_debug_info test args
    assert_success
    assert_line 'debug Cononical: unknown'
    assert_line 'debug Args List: test args'
}
