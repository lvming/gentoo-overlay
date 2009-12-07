#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

EAPI=2

inherit eutils

DESCRIPTION="A complete cross development package or 65(C)02 systems."
HOMEPAGE="http://www.cc65.org"

SRC_URI="ftp://ftp.musoftware.de/pub/uz/cc65/cc65-sources-${PV}.tar.bz2"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"
RESTRICT="mirror"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( app-text/linuxdoc-tools )
"

#S="${WORKDIR}/${P}"

src_prepare() {
	sed -i '/^prefix/cprefix\t\t?= /usr' make/gcc.mak
}

src_compile() {
	make -f make/gcc.mak bins libs || die "make bins libs failed"
	if use doc; then
		make -f make/gcc.mak docs || die "make docs failed"
	fi
}

src_install(){
	for f in ar65 ca65 ca65html cc65 cl65 co65 da65 ld65 od65 grc
	do
		dobin src/$f/$f
	done
	
	CC65_HOME=/usr/lib/cc65

	insinto ${CC65_HOME}
	doins -r asminc include
	
	insinto ${CC65_HOME}/lib
	doins libsrc/*.lib
	
	insinto ${CC65_HOME}/obj
	doins libsrc/*-*.o

	for d in emd joy mou ser tgi
	do
		insinto ${CC65_HOME}/$d
		doins libsrc/*.$d
	done

	insinto /usr/lib/cc65/cfg
	doins src/ld65/cfg/*-*.cfg

	insinto /usr/share/doc/${P}
	doins src/ca65/macpack/*.mac doc/readme.1st doc/compile.txt doc/CREDITS doc/BUGS doc/internal.txt doc/newvers.txt
	if use doc; then
		doins doc/*.htm*
	fi
}




