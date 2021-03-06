# $OpenBSD: Makefile,v 1.24 2018/11/05 17:23:41 sthen Exp $

COMMENT-main =		tools to collect and process netflow data
COMMENT-nfprofile =	filters data from nfdump according to profiles

V =			1.6.17
GH_ACCOUNT =		phaag
GH_PROJECT =		nfdump
GH_TAGNAME =		v$V
FULLPKGNAME-main =	nfdump-$V
FULLPKGNAME-nfprofile =	nfprofile-$V

SHARED_LIBS +=	nfdump                    0.0 # 0.0

CATEGORIES =		net

MAINTAINER =		Stuart Henderson <sthen@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB =		bz2 c z

CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS +=	--enable-compat15 \
			--enable-ftconv \
			--enable-nfprofile \
			--enable-nftrack \
			--enable-nsel \
			--enable-sflow \
			--with-rrdpath=${LOCALBASE} \
			--with-ftpath=${LOCALBASE}

MULTI_PACKAGES =	-main -nfprofile

LIB_DEPENDS-main =	archivers/bzip2 \
			net/flow-tools>=0.68.5
WANTLIB-main =		${WANTLIB} ft

LIB_DEPENDS-nfprofile =	net/rrdtool \
			net/nfdump,-main
RUN_DEPENDS-nfprofile =	nfdump-$V:net/nfdump,-main

WANTLIB-nfprofile =  ${WANTLIB}
WANTLIB-nfprofile += X11 Xext Xrender cairo expat ffi fontconfig freetype
WANTLIB-nfprofile += glib-2.0 gobject-2.0 graphite2 gthread-2.0 harfbuzz
WANTLIB-nfprofile += iconv intl lzma m nfdump pango-1.0 pangocairo-1.0
WANTLIB-nfprofile += pangoft2-1.0 pcre pixman-1 png pthread rrd xcb
WANTLIB-nfprofile += xcb-render xcb-shm xml2

REORDER_DEPENDENCIES += ${PORTSDIR}/infrastructure/mk/automake.dep

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/nfdump
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/nfdump

CONFIGURE_ENV =		LDFLAGS="${LDFLAGS} -L${X11BASE}/lib" \
			ac_cv_path_DOXYGEN=
TEST_FLAGS =		TZ=CET

AUTOCONF_VERSION =	2.69
AUTOMAKE_VERSION =	1.15
BUILD_DEPENDS =		devel/libtool \
			${MODGNU_AUTOCONF_DEPENDS} \
			${MODGNU_AUTOMAKE_DEPENDS}

do-gen:
	cd ${WRKSRC}; AUTOCONF_VERSION=${AUTOCONF_VERSION} \
	    AUTOMAKE_VERSION=${AUTOMAKE_VERSION} ./autogen.sh

.include <bsd.port.mk>
