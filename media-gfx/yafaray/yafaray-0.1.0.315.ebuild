#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils

DESCRIPTION="YafaRay is a open source raytracing render engine."
HOMEPAGE="http://www.yafaray.org"

SRC_URI="http://www.yafaray.org/sites/default/files/download/builds/YafaRay-${PV}.zip http://www.yafaray.org/sites/default/files/download/builds/YafaRay-blender-${PV}.zip"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="openexr qt"

DEPEND="
	>=dev-util/scons-0.97
	sys-libs/zlib
	media-libs/libpng
	media-libs/jpeg
	dev-libs/libxml2
	>=media-libs/freetype-2
	dev-lang/swig
	openexr? ( media-libs/openexr )
	qt? ( >=x11-libs/qt-4 )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/qt.patch
	epatch ${FILESDIR}/pluginpath.patch
}

src_compile() {
	echo "PREFIX = '$D/usr'" > user-config.py
	use openexr ||  echo "WITH_YF_EXR='false'" >> user-config.py
	use qt &&  echo -e "WITH_YF_QT='true'\nYF_QTDIR='/usr'" >> user-config.py
	scons  build || "compile failed"
	scons  swig || "compile failed"
}

src_install(){
	scons install || "install failed"
	insinto /usr/share/blender/scripts
	doins ../yafaray-blender/yafaray_ui.py
	insinto /usr/share/yafaray/blender
	doins ../yafaray-blender/yaf_*.py build/bindings/*.py build/bindings/*.so
}
