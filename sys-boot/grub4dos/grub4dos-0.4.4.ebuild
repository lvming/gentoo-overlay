#####################################################
# triobird-overlay ebuild
# $HeadURL: http://code.google.com/p/triobird-overlay/$
#####################################################

inherit eutils

DESCRIPTION="Grub4DOS"
HOMEPAGE="https://gna.org/projects/grub4dos http://grub4dos.sourceforge.net/wiki/index.php/Main_Page"
SRC_URI="http://download.gna.org/${PN}/${PN}-${PV}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

RDEPEND=""

DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
}

src_compile() {
	true
}

src_install() {
	dosbin bootlace.com
	dodoc COPYING README_GRUB4DOS.txt ChangeLog_GRUB4DOS.txt
	dodir /usr/lib/${PN}
	insinto /usr/lib/${PN}
	doins config.sys default menu.lst grub.pif grldr grub.exe grldr.mbr hmload.com
	insinto /boot
	doins grub.exe
}

