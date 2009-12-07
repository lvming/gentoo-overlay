#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

EAPI=2

inherit eutils

DESCRIPTION="JoomlaPack jpa archive utilities."
HOMEPAGE="http://joomlapack.net"

SRC_URI="http://joomlacode.org/gf/download/frsrelease/10889/43175/jpautils-2.3.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
#RESTRICT="strip"

RDEPEND="
	dev-lang/php[cli]
"
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	sed -i -e "1c\#\!/usr/bin/env php" *.php
}

src_compile() {
	echo "nothing to do."
}

src_install(){
	dobin *.php
}
