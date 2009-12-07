#####################################################
# triobird-overlay ebuild
# URL: http://code.google.com/p/triobird-overlay/
#####################################################

inherit eutils rpm fdo-mime

DESCRIPTION="Picasa 3.0 for linux."
HOMEPAGE="http://picasa.google.com/linux/"

SRC_URI="http://dl.google.com/linux/rpm/testing/i386/picasa-3.0-current.i386.rpm"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="strip"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install(){
	cd opt
	dodir /opt
	cp -r google $D/opt
	dosym /opt/google/picasa/3.0/bin/picasa /usr/bin/picasa
	dosym /opt/google/picasa/3.0/bin/picasafontcfg /usr/bin/picasafontcfg
	dosym /opt/google/picasa/3.0/lib/npPicasa3.so /usr/lib/nsbrowser/plugins/npPicasa3.so
	cd google/picasa/3.0/desktop
	doicon picasa.xpm picasa-fontcfg.xpm
	cp picasa.desktop.template picasa.desktop
	cp picasa-fontcfg.desktop.template picasa-fontcfg.desktop
	sed -i "s/EXEC/picasa/" picasa.desktop
	sed -i "s/ICON/picasa/" picasa.desktop
	sed -i "s/EXEC/picasafontcfg/" picasa-fontcfg.desktop
	sed -i "s/ICON/picasa-fontcfg/" picasa-fontcfg.desktop
	echo "Categories=Graphics;" >> picasa.desktop
	echo "Categories=Graphics;" >> picasa-fontcfg.desktop
	domenu picasa.desktop picasa-fontcfg.desktop
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}

