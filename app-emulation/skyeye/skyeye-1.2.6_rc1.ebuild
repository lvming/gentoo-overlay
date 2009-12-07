#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: skyeye-1.2.6_rc1.ebuild 3 2008-12-01 07:38:01Z triobird $
#####################################################

inherit eutils

DESCRIPTION="An ARM embedded hardware simulator."
HOMEPAGE="http://www.skyeye.org"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	sys-libs/ncurses
	media-libs/freetype
	>=x11-libs/gtk+-2
	>=dev-libs/glib-2
	x11-libs/pango
"
RDEPEND="${DEPEND}"

src_install(){
	dobin skyeye || die "skyeye install failed"
}
