#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: emboss-explorer-2.2.0.ebuild 70 2009-02-16 07:11:19Z triobird $
#####################################################

inherit perl-module

DESCRIPTION="EMBOSS explorer is a web-based graphical user interface to the
EMBOSS suite of bioinformatics tools."
HOMEPAGE="http://embossgui.sourceforge.net/"

SRC_URI="mirror://sourceforge/embossgui/${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	dev-perl/MailTools
	dev-perl/Parse-RecDescent
"
RDEPEND="${DEPEND}
	sci-biology/emboss
"

S="${WORKDIR}/${PN}"

src_unpack() {
	perl-module_src_unpack
	cd ${S}
	epatch ${FILESDIR}/${P}.patch
}

src_install() {
	perl-module_src_install
	dobin bin/acdcheck bin/mkstatic
	exeinto /usr/lib/cgi-bin
	doexe cgi/emboss
	insinto /etc/${PN}
	doins ${FILESDIR}/emboss-explorer.conf
	insinto /usr/share/${PN}
	doins -r html
	dosym /var/tmp/${PN}/output /usr/share/${PN}/html/output
	dosym /usr/share/EMBOSS/doc/programs/html /usr/share/${PN}/html/manual
}

pkg_postinst() {
	ewarn "To make emboss-explorer work, you should config httpd"
	ewarn "(e.g. apache or lighttpd):"
	ewarn
	ewarn "add following url alias in your httpd config"
	ewarn "    /cgi-bin/  =>  /usr/lib/cgi-bin/"
	ewarn "    /emboss-explorer/  => /usr/share/emboss-explorer/html/"
	ewarn "enable follow symlinks in /emboss-explorer/"
	ewarn "and make /var/tmp/${PN}/output writable by httpd user"
}




