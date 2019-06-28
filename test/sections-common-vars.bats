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

@test "Section: common_vars (standard settings)" {
    RUN_UNIT_TEST='true' run src/sections/common_vars
    assert_success
    assert_line '__backup_dsf__="+%Y%m%d-%H%M%S"'
    assert_line --partial 'common_vars'
    assert_line '__logger_lvl__="20"'
    assert_line 'PATH=/sbin:/usr/sbin:/bin:/usr/bin'
}
