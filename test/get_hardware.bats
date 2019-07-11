#!./test/libs/bats/bin/bats
# Author:     awmyhr <awmyhr@gmail.com>
# Contact:    awmyhr <awmyhr@gmail.com>
# Project:    Shell Functions
# Proj Home:  https://github.com/awmyhr/shell-functions
# Copyright:  2019 awmyhr
# License:    Apache-2.0
# Revised:    20190711-110954
# Created:    2019-07-11
#==============================================================================
load "${BATS_INSTALL}/support/load.bash"
load "${BATS_INSTALL}/assert/load.bash"
load "${BATS_INSTALL}/file/load.bash"


@test "get_hardware() for mocked value" {
    OUTPUT='unknown'
    [ -f '/sys/devices/virtual/dmi/id/product_name' ] && OUTPUT='RUN_UNIT_TEST TEST'
    RUN_UNIT_TEST='true' run src/get_hardware 'RUN_UNIT_TEST TEST'
    assert_success
    assert_output "${OUTPUT}"
}
