# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit java-vm-2 versionator

MY_PV="$(replace_version_separator 2 b)"
MY_PV="$(replace_version_separator 1 u "${MY_PV}")"

DESCRIPTION="OpenJDK development kit by JetBrains"
HOMEPAGE="https://github.com/JetBrains/jdk8u https://bintray.com/jetbrains/intellij-jdk"
SRC_URI="https://dl.bintray.com/jetbrains/intellij-jdk/jbsdk${MY_PV}_linux_x64.tar.gz"

LICENSE="GPL-2-with-classpath-exception"
SLOT="$(get_major_version)"
KEYWORDS="~amd64"

IUSE=""

PROVIDE="virtual/jdk"

COMMON_DEP=""

RDEPEND="${COMMON_DEP}"
DEPEND="${COMMON_DEP}"

S="${WORKDIR}"

src_install() {
	local dest="/opt/${PN}-${SLOT}"
	local ddest="${ED}${dest#/}"
	dodir "${dest}"

	cp -pPR bin include jre lib "${ddest}" || die

	java-vm_install-env "${FILESDIR}/intellij-jdk-bin.env.sh"

	java-vm_set-pax-markings "${ddest}"

	java-vm_revdep-mask "${EPREFIX}${dest}"

	java-vm_sandbox-predict /dev/random /proc/self/coredump_filter
}
