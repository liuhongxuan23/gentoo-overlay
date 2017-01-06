# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4

inherit autotools autotools-utils bash-completion-r1 eutils

DESCRIPTION="Archlinux's binary package manager"
HOMEPAGE="http://archlinux.org/pacman/"
SRC_URI="https://sources.archlinux.org/other/pacman/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+curl debug +doc +gpg +openssl"

COMMON_DEPEND="
	app-arch/libarchive
	openssl? ( dev-libs/openssl )
	curl? ( net-misc/curl )
	gpg? ( app-crypt/gpgme )
	"
RDEPEND="${COMMON_DEPEND}
	"
DEPEND="${COMMON_DEPEND}
	doc? ( app-text/asciidoc app-doc/doxygen )
	"

PATCHES=( "${FILESDIR}/${PN}-5.0.1-roundup.patch" )

src_configure() {
	local myeconfargs=(
		--localstatedir=/var
		--with-root-dir="${EPREFIX}"/prefix/arch
		$(use_with openssl)
		$(use_enable debug)
		$(use_enable doc)
		$(use_enable doc doxygen)
		$(use_with curl libcurl)
		$(use_with gpg gpgme)
	)
	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
	autotools-utils_src_compile -C contrib
}

src_install() {
	autotools-utils_src_install
	autotools-utils_src_install -C contrib

	rm -rf "${ED}/etc/bash_completion.d"
	newbashcomp "${AUTOTOOLS_BUILD_DIR}"/contrib/bash_completion pacman

	for f in makepkg pacman-key; do
		dosym pacman "${EPREFIX}/usr/share/bash-completion/completions/$f"
    done

	insinto /usr/share/vim/vimfiles/syntax
	doins contrib/PKGBUILD.vim	
}
