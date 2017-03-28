# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JETBRAINS_FILES_REMOVE="
	bin/cmake
	bin/gdb
	bin/lldb
	plugins/python/helpers/pydev/pydevd_attach_to_process/attach_amd64.dll
	plugins/python/helpers/pydev/pydevd_attach_to_process/attach_x86.dll
	plugins/python/helpers/pydev/pydevd_attach_to_process/attach_x86.dylib
	plugins/python/helpers/pydev/pydevd_attach_to_process/attach_x86_64.dylib
"
JETBRAINS_FILES_AMD64="
	plugins/python/helpers/pydev/pydevd_attach_to_process/attach_linux_amd64.so
"
JETBRAINS_FILES_X86="
	plugins/python/helpers/pydev/pydevd_attach_to_process/attach_linux_x86.so
"

inherit jetbrains versionator

PV_STRING="$(get_version_component_range 4-6)"
MY_PV="$(get_version_component_range 1-3)"

SRC_URI="http://download.jetbrains.com/cpp/CLion-${MY_PV}.tar.gz -> ${PN}-${MY_PV}.tar.gz"
DESCRIPTION="A complete toolset for C and C++ development"
HOMEPAGE="http://www.jetbrains.com/clion"

LICENSE="IDEA
	|| ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${MY_PV}"
