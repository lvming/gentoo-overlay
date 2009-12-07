#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils

DESCRIPTION="usmb lets you mount SMB shares as unprivileged users via FUSE, in
the vein of Windows’ Map Network Drive facility."
HOMEPAGE="http://ametros.net/code.html"

SRC_URI="http://ametros.net/downloads/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
#RESTRICT="strip"

DEPEND="
	dev-libs/libxml2
	>=sys-fs/fuse-2.6
	>=net-fs/samba-3.0
"
RDEPEND="${DEPEND}"

#S="${WORKDIR}/${P}"

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i "s#^SAMBA = .*#SAMBA = /usr#" Makefile
	sed -i "s#^PREFIX = .*#PREFIX = /usr#" Makefile
}

src_compile() {
	emake || die "emake failed"
}

src_install(){
	dobin usmb
	dodoc README
	newdoc usmb.conf usmb.conf.example
}
