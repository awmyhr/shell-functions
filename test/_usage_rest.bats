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

@test "_usage_rest() for default output" {
    RUN_UNIT_TEST='true' run src/_usage_rest
    assert_success
    assert_line '======='
    assert_line 'unknown'
    assert_line 'Synopsis'
    assert_line 'long description'
    assert_line 'Would call usage_options with: .. option:: %s\n\n    %s\n\n'
}
