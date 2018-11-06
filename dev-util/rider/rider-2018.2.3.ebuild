# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit jetbrains versionator

DESCRIPTION="A fast & powerful, cross-platform .NET IDE"
HOMEPAGE="https://www.jetbrains.com/rider"
SRC_URI="https://download.jetbrains.com/rider/JetBrains.Rider-${PV}.tar.gz"

LICENSE="IDEA
	|| ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="${DEPEND}
	app-crypt/libsecret"

S="${WORKDIR}/JetBrains Rider-${PV}"
