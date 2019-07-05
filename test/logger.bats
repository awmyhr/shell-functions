#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    2019-07-05
# Created:    2019-06-28
#==============================================================================
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'libs/bats-file/load'

@test "logln() for default log level" {
    RUN_UNIT_TEST='true' run src/logln debug test
    assert_success
    assert_output ''

    RUN_UNIT_TEST='true' run src/logln info test
    assert_success
    assert_output 'test'

    RUN_UNIT_TEST='true' run src/logln warn test
    assert_success
    assert_output 'Warning: test'

    RUN_UNIT_TEST='true' run src/logln crit test
    assert_success
    assert_output 'CRITICAL: test'

    RUN_UNIT_TEST='true' run src/logln soot test
    assert_success
    assert_output ''
}
