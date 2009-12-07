#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

EAPI=2
inherit games

DESCRIPTION="A nes emulator."
HOMEPAGE="http://nestopia.sourceforge.net/"

SRC_URI="mirror://sourceforge/${PN}/Nestopia140src.zip -> ${P}.zip
http://rbelmont.mameworld.info/nst140_lnx_release_h.zip -> ${P}-linux.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
#RESTRICT="strip"

RDEPEND="
	>=media-libs/libsdl-1.2
	>=x11-libs/gtk+-2
"
DEPEND="${RDEPEND}"

#S="${WORKDIR}/${P}"

src_compile() {
	emake || die "emake failed"
}

src_install(){
	dogamesbin nst
	dodoc README.Linux
	insinto "/usr/share/${P}/"
	doins NstDatabase.xml nstcontrols
	domenu ${FILESDIR}/${PN}.desktop
	prepgamesdirs
}

pkg_postinst(){
	elog 'You should copy NstDatabase.xml nstcontrols to ~/.nestopia before run nestopia'
}


