#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit gnome2

DESCRIPTION="Nautilus Plugin for Dropbox"
HOMEPAGE="http://www.getdropbox.com"
SRC_URI="https://www.getdropbox.com/download?dl=packages/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	>=x11-libs/gtk+-2.12
	>=dev-libs/glib-2.14
	>=gnome-base/nautilus-2.16
	>=x11-libs/libnotify-0
	>=net-misc/wget-1.10
	dev-python/docutils
"
RDEPEND="${DEPEND}"

