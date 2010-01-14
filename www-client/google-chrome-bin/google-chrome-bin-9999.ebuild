#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit rpm

DESCRIPTION="Google Chome web browser"
HOMEPAGE="http://www.google.com/chrome/"

SRC_URI="http://dl.google.com/linux/direct/google-chrome-beta_current_i386.rpm"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/nss
	dev-libs/nspr
"

S="${WORKDIR}"

src_install(){
	cp -r opt usr ${D}
	fperms 4755 /opt/google/chrome/chrome-sandbox
	dodir /opt/google/chrome/lib
	dosym /usr/lib/nss/libnss3.so /opt/google/chrome/lib/libnss3.so.1d
	dosym /usr/lib/nss/libnssutil3.so /opt/google/chrome/lib/libnssutil3.so.1d
	dosym /usr/lib/nss/libsmime3.so /opt/google/chrome/lib/libsmime3.so.1d
	dosym /usr/lib/nss/libssl3.so /opt/google/chrome/lib/libssl3.so.1d
	dosym /usr/lib/nspr/libplds4.so /opt/google/chrome/lib/libplds4.so.0d
	dosym /usr/lib/nspr/libplc4.so /opt/google/chrome/lib/libplc4.so.0d
	dosym /usr/lib/nspr/libnspr4.so /opt/google/chrome/lib/libnspr4.so.0d
	cp opt/google/chrome/product_logo_48.png opt/google/chrome/google-chrome.png
	doicon opt/google/chrome/google-chrome.png
	domenu opt/google/chrome/google-chrome.desktop
}
