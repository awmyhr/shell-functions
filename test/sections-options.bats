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

@test 'Section: options (option processing and help - override this)' {
    RUN_UNIT_TEST='true' run src/sections/options
    assert_success
    assert_line '__script_debug__="false"'
    assert_line '__logln_lvl__="20"'

    RUN_UNIT_TEST='true' run src/sections/options --debug
    assert_success
    assert_line '__script_debug__="true"'
    assert_line '__logln_lvl__="10"'

    RUN_UNIT_TEST='true' run src/sections/options -h
    assert_success
    assert_line 'Would call _usage() here.'
    assert_line '--help, -h (Dislay this help)'
    assert_line '--version  (Display version)'

    RUN_UNIT_TEST='true' run src/sections/options --help-rest
    assert_success
    assert_line 'Would call _usage_rest() here.'

    RUN_UNIT_TEST='true' run src/sections/options --help-ec
    assert_success
    assert_line 'Would call _usage_ec() here.'

    RUN_UNIT_TEST='true' run src/sections/options --version
    assert_success
    assert_line 'Would call _version() here.'

    RUN_UNIT_TEST='true' run src/sections/options --nope
    assert_failure 64
    assert_output 'exit_error: (64) Invalid option: --nope'
}
