#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: pyNeighborhood-0.4.1.ebuild 39 2008-12-26 12:53:21Z triobird $
#####################################################

inherit eutils

DESCRIPTION="pyNeighborhood is GTK+ 2 rewrite of a well-known GTK+ 1 tool
LinNeighborhood."
HOMEPAGE="http://pyneighborhood.sourceforge.net/"

SRC_URI="mirror://sourceforge/pyneighborhood/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	dev-python/pygtk
	net-fs/samba
"
RDEPEND="${DEPEND}"

src_compile() {
	./configure --prefix=/usr || die "configure failed"
	make || die "make failed"
}

src_install(){
	make DESTDIR="${D}" install || die "make install failed"
}
