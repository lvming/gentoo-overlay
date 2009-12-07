#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

inherit eutils

DESCRIPTION="Google Chome web browser"
HOMEPAGE="http://dev.chromium.org/getting-involved/dev-channel"

SRC_URI="google-chrome-data.tar.lzma"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="fetch"

DEPEND="
	app-arch/lzma-utils
"
RDEPEND="${DEPEND}
	dev-libs/nss
	dev-libs/nspr
"

S="${WORKDIR}"

src_unpack() {
	unlzma -c ${DISTDIR}/${A} | tar xf -
	sed -i "s/lib32/lib/g" opt/google/chrome/google-chrome
}

src_compile() {
	true
}

src_install(){
	cp -r opt usr ${D}
	dodir /opt/google/chrome/lib
	dosym /usr/lib/nss/libnss3.so /opt/google/chrome/lib/libnss3.so.1d
	dosym /usr/lib/nss/libnssutil3.so /opt/google/chrome/lib/libnssutil3.so.1d
	dosym /usr/lib/nss/libsmime3.so /opt/google/chrome/lib/libsmime3.so.1d
	dosym /usr/lib/nss/libssl3.so /opt/google/chrome/lib/libssl3.so.1d
	dosym /usr/lib/nspr/libplds4.so /opt/google/chrome/lib/libplds4.so.0d
	dosym /usr/lib/nspr/libplc4.so /opt/google/chrome/lib/libplc4.so.0d
	dosym /usr/lib/nspr/libnspr4.so /opt/google/chrome/lib/libnspr4.so.0d
	domenu opt/google/chrome/google-chrome.desktop
}
