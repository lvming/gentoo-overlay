#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils fdo-mime

DESCRIPTION="XnView Multi Platform"
HOMEPAGE="http://newsgroup.xnview.com/viewforum.php?f=60"

SRC_URI="http://download.xnview.com/XnViewMP-linux.tgz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack ${A}
	cd ${S}
	cp ${FILESDIR}/xnview.sh XnViewMP/
	chmod +x XnViewMP/xnview.sh
}

src_compile() {
	echo "Nothing to do in src_compile."
}

src_install(){
	dodir /opt
	cp -r XnViewMP ${D}/opt
	dosym /opt/XnViewMP/xnview.sh /usr/bin/xnview
	doicon ${FILESDIR}/xnview.png
	domenu ${FILESDIR}/XnViewMP.desktop
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}

