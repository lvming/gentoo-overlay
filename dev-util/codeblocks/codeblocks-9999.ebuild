# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/codeblocks/codeblocks-8.02-r1.ebuild,v 1.1 2009/07/29 23:37:49 dirtyepic Exp $

inherit subversion autotools wxwidgets flag-o-matic eutils

ESVN_REPO_URI="http://svn.berlios.de/svnroot/repos/codeblocks/trunk"
ESVN_BOOTSTRAP="bootstrap"
WX_GTK_VER="2.8"

DESCRIPTION="Free cross-platform C/C++ IDE"
HOMEPAGE="http://www.codeblocks.org/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

IUSE="contrib debug pch static"

RDEPEND="=x11-libs/wxGTK-${WX_GTK_VER}*
		x11-libs/gtk+"

DEPEND="${RDEPEND}
	>=sys-devel/autoconf-2.5.0
	>=sys-devel/automake-1.7
	>=sys-devel/libtool-1.4
	app-arch/zip"

pkg_setup() {
	need-wxwidgets unicode
}

src_unpack() {
	subversion_fetch
	./update_revision.sh
	cd ${S}
	truncate -s0 ./update_revision.sh
	subversion_bootstrap
	eautoreconf || die "autoreconf failed"
}

src_compile() {
	cd "${S}"
	local myconf="$(use_enable pch)"

	if use contrib; then
		myconf="${myconf} --with-contrib-plugins=all"
	fi
	econf	--with-wx-config="${WX_CONFIG}" \
			--enable-dependency-tracking \
			$(use_enable debug) \
			$(use_enable static) \
			${myconf} || die "Died in action: econf ..."
	emake || die "Died in action: make ..."
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
