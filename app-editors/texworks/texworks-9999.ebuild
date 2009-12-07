#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils subversion fdo-mime

ESVN_REPO_URI="http://texworks.googlecode.com/svn/trunk"

DESCRIPTION="A TeX editor."
HOMEPAGE="http://www.tug.org/texworks/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>=x11-libs/qt-4.3.2
	>=app-text/poppler-0.8.0
	>=app-text/poppler-bindings-0.8.0
	>=app-text/hunspell-1.2.2
"
RDEPEND="${DEPEND}"

pkg_setup() {
	if  ! built_with_use "app-text/poppler-bindings" qt4 ;then
		eerror "You should build app-text/poppler-binding with \"qt4\" USE flag."
		die "app-text/poppler-bindings build with \"-qt4\" USE"
	fi
}
src_compile() {
	qmake || die "qmake failed"
	make || die "make failed"
}

src_install() {
	dobin texworks
	insinto /usr/share/pixmaps
	newins res/images/appicon.png texworks.png
	insinto /usr/share/applications
	doins ${FILESDIR}/texworks.desktop
	dosym /usr/share/myspell /usr/share/myspell/dicts
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}
pkg_postrm() {
	fdo-mime_desktop_database_update
}
