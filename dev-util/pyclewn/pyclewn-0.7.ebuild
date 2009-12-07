#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

EAPI=2
PYTHON_MODNAME=clewn

inherit distutils vim-doc

DESCRIPTION="Pyclewn allows using vim as a front end to a debugger."
HOMEPAGE="http://pyclewn.sourceforge.net"

SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${P}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	app-editors/gvim
	sys-devel/gdb
"
DEPEND=""

src_prepare() {
	sed -i "/build_vimhelp/d" setup.py
}

pkg_postinst(){
	distutils_pkg_postinst
	update_vim_helptags
}

pkg_postrm(){
	distutils_pkg_postrm
	update_vim_helptags
}

