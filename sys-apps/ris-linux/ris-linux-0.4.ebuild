#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: ris-linux-0.4.ebuild 15 2008-12-01 09:47:30Z triobird $
#####################################################

inherit eutils

DESCRIPTION="Windows Remote Installation Service for Linux"
HOMEPAGE="http://oss.netfarm.it/guides/"
SRC_URI="http://oss.netfarm.it/guides/${P}.tar.gz
http://dl.getdropbox.com/u/158632/ris-linux-utils.tar.gz
"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	dev-lang/python
"
RDEPEND="${RDEPEND}"

src_unpack() {
	unpack ${P}.tar.gz
	cd ${S}
	unpack ris-linux-utils.tar.gz
}

src_compile(){
	echo "nothing to do"
}

src_install(){
	dobin binlsrv.py fixloader.py fixup-repository.sh hexdump.py infdump.py
	dobin infparser.py modldr.py wspaste.py
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins winnt.sif winpe.sif patches/* devlist.cache nics.txt ntdetect.com setupldr.exe startrom.n12
}



