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
