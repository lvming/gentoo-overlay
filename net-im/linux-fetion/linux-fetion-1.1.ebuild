#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils qt4

MY_P="linux_fetion_v${PV}"

DESCRIPTION="Fetion IM(China Mobile) for linux."
HOMEPAGE="http://www.libfetion.cn/"
SRC_URI="http://libfetion-gui.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	>=x11-libs/qt-gui-4.3
	>=x11-libs/qt-xmlpatterns-4.3
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_compile()
{
	qmake || die "qmake fail"
	make || die "make fail"
}

src_install()
{
	dobin ${PN}
	insinto /usr/share/pixmaps
	doins misc/fetion.png
	insinto /usr/share/libfetion
	doins -r skins faces_image fetion_utf8_CN.qm sound
	insinto /usr/share/applications
	doins misc/LibFetion.desktop
}
