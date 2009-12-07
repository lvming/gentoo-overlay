#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils

DESCRIPTION="Sopcast Command line Version"
HOMEPAGE="http://www.sopcast.cn"
SRC_URI="http://download.sopcast.cn/download/sp-auth.tgz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPENT=""
RDEPEND="virtual/libstdc++"
RESTRICT="strip"

S="${WORKDIR}/sp-auth"

src_install(){
	dobin sp-sc-auth
	dosym sp-sc-auth /usr/bin/sp-sc
	dodoc Readme
}

