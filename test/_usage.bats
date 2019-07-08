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

@test "_usage() for default output" {
    RUN_UNIT_TEST='true' __basename__='test' run src/_usage
    assert_success
    assert_line 'Usage: test [options]'
    assert_line 'synopsis'
    assert_line 'Would call usage_options with:   %s     %s\n'
    assert_line 'long description'
}
