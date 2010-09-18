#####################################################
# gentoo-overlay ebuild
# http://git.com/lvming/gentoo-overlay.git
#####################################################

inherit eutils

DESCRIPTION="Add package description here."
HOMEPAGE="Add package homepage here."

SRC_URI="ftp://foo.bar.com/${P}.tar.gz"
#SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
#RESTRICT="strip"

RDEPEND=""
DEPEND="${RDEPEND}"

#S="${WORKDIR}/${P}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
}
