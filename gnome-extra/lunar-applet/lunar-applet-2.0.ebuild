#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit gnome2

DESCRIPTION="lunar-applet displays the Chinese lunar calendar and the current date and time as an applet for the GNOME panel."
HOMEPAGE="http://code.google.com/p/lunar-applet/"

SRC_URI="http://lunar-applet.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="eds"
RESTRICT="mirror"

RDEPEND="
	${RDEPEND}
	>=gnome-base/gnome-applets-2
	dev-libs/liblunar
	eds? ( >=gnome-extra/evolution-data-server-2 )
"
DEPEND="${RDEPEND}"

src_compile() {
	myconf="$(use_enable eds)"
	econf ${myconf} || die "econf failed"
	emake || die "emake failed"
}

#src_install(){
#	emake DESTDIR="${D}" install || die "emake install failed"
#}
