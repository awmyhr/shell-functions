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


@test "get_platform_tag() for mocked values" {
    RUN_UNIT_TEST='true' run src/get_platform_tag 'RUN_UNIT_TEST TEST'
    assert_success
    assert_output 'other'

    RUN_UNIT_TEST='true' run src/get_platform_tag 'Microsoft Corporation'
    assert_success
    assert_output 'azure'

    RUN_UNIT_TEST='true' run src/get_platform_tag 'VMware, Inc.'
    assert_success
    assert_output 'vmware'
}
