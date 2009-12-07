#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit rpm fdo-mime

DESCRIPTION="QQ for linux"
HOMEPAGE="http://im.qq.com/qq/linux"
SRC_URI="http://dl_dir.qq.com/linuxqq/linuxqq-v1.0.2-beta1.i386.rpm"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RESTRICT="strip"

DEPEND=""
RDEPEND="${DEPEND}
	>=x11-libs/gtk+-2.10
"

S="${WORKDIR}"

src_install(){
	insinto /usr
	doins -r usr/share
	fperms +x /usr/share/tencent/qq/qq
	dobin usr/bin/qq
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}

