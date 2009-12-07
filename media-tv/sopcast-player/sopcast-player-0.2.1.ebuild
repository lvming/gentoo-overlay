#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils

DESCRIPTION="SopCast GUI front-end"
HOMEPAGE="http://code.google.com/p/sopcast-player/"

SRC_URI="http://sopcast-player.googlecode.com/files/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	dev-python/pygtk
	>=media-video/vlc-0.9.0
"
RDEPEND="
	${DEPEND}
	media-tv/sp-auth
"

S="${WORKDIR}/${PN}"

src_compile() {
	make all || "compile failed"
}

src_install(){
	make install-all DESTDIR=${D} || "install failed"
}
