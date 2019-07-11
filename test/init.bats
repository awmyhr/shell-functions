#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    20190711-113625
# Created:    2019-06-28
#==============================================================================
load "${BATS_INSTALL}/support/load.bash"
load "${BATS_INSTALL}/assert/load.bash"
load "${BATS_INSTALL}/file/load.bash"

@test 'init() for clean runs' {
    RUN_UNIT_TEST='true' run src/init
    assert_success
    assert_output 'Would call _debug_info() here.'

    RUN_UNIT_TEST='true' __logln_file__='test-init.tmp' run src/init
    assert_success
    assert_file_exist test-init.tmp
    rm test-init.tmp
}

@test "init() for req root (don't run as root)" {
    RUN_UNIT_TEST='true' __require_root__='true'  run src/init
    assert_failure 77
    assert_output --partial 'Must be run as root'
}
