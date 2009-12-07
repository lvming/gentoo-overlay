#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils fdo-mime

DESCRIPTION="A java bibliography reference manager."
HOMEPAGE="http://jabref.sourceforge.net"
SRC_URI="mirror://sourceforge/jabref/JabRef-${PV}.jar"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=virtual/jre-1.5
"

S="${WORKDIR}"

src_unpack(){
	cp ${DISTDIR}/JabRef-${PV}.jar ${S}
	jar xvf JabRef-${PV}.jar images/JabRef-icon-48.png
}

src_compile() {
	echo "pass"
}

src_install(){
	insinto /opt/jabref
	doins JabRef-${PV}.jar
	dosym JabRef-${PV}.jar /opt/jabref/JabRef.jar
	dobin ${FILESDIR}/jabref
	doicon images/JabRef-icon-48.png
	domenu ${FILESDIR}/jabref.desktop
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
