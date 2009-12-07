#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils autotools

DESCRIPTION="FbTerm is a fast terminal emulator for linux with frame buffer
device."
HOMEPAGE="http://code.google.com/p/fbterm/"

SRC_URI="http://fbterm.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	media-libs/freetype
	media-libs/fontconfig
"
RDEPEND="${DEPEND}"

src_unpack(){
	unpack ${A}
	cd ${S}
	sed -i "/install-exec-hook/,$ d" src/Makefile.am
}

src_compile(){
	eautoreconf || die "eautoreconf failed"
	econf || die "econf failed"
}

src_install(){
	emake install DESTDIR=${D} || "install failed"
}

pkg_postinst(){
	setcap 'cap_sys_tty_config+ep' /usr/bin/fbterm
}
