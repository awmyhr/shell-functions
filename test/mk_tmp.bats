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

@test "mk_tmp() for file" {
    RUN_UNIT_TEST='true' run src/mk_tmp
    assert_success
    assert_file_exist "${output}"
    rm "${output}"
}

@test "mk_tmp() for directory" {
    RUN_UNIT_TEST='true' run src/mk_tmp dir
    assert_success
    assert_file_exist "${output}"
    rmdir "${output}"
}
