#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: unafold-3.6.ebuild 17 2008-12-01 11:12:50Z triobird $
#####################################################

inherit eutils

DESCRIPTION="unafold"
HOMEPAGE="http://www.bioinfo.rpi.edu/applications/mfold/"
SRC_URI="http://dinamelt.bioinfo.rpi.edu/download/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	virtual/glut
	media-libs/gd
	sci-visualization/gnuplot
	sci-biology/mfold_util
"
RDEPEND="${DEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
}
