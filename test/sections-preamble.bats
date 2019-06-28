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

@test 'Section: preamble (uniqe settings - override this)' {
    RUN_UNIT_TEST='true' run src/sections/preamble
    assert_success
    assert_line '__container_safe__="false"'
    assert_line '__gnu_version__="false"'
    assert_line '__require_root__="false"'
    assert_line '__script_debug__="false"'
}
