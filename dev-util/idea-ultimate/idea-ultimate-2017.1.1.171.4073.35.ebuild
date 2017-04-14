# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

JETBRAINS_PN="idea"

inherit jetbrains versionator

PV_STRING="$(get_version_component_range 4-6)"
MY_PV="$(get_version_component_range 1-3)"

DESCRIPTION="A complete toolset for web, mobile and enterprise development"
HOMEPAGE="https://www.jetbrains.com/idea"
SRC_URI="https://download.jetbrains.com/idea/ideaIU-${MY_PV}.tar.gz -> ideaIU-${PV_STRING}.tar.gz"

LICENSE="IDEA
	|| ( IDEA_Academic IDEA_Classroom IDEA_OpenSource IDEA_Personal )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/idea-IU-${PV_STRING}"