#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    2019-07-10
# Created:    2019-06-28
#==============================================================================
load "${BATS_INSTALL}/support/load.bash"
load "${BATS_INSTALL}/assert/load.bash"
load "${BATS_INSTALL}/file/load.bash"

@test "Section: common_vars (standard settings)" {
    RUN_UNIT_TEST='true' run src/CommonVars
    assert_success
    assert_line '__backup_dsf__="+%Y%m%d-%H%M%S"'
    assert_line --partial 'common_vars'
    assert_line '__logln_lvl__="20"'
    assert_line 'PATH=/sbin:/usr/sbin:/bin:/usr/bin'
}
