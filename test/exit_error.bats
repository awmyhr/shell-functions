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

@test "exit_error() no log file" {
    RUN_UNIT_TEST='true' run src/exit_error
    assert_failure 128
    assert_output 'unknown: Invalid arguments for exit_error()'

    RUN_UNIT_TEST='true' run src/exit_error 10 'second test error'
    assert_failure 10
    assert_output 'unknown: second test error'
}

@test "exit_error() with log file" {
    RUN_UNIT_TEST='true' __logln_file_set__='true' run src/exit_error 199 'with log file'
    assert_failure 199
    assert_line 'unknown: with log file'
    assert_line --partial '[EXIT]: with log file'
    assert_line 'Log file created: unknown'
}
