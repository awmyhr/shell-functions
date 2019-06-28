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

@test 'Section: body (uniqe magic - override this)' {
    RUN_UNIT_TEST='true' run src/sections/body
    assert_success
    assert_line 'Would call init() here.'
    assert_line 'debug - this is a debug'
    assert_line 'warn - this is a warning'
    assert_line 'crit - this is critical'
    assert_line 'Would call exit_clean() here.'
}
