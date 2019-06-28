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

@test "get_temp() for file" {
    RUN_UNIT_TEST='true' run src/get_temp
    assert_success
    assert_file_exist "${output}"
    rm "${output}"
}

@test "get_temp() for directory" {
    RUN_UNIT_TEST='true' run src/get_temp dir
    assert_success
    assert_file_exist "${output}"
    rmdir "${output}"
}