# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit eutils

# @ECLASS: jetbrains.eclass
# @MAINTAINER:
# @AUTHOR:
# @BLURB: 
# @DESCRIPTION:

# @ECLASS_VARIABLE: JETBRAINS_PN
: ${JETBRAINS_PN:="${PN}"}

# @ECLASS_VARIABLE: JETBRAINS_PROGRAM_NAME
: ${JETBRAINS_PROGRAM_NAME:="${JETBRAINS_PN}"}

# @ECLASS_VARIABLE: JETBRAINS_INSTALL_PATH
: ${JETBRAINS_INSTALL_PATH:="/opt/${JETBRAINS_PN}"}

# @ECLASS_VARIABLE: JETBRAINS_DESKTOP_FILE
: ${JETBRAINS_INSTALL_PATH:="jetbrains-${JETBRAINS_PROGRAM_NAME}.desktop"}

# @ECLASS_VARIABLE: JETBRAINS_FILES_REMOVE
JETBRAINS_FILES_REMOVE+="
	bin/fsnotifier-arm
	lib/libpty/macosx
	lib/libpty/win
	plugins/tfsIntegration/lib/native/aix
	plugins/tfsIntegration/lib/native/freebsd
	plugins/tfsIntegration/lib/native/hpux
	plugins/tfsIntegration/lib/native/linux/arm
	plugins/tfsIntegration/lib/native/linux/ppc
	plugins/tfsIntegration/lib/native/macosx
	plugins/tfsIntegration/lib/native/solaris
	plugins/tfsIntegration/lib/native/win32
	plugins/tplugins/tfsIntegration/lib/nativefsIntegration/lib/native/win32
"

# @ECLASS_VARIABLE: JETBRAINS_FILES_AMD64
JETBRAINS_FILES_AMD64+="
	bin/${JETBRAINS_PROGRAM_NAME}64.vmoptions
	bin/fsnotifier64
	bin/libbreakgen64.so
	bin/libyjpagent-linux64.so
	lib/libpty/linux/x86_64
	plugins/tfsIntegration/lib/native/linux/x86_64
"

# @ECLASS_VARIABLE: JETBRAINS_FILES_X86
JETBRAINS_FILES_X86+="
	bin/${JETBRAINS_PROGRAM_NAME}.vmoptions
	bin/fsnotifier
	bin/libbreakgen.so
	bin/libyjpagent-linux.so
	lib/libpty/linux/x86
	plugins/tfsIntegration/lib/native/linux/x86
"

IUSE="-custom-jdk"
DEPEND=""
RDEPEND="!custom-jdk? ( virtual/jre )"

QA_PREBUILT="${JETBRAINS_INSTALL_PATH}"

# @FUNCTION: jetbrains_src_prepare
jetbrains_src_prepare() {
	use kernel_linux || die
	use amd64 || use x86 || die

	rm -rf ${JETBRAINS_FILES_REMOVE} || die
	if ! use amd64; then
		rm -rf ${JETBRAINS_FILES_AMD64} || die
	fi
	if ! use x86; then
		rm -rf ${JETBRAINS_FILES_X86} || die
	fi
	if ! use custom-jdk; then
		if [[ -d jre ]]; then
			rm -r jre || die
		fi
	fi
}

# @FUNCTION: jetbrains_src_install
jetbrains_src_install() {
	local dir="${JETBRAINS_INSTALL_PATH}"

	insinto "${dir}"
	doins -r *

	fperms 755 "${dir}"/bin/{"${JETBRAINS_PROGRAM_NAME}".sh,inspect.sh}
	if use amd64; then
		fperms 755 "${dir}/bin/fsnotifier64"
	fi
	if use x86; then
		fperms 755 "${dir}/bin/fsnotifier"
	fi
	make_wrapper "${JETBRAINS_PN}" "${dir}/bin/${JETBRAINS_PROGRAM_NAME}.sh"
	domenu "${FILESDIR}/${JETBRAINS_DESKTOP_FILE}"

	# https://confluence.jetbrains.com/display/IDEADEV/Inotify+Watches+Limit
	mkdir -p "${D}/etc/sysctl.d/" || die
	echo "fs.inotify.max_user_watches = 524288" > "${D}/etc/sysctl.d/30-${PN}-inotify-watches.conf" || die
}

EXPORT_FUNCTIONS src_prepare src_install
