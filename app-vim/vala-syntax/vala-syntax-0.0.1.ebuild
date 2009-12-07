#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

EAPI=2

inherit eutils vim-plugin

DESCRIPTION="VIM syntax for vala"
HOMEPAGE="http://live.gnome.org/Vala/Vim"

SRC_URI="http://live.gnome.org/Vala/Vim?action=AttachFile&do=get&target=vala.vim -> vala.vim"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="mirror"

S="${WORKDIR}"

src_unpack() {
	cp ${DISTDIR}/vala.vim .
}

src_prepare() {
	mkdir -p syntax
	mv vala.vim syntax
	mkdir -p ftdetect
	cat > ftdetect/vala.vim <<EOF
au BufNewFile,BufRead *.vala set filetype=vala
au BufNewFile,BufRead *.vapi set filetype=vala
EOF
	mkdir -p ftplugin
	cat > ftplugin/vala.vim <<EOF
setlocal efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
EOF
}
