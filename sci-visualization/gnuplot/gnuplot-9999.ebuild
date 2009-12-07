#####################################################
# triobird-overlay ebuild
# http://triobird-overlay.googlecode.com
#####################################################

WX_GTK_VER="2.8"
ECVS_CVS_OPTIONS="-f"

inherit elisp-common eutils cvs wxwidgets

ECVS_AUTH="pserver"
ECVS_SERVER="gnuplot.cvs.sourceforge.net:/cvsroot/gnuplot"
ECVS_MODULE="gnuplot"
ECVS_LOCALNAME="gnuplot"

DESCRIPTION="Command-line driven interactive plotting program"
HOMEPAGE="http://www.gnuplot.info"
SRC_URI=""

LICENSE="gnuplot"
SLOT="0"
KEYWORDS="~x86"
IUSE="cairo doc emacs gd latex lua pdf plotutils readline svga wxwindows X"

DEPEND="
	cairo? ( x11-libs/cairo )
	emacs? ( virtual/emacs )
	gd? ( media-libs/gd )
	lua? ( dev-lang/lua )
	pdf? ( media-libs/pdflib )
	plotutils? ( media-libs/plotutils )
	readline? ( >=sys-libs/readline-4.2 )
	svga? ( media-libs/svgalib )
	wxwindows? ( =x11-libs/wxGTK-2.8* )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${ECVS_LOCALNAME}"
E_SITEFILE=50${PN}-gentoo.el
TEXMF=/usr/share/texmf-site

src_compile() {

	if use latex ; then
		sed -i -e "s:\`kpsexpand.*\`:${TEXMF}/tex/latex/${PN}:" \
		share/LaTeX/Makefile.am || die
	else
		sed -i \
		-e '/^SUBDIRS/ s/LaTeX//' share/Makefile.am || die
	fi
	
	./prepare || die "prepare failed"
	
	local myconf=""
	
	myconf="${myconf} $(use_with X x)"
	myconf="${myconf} $(use_with cairo)"
	myconf="${myconf} $(use_with doc tutorial)"
	myconf="${myconf} $(use_with gd)"
	myconf="${myconf} $(use_with lua)"
	myconf="${myconf} $(use_with pdf pdf /usr/$(get_libdir))"
	myconf="${myconf} $(use_with plotutils plot /usr/$(get_libdir))"
	use readline \
		&& myconf="${myconf} --with-readline=gnu --enable-history-file" \
		|| myconf="${myconf} --with-readline"
	myconf="${myconf} $(use_with svga linux-vga)"
	myconf="${myconf} $(use_enable wxwindows wxwidgets)"
	myconf="${myconf} --without-lisp-files"

	TEMACS=no
	use emacs && TEMACS=emacs
	EMACS=${TEMACS}	econf ${myconf} || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
     if use emacs; then
		 cd lisp
		 einfo "Configuring gnuplot-mode for GNU Emacs..."
		 EMACS="emacs" econf --with-lispdir="${SITELISP}/${PN}" || die
		 emake DESTDIR="${D}" install || die
		 emake clean
		 cd ..

		 # Gentoo emacs site-lisp configuration
		 echo -e "\n;;; ${PN} site-lisp configuration\n" > ${E_SITEFILE}
		 echo -e "(add-to-list 'load-path \"@SITELISP@\")\n" >> ${E_SITEFILE}
		 sed '/^;; move/,+3 d' lisp/dotemacs >> ${E_SITEFILE}
		 elisp-site-file-install ${E_SITEFILE}
	 fi
}

pkg_postinst() {
	use emacs && elisp-site-regen
	use latex && latex_rehash
}

pkg_postrm() {
	use emacs && elisp-site-regen
	use latex && latex_rehash
}

