#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: multiget-1.2.0.ebuild 22 2008-12-07 13:12:17Z triobird $
#####################################################

WX_GTK_VER="2.8"

inherit wxwidgets

DESCRIPTION="MultiGet is an easy-to-use and open source file downloader."
HOMEPAGE="http://multiget.sourceforge.net"

SRC_URI="mirror://sourceforge/${PN}/${P}.src.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="=x11-libs/wxGTK-2.8*"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack(){
	unpack ${A}
	cd ${S}
	cp newicons/48/logo_48.xpm multiget.xpm
}

src_compile() {
	econf --with-wx-config=${WX_CONFIG} || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
	insinto /usr/share/applications
	doins ${FILESDIR}/multiget.desktop
	insinto /usr/share/pixmaps
	doins multiget.xpm
}
