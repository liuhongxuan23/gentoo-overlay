# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="musl"
MY_P="${MY_PN}-${PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="Light, fast and simple C library focused on standards-conformance and safety"
HOMEPAGE="https://musl.libc.org"
SRC_URI="http://www.musl-libc.org/releases/${MY_P}.tar.gz"

LICENSE="MIT LGPL-2 GPL-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	econf \
		--prefix="${EPREFIX}"/usr/${MY_PN} \
		--bindir="${EPREFIX}"/usr/bin \
		--syslibdir=/lib
}
