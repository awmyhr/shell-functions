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

@test "set_value() for new file" {
    RUN_UNIT_TEST='true' run src/set_value test-set_value.tmp test_val1 one
    assert_success
    assert_file_exist test-set_value.tmp
}

@test "set_value() for change value" {
    RUN_UNIT_TEST='true' run src/set_value test-set_value.tmp test_val1 two
    assert_success
    }

@test "set_value() for new value" {
    RUN_UNIT_TEST='true' run src/set_value test-set_value.tmp test_val2 three
    assert_success
}

@test "set_value() for non-quote value" {
    RUN_UNIT_TEST='true' run src/set_value test-set_value.tmp test_val3 two noquote
    assert_success
}

@test "set_value() for invalid path/file" {
    RUN_UNIT_TEST='true' run src/set_value /not/a/real/file test test
    assert_failure
    if [ -f test-set_value.tmp ] ; then
        rm test-set_value.tmp
    fi
}

@test "set_value() for wrong params" {
    RUN_UNIT_TEST='true' run src/set_value
    assert_failure 64
    RUN_UNIT_TEST='true' run src/set_value one
    assert_failure 64
    RUN_UNIT_TEST='true' run src/set_value one two three four five
    assert_failure 64
}
