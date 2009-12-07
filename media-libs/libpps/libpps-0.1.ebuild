#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

EAPI=2

inherit eutils

DESCRIPTION="Lib for ppstream"
HOMEPAGE="http://dl.pps.tv/"

SRC_URI="http://download.ppstream.com/linux/release_for_ubuntu.tgz -> ${PN}-${PV}.tgz http://download.ppstream.com/linux/sample.zip -> ${PN}-dev-${PV}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_prepare() {
	cd release_for_ubuntu
	tar zxf libs_for_ubuntu.tgz
#	sed -i "s#/root/pps/#/tmp//pps/#" libs/libppsapi.so.0.*
}

src_compile() {
	echo "Nothing to do"
}

src_install(){
	dolib release_for_ubuntu/libs/libpps*.so*
	insinto /etc
	doins release_for_ubuntu/ppscdn_config.ini
	insinto /usr/include
	doins sample/pps.h
	insinto /usr/share/doc/${P}/example
	doins sample/*
}

