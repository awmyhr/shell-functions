#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    20190711-110954
# Created:    2019-06-28
#==============================================================================
load "${BATS_INSTALL}/support/load.bash"
load "${BATS_INSTALL}/assert/load.bash"
load "${BATS_INSTALL}/file/load.bash"


@test "get_platform_tag() for mocked values" {
    OUTPUT='unknown'
    [ -f '/sys/devices/virtual/dmi/id/sys_vendor' ] && OUTPUT='other'
    RUN_UNIT_TEST='true' run src/get_platform_tag 'RUN_UNIT_TEST TEST'
    assert_success
    assert_output "${OUTPUT}"

    OUTPUT='unknown'
    [ -f '/sys/devices/virtual/dmi/id/sys_vendor' ] && OUTPUT='azure'
    RUN_UNIT_TEST='true' run src/get_platform_tag 'Microsoft Corporation'
    assert_success
    assert_output "${OUTPUT}"

    OUTPUT='unknown'
    [ -f '/sys/devices/virtual/dmi/id/sys_vendor' ] && OUTPUT='vmware'
    RUN_UNIT_TEST='true' run src/get_platform_tag 'VMware, Inc.'
    assert_success
    assert_output "${OUTPUT}"
}
