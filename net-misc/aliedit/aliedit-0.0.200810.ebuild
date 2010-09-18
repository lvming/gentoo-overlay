#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils

DESCRIPTION="Alipay plugin for firefox"
HOMEPAGE="http://blog.alipay.com/301.html"

SRC_URI="http://blog.alipay.com/wp-content/2008/10/${PN}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_compile() {
	echo "nothing to compile"
}

src_install(){
	insinto /usr/lib/nsbrowser/plugins
	doins aliedit.so aliedit.xpt
}
