#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: furiusisomount-0.11.1.0.ebuild 55 2008-12-31 13:26:10Z triobird $
#####################################################

inherit eutils

DESCRIPTION="An ISO, IMG, BIN, MDF and NRG Image management utility for the
Gnome Desktop Environment."
HOMEPAGE="http://www.marcus-furius.com/?page_id=14"

SRC_URI="http://www.marcus-furius.com/files/FuriusIsoMount/pyfuriusisomount/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	sys-fs/fuseiso
	dev-python/pygtk
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/PyFuriusIsoMount"

src_install(){
	insinto /usr/lib/${PN}
	doins -r pix res src
	dobin ${FILESDIR}/furiusisomount
	cp app.desktop furiusisomount.desktop
	domenu furiusisomount.desktop
}
