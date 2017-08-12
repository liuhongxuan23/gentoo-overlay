# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit jetbrains versionator

MY_PN="WebStorm"
PV_STRING="172.3544.34"

DESCRIPTION="JavaScript IDE for client- and server-side development with Node.js"
HOMEPAGE="http://www.jetbrains.com/webstorm"
SRC_URI="https://download.jetbrains.com/${PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="WebStorm WebStorm_Academic WebStorm_Classroom WebStorm_OpenSource WebStorm_personal"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_PN}-${PV_STRING}"
