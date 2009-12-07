#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils

DESCRIPTION="IPmsg for linux"
HOMEPAGE="http://code.google.com/p/iptux/"

SRC_URI="http://iptux.googlecode.com/files/${P}-1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	>=x11-libs/gtk+-2
"
RDEPEND="${DEPEND}"

src_install(){
	make install DESTDIR=${D} || die "install failed"
}

pkg_postinst(){
	einfo "iptux uses TCP/UDP 2425, you should open them in your firewall"
}
