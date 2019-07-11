#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    20190711-104735
# Created:    2019-06-28
#==============================================================================
load "${BATS_INSTALL}/support/load.bash"
load "${BATS_INSTALL}/assert/load.bash"
load "${BATS_INSTALL}/file/load.bash"


if [ -f '/sys/devices/virtual/dmi/id/sys_vendor' ] ; then
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
else
    @test "get_platform_tag() with no /sys file" {
        RUN_UNIT_TEST='true' run src/get_platform_tag 'RUN_UNIT_TEST TEST'
        assert_success
        assert_output 'unknown'
    }
fi
