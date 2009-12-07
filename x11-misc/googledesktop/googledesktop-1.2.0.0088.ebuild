#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: googledesktop-1.2.0.0088.ebuild 13 2008-12-01 09:18:15Z triobird $
#####################################################

inherit rpm

DESCRIPTION="Google Desktop for Linux"
HOMEPAGE="http://desktop.google.com/"
SRC_URI="http://dl.google.com/linux/rpm/stable/i386/google-desktop-linux-current.rpm"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	>=sys-libs/glibc-2.3.2
	>=x11-libs/gtk+-2.2.0
"

S=${WORKDIR}

src_unpack(){
	rpm_src_unpack ${A}
	cd ${S}
	sed -i 's#xdg_default_dirs=/usr/local/share/:/usr/share/#xdg_default_dirs=/usr/share/#' opt/google/desktop/bin/xdg-desktop-menu
}

src_install(){
	cd ${S}
	cp -r etc opt usr var ${D} || die "install failed"
}

pkg_postinst(){
	${ROOT}opt/google/desktop/bin/post_install.sh
	echo "Hidden=true" >> ${ROOT}etc/xdg/autostart/gdl_box.desktop
}

pkg_prerm(){
	${ROOT}opt/google/desktop/bin/pre_uninstall.sh
}
