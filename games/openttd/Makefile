# $OpenBSD: Makefile,v 1.61 2018/12/09 21:01:03 ajacoutot Exp $

# XXX fix build with icu >=5.9.1 (remove at next update?)
CXXFLAGS +=	-DU_USING_ICU_NAMESPACE=1

COMMENT=	open source clone of the game Transport Tycoon Deluxe

V =		1.8.0
DISTNAME =	openttd-$V-source
PKGNAME =	openttd-$V
REVISION =	4

CATEGORIES=	games

HOMEPAGE=	https://www.openttd.org/en/

MAINTAINER =	Anthony J. Bentley <anthony@anjbe.name>

# GPLv2 only
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += SDL c fontconfig freetype icudata icui18n icuuc
WANTLIB += lzma lzo2 m png pthread ${COMPILER_LIBCXX} xdg-basedir z

COMPILER =		base-clang ports-gcc base-gcc

MASTER_SITES=		https://binaries.openttd.org/releases/$V/

DIST_SUBDIR =		openttd

LIB_DEPENDS=		archivers/lzo2 \
			devel/sdl \
			graphics/png \
			textproc/icu4c \
			archivers/xz \
			x11/libxdg-basedir

RUN_DEPENDS =		audio/timidity \
			devel/desktop-file-utils \
			games/openttd-data/opengfx \
			games/openttd-data/openmsx \
			games/openttd-data/opensfx \
			x11/gtk+3,-guic

CONFIGURE_STYLE=	simple
CONFIGURE_ARGS+=	--prefix-dir=${PREFIX} \
			--binary-dir=bin \
			--data-dir=share/openttd \
			--icon-dir=share/pixmaps \
			--man-dir=man/man6 \
			--personal-dir=.openttd \
			--install-dir=${WRKINST} \
			--with-png \
			--with-zlib \
			--without-allegro \
			--without-libtimidity \
			--CFLAGS_BUILD="${CFLAGS}" \
			--disable-strip

MAKE_ENV+=		VERBOSE=1

USE_GMAKE=		Yes
NO_TEST=		Yes

DOCSDIR=		${PREFIX}/share/doc/openttd
EXAMPLESDIR=		${PREFIX}/share/examples/openttd
GAMEDIR=		${PREFIX}/share/openttd

FAKE_FLAGS=BUNDLE_DIR=${WRKINST}/bundle BUNDLES_DIR=${WRKINST}/bundle

WRKDIST =		${WRKDIR}/openttd-$V

post-install:
	${INSTALL_DATA_DIR} ${GAMEDIR}/media
	cd ${WRKSRC}/media/ && umask 022 && pax -rw . ${GAMEDIR}/media
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/bin/scripts/* ${EXAMPLESDIR}
	${INSTALL_DATA_DIR} ${DOCSDIR}
	cd ${WRKSRC}/docs/ && umask 022 && pax -rw . ${DOCSDIR}
	rm -rf ${WRKINST}/bundle
	rm -rf ${GAMEDIR}/media/openttd.desktop*

.include <bsd.port.mk>
