#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils

DESCRIPTION="A feature-rich dictionary lookup program."
HOMEPAGE="http://goldendict.berlios.de"

SRC_URI="http://download.berlios.de/${PN}/${PN}-${PV}-src-x11.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

DEPEND="
	media-libs/libvorbis
	sys-libs/zlib
	app-text/hunspell
	x11-proto/recordproto
	>=x11-libs/qt-gui-4.5
	>=x11-libs/qt-webkit-4.5
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-src"

src_compile() {
	PREFIX=/usr qmake || die "qmake failed"
	make  || die "make failed"
}

src_install(){
	make INSTALL_ROOT="${D}" install || die "make install failed"
}
