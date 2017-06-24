# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit jetbrains versionator

MY_PN="WebStorm"
PV_STRING="$(get_version_component_range 4-6)"
MY_PV="$(get_version_component_range 1-3)"

DESCRIPTION="JavaScript IDE for client- and server-side development with Node.js"
HOMEPAGE="http://www.jetbrains.com/webstorm"
SRC_URI="https://download.jetbrains.com/${PN}/${MY_PN}-${MY_PV}.tar.gz"

LICENSE="WebStorm WebStorm_Academic WebStorm_Classroom WebStorm_OpenSource WebStorm_personal"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${MY_PN}-${PV_STRING}"
