
[//]: # (Revised: 2018-07-20; Created: 2016-09-30; Author: awmyhr <awmyhr@gmail.com>)

# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).
Individual files in this project generally try to adhere to [Semantic Versioning](http://semver.org/),
however the project itself uses date versioning.

---

## TODO

---

## [20190710]
### Added
- Simple script to run bats tests and assemble script

### Changed
- Nearly every file tweaked, in particular to support using bats from environment,
and better POSIX compliance.
- options are now processed via parse_options() function in the newly moved/renamed
parse_options file.
- body of a script is now in the main() function.
- layout/naming tweaked. this should be the last of that for now...

---

## [20190705]
### Changed
- Many function names have been changed to establish a meaningful schema.

---

## [20190628]
- Initial release. Functions are based on the 'shell-script' template from
  the [newfile](https://github.com/awmyhr/newfile) project, and can be used
  to construct it.

---

## [Unreleased]
### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

---