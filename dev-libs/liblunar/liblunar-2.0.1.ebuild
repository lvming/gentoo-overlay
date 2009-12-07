#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils

DESCRIPTION="Library for chinese lunar calendar."
HOMEPAGE="http://code.google.com/p/liblunar/"

SRC_URI="http://liblunar.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="gtk python"
RESTRICT="mirror"

RDEPEND="
	>=dev-libs/glib-2
	gtk? (
		>=x11-libs/gtk+-2
		python? (
			>=dev-lang/python-2.3
			>=dev-python/pygobject-2
			>=dev-python/pygtk-2
			>=dev-python/pygtksourceview-2
		)
	)
"
DEPEND="${RDEPEND}"

#S="${WORKDIR}/${P}"

src_compile() {
	myconf="$(use_enable gtk)"
	use gtk && myconf="$myconf $(use_enable python)"
	econf ${myconf} || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
}
