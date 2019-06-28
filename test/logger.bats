#!./test/libs/bats/bin/bats
# Author:     MyHR, Andy <andy.myhr@metlife.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    2019-06-28
# Created:    2019-06-28
#==============================================================================
load 'libs/bats-support/load'
load 'libs/bats-assert/load'
load 'libs/bats-file/load'

@test "logger() for default log level" {
    RUN_UNIT_TEST='true' run src/logger debug test
    assert_success
    assert_output ''

    RUN_UNIT_TEST='true' run src/logger info test
    assert_success
    assert_output 'test'

    RUN_UNIT_TEST='true' run src/logger warn test
    assert_success
    assert_output 'Warning: test'

    RUN_UNIT_TEST='true' run src/logger crit test
    assert_success
    assert_output 'CRITICAL: test'

    RUN_UNIT_TEST='true' run src/logger soot test
    assert_success
    assert_output ''
}
