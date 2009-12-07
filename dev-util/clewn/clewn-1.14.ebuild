#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils vim-doc

DESCRIPTION="Clewn implements full gdb support in the vim editor."
HOMEPAGE="http://clewn.sourceforge.net"

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	>=sys-devel/gdb-6
	>=app-editors/gvim-7
"
RDEPEND="${DEPEND}"

src_compile() {
	econf vimdir=/usr/share/vim/vimfiles || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
	rm ${D}/usr/share/vim/vimfiles/doc/tags
}

pkg_postinst(){
	update_vim_helptags
}

pkg_postrm(){
	update_vim_helptags
}
