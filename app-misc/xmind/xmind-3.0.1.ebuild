#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
# $Id: xmind-3.0.1.ebuild 43 2008-12-27 04:31:01Z triobird $
#####################################################

inherit eutils fdo-mime gnome2-utils

MY_P=${PN}-linux_${PV}-1

DESCRIPTION="A brainstorming and mind mapping software."
HOMEPAGE="http://www.xmind.net"

SRC_URI="${MY_P}_i386.deb"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="gnome xfce"
RESTRICT="fetch"

DEPEND="app-arch/deb2targz"
RDEPEND="
	>=virtual/jre-1.5
	>=x11-libs/gtk+-2
	gnome? ( gnome-base/gconf )
"

S="${WORKDIR}"

pkg_nofetch(){
	elog "Download ${MY_P}_i386.deb from ${HOMEPAGE}"
	elog "and then put file(s) in ${DISTDIR}"
}

src_unpack(){
	deb2targz ${DISTDIR}/${MY_P}_i386.deb
	tar zxf ${DISTDIR}/${MY_P}_i386.tar.gz
}

pkg_preinst(){
	use gnome && gnome2_gconf_savelist
}

src_install(){
	insinto /opt
	doins -r usr/local/xmind
	chmod +x ${D}opt/xmind/xmind
	dobin ${FILESDIR}/xmind
	
	exeinto /usr/libexec
	doexe ${FILESDIR}/xmind-thumbnailer

	insinto /usr/share/pixmaps
	newins usr/local/xmind/xmind-logo-36.png xmind-logo.png
	
	insinto /usr/share/applications
	doins ${FILESDIR}/xmind.desktop
	
	insinto /usr/share/mime/packages
	doins ${FILESDIR}/xmind.xml

	if use gnome; then
		insinto /etc/gconf/schemas
		doins ${FILESDIR}/xmind.schemas
	fi
	if use xfce; then
		insinto /usr/share/thumbnailers
		doins ${FILESDIR}/xmind-thumbnailer.desktop
	fi
}

pkg_postinst()
{
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	use gnome && gnome2_gconf_install
	use xfce && elog  "Existing users need to run /usr/libexec/thunar-vfs-update-thumbnailers-cache-1."
}

pkg_prerm(){
	use gnome && gnome2_gconf_uninstall
}

pkg_postrm()
{
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}
