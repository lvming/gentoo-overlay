#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils

DESCRIPTION="Java-based build tool similar to 'make' that uses XML configuration files."
HOMEPAGE="http://ant.apache.org/"

SRC_URI="http://www.apache.org/dist/ant/binaries/apache-ant-${PV}-bin.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND=">=virtual/jdk-1.5"
DEPEND="${RDEPEND}"

S="${WORKDIR}/apache-ant-${PV}"

src_compile() {
	true
}

src_install(){
	dodir /opt/ant-${PV}/
	cp -r * ${D}opt/ant-${PV}/
	echo "PATH=\"/opt/ant-${PV}/bin\"" > 99ant
	doenvd 99ant
}

pkg_postinst(){
	env-update && source /etc/profile
}

pkg_postrm(){
	env-update && source /etc/profile
}
