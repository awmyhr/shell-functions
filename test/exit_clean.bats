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

@test "exit_clean() for normal" {
    RUN_UNIT_TEST='true' run src/exit_clean
    assert_success
    assert_output ''
}

@test "exit_clean() for debug" {
    RUN_UNIT_TEST='true' run src/exit_clean debug
    assert_success
    assert_line 'debug ------ end ------'
}

@test "exit_clean() for logln file" {
    RUN_UNIT_TEST='true' __logln_file_set__='true' run src/exit_clean
    assert_success
    assert_line --partial '[EXIT]: Script finished.'
    assert_line 'Log file created: unknown'
}
