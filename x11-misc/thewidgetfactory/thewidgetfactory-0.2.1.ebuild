#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: thewidgetfactory-0.2.1.ebuild 26 2008-12-16 06:03:56Z triobird $
#####################################################

inherit eutils

DESCRIPTION="A showcase for GTK+ widgets."
HOMEPAGE="http://www.stellingwerff.com/?page_id=10"

SRC_URI="http://www.stellingwerff.com/TheWidgetFactory/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	>=x11-libs/gtk+-2.4
"
RDEPEND="${DEPEND}"

src_install()
{
	emake install DESTDIR=${D} || die "install failed"
}


