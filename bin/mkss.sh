#!/bin/sh
#-- NOTE: Default to POSIX shell/mode. If more is needed check shell-script...
#==============================================================================
#:"""
#: .. program:: mkss.sh
#:    :synopsis: TODO: CHANGEME
#:
#:    :copyright: 2019 awmyhr
#:    :license: Apache-2.0
#:
#: .. codeauthor:: awmyhr <awmyhr@gmail.com>
#:
#: TODO: CHANGEME - description for documentation
#:"""
#==============================================================================
#-- Variables which are meta for the script should be dunders (__varname__)
#-- TODO: UPDATE meta vars
__version__='0.1.0-alpha' #: current version
__revised__='20190710-145755' #: date of most recent revision
__contact__='awmyhr <awmyhr@gmail.com>' #: primary contact for support/?'s
__synopsis__='TODO: CHANGEME'
__description__="
TODO: CHANGEME - description for --help
"
#------------------------------------------------------------------------------
#-- Flags
__require_root__='false'    #: Does script require root
__container_safe__='false'  #: Are we safe to run inside a Docker container?
#==============================================================================
#-- The following few variables should be relatively static over life of script
__author__='awmyhr <awmyhr@gmail.com>' #: coder(s) of script
__created__='2019-07-10'               #: date script originlly created
__copyright__='2019 awmyhr' #: Copyright short name
__license__='Apache-2.0'
__cononical_name__='mkss.sh' #: static name, *NOT* os.path.basename(sys.argv[0])
__project_name__='Shell Functions'  #: name of overall project, if needed
__project_home__='https://github.com/awmyhr/shell-functions'  #: where to find source/documentation
__template_version__='1.2.0'             #: version of template file used
#-- We are not using this variable for now.
# shellcheck disable=2034
__docformat__='reStructuredText en'      #: attempted style for documentation
__basename__="${0}" #: name script run as
#==============================================================================
#-- Print help or version if requested.
if [ "${1}" = "-h" ] || [ "${1}" = "--help" ]; then
    printf '(%s)\n%s\n' "${__basename__}" "${__synopsis__}"
    #-- If you have options, put them here, though you may want to use shell-script instead
    printf '%s\n\n' "${__description__}"
    printf 'Created: %s  Contact: %s\n' "${__created__}" "${__contact__}"
    printf 'Revised: %s  Version: %s\n' "${__revised__}" "${__version__}"
    printf '%s, part of %s.\n' "${__cononical_name__}" "${__project_name__}"
    printf 'Project home: %s\n' "${__project_home__}"
    printf '(c) Copyright %s (License: %s)\n' "${__copyright__}" "${__license__}"
    printf 'By %s; based on template version %s.\n' "${__author__}" "${__template_version__}"
    exit 0
elif [ "${1}" = "--version" ]; then
    printf '%s (%s) %s\n' "${__cononical_name__}" "${__project_name__}" "${__version__}"
    exit 0
elif [ "${__require_root__}" = "true" ] && [ "$(id -u)" -ne 0 ] ; then
  printf 'Must be run as root.\n'
  exit 77
elif [ "${__container_safe__}" = "false" ] && grep -q '/docker' /proc/self/cgroup ; then
  printf 'This script is not container safe.\n'
  exit 78
fi
#==============================================================================
#-- TODO: Do something more interesting here...
#-- Remember, this is for very simple scripts. Anything more complicated then
#   a dozen or so lines should probably use the shell-script template...