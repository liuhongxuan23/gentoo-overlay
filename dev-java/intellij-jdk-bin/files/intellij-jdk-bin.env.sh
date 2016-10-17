# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

VERSION="OpenJDK $(get_version_component_range 1-2)"
JAVA_HOME="${EPREFIX}/opt/${PN}-${SLOT}"
JDK_HOME="${EPREFIX}/opt/${PN}-${SLOT}"
JAVAC="\${JAVA_HOME}/bin/javac"
PATH="\${JAVA_HOME}/bin:\${JAVA_HOME}/jre/bin"
ROOTPATH="\${JAVA_HOME}/bin:\${JAVA_HOME}/jre/bin"
LDPATH="\${JAVA_HOME}/jre/lib/$(get_system_arch)/:\${JAVA_HOME}/jre/lib/$(get_system_arch)/server/"
MANPATH="${EPREFIX}/opt/${PN}-${SLOT}/man"
PROVIDES_TYPE="JDK JRE"
PROVIDES_VERSION="1.${SLOT}"
BOOTCLASSPATH="\${JAVA_HOME}/jre/lib/resources.jar:\${JAVA_HOME}/jre/lib/rt.jar:\${JAVA_HOME}/jre/lib/sunrsasign.jar:\${JAVA_HOME}/jre/lib/jsse.jar:\${JAVA_HOME}/jre/lib/jce.jar:\${JAVA_HOME}/jre/lib/charsets.jar:\${JAVA_HOME}/jre/jfr.jar:\${JAVA_HOME}/jre/classes"
GENERATION="2"
ENV_VARS="JAVA_HOME JDK_HOME JAVAC PATH ROOTPATH LDPATH MANPATH"
