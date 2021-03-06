# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JETBRAINS_PN="pycharm"

JETBRAINS_FILES_REMOVE="
	helpers/pydev/pydevd_attach_to_process/attach_amd64.dll
	helpers/pydev/pydevd_attach_to_process/attach_x86.dll
	helpers/pydev/pydevd_attach_to_process/attach_x86.dylib
	helpers/pydev/pydevd_attach_to_process/attach_x86_64.dylib
"
JETBRAINS_FILES_AMD64="
	helpers/pydev/pydevd_attach_to_process/attach_linux_amd64.so
"
JETBRAINS_FILES_X86="
	helpers/pydev/pydevd_attach_to_process/attach_linux_x86.so
"

inherit jetbrains versionator

DESCRIPTION="A complete toolset for web, mobile and enterprise development"
HOMEPAGE="https://www.jetbrains.com/pycharm"
SRC_URI="https://download.jetbrains.com/python/${P}.tar.gz"

LICENSE="PyCharm_Academic PyCharm_Classroom PyCharm PyCharm_OpenSource PyCharm_Preview"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${JETBRAINS_PN}-${PV}"
