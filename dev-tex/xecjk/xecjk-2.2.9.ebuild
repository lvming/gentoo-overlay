#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit texlive-common

DESCRIPTION="xeCJK for xelatex"
HOMEPAGE="http://bbs.ctex.org/viewthread.php?tid=40232&extra=page%3D1"

SRC_URI="${P}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="fetch"

DEPEND=""
RDEPEND="
	>=dev-texlive/texlive-xetex-2008
"

S="${WORKDIR}"

src_install(){
	insinto ${TEXMF_DIST_PATH}
	doins -r tex
	dodoc doc/xelatex/xecjk/xeCJK.pdf
}

pkg_postinst() {
	texconfig rehash	
}

pkg_postrm() {
	texconfig rehash
}


