#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit gnome2

DESCRIPTION="A countdown timer applet for the GNOME panel."
HOMEPAGE="http://timerapplet.sourceforge.net"
SRC_URI="mirror://sourceforge/timerapplet/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="
	>=dev-lang/python-2.5
	>=dev-python/pygtk-2.10
	>=dev-python/notify-python-0.1
	>=dev-python/dbus-python-0.80
	>=gnome-base/gconf-2
	>=dev-python/gnome-applets-python-2.16
	>=dev-python/gst-python-0.10
"
RDEPEND="${DEPEND}"

