#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

PYTHON_SLOT_VERSION="2.5"

inherit distutils fdo-mime

DESCRIPTION="An IM for the WLM network."
HOMEPAGE="http://www.emesene.org"

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	dev-python/pygtk
"
RDEPEND="${DEPEND}"

src_install()
{
	local pylibdir=`python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()'`
	distutils_src_install --install-lib=${pylibdir}/${PN}
}

pkg_postinst()
{
	distutils_pkg_postinst
	fdo-mime_desktop_database_update
}

pkg_postrm()
{
	distutils_pkg_postrm
	fdo-mime_desktop_database_update
}

