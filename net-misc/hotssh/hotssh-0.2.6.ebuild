#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: hotssh-0.2.6.ebuild 33 2008-12-20 05:21:28Z triobird $
#####################################################

inherit eutils

DESCRIPTION="HotSSH is an interface to Secure Shell, for GNOME and OpenSSH."
HOMEPAGE="http://projects.gnome.org/hotssh/"

SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/hotssh/0.2/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	dev-lang/python
	net-misc/openssh
	dev-python/pygtk
"
RDEPEND="${DEPEND}"

src_compile() {
	./waf configure --prefix=/usr || "configure failed"
	./waf || "compile failed"
}
src_install(){
	./waf install --destdir=${D} || "install failed"
}
