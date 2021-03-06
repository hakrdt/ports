# $OpenBSD: Makefile,v 1.68 2018/06/27 21:03:46 espie Exp $

COMMENT=	educational game for children

DISTNAME=	gcompris-17.05
EXTRACT_SUFX=	.tar.bz2
REVISION=	1

CATEGORIES=	games education

HOMEPAGE=	http://gcompris.net/

MAINTAINER=	Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv3
# SIL Open Font License (OFL)
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB += Xrandr Xrender atk-1.0 c cairo croco-0.6 expat ffi
WANTLIB += fontconfig freetype gdk-x11-2.0 gdk_pixbuf-2.0 gio-2.0
WANTLIB += glib-2.0 gmodule-2.0 gobject-2.0 graphite2 gstreamer-0.10
WANTLIB += gthread-2.0 gtk-x11-2.0 harfbuzz iconv intl lzma m
WANTLIB += pango-1.0 pangocairo-1.0 pangoft2-1.0 pcre pixman-1
WANTLIB += png pthread rsvg-2 sqlite3 util xcb xcb-render
WANTLIB += xcb-shm xml2 z
WANTLIB += ${MODPY_WANTLIB}

MASTER_SITES=	http://gcompris.net/download/gtk/src/

MODULES=	lang/python \
		textproc/intltool

BUILD_DEPENDS=	textproc/texi2html \
		x11/py-gtk2 \
		games/gnuchess \
		archivers/gtar

LIB_DEPENDS=	${MODPY_LIB_DEPENDS} \
		databases/sqlite3 \
		gstreamer->=0.10,<0.11:multimedia/gstreamer-0.10/core \
		x11/gnome/librsvg \
		x11/gtk+2

RUN_DEPENDS=	games/gnuchess \
		databases/py-sqlite \
		x11/py-gtk2 \
		games/tuxpaint \
		cad/gnucap \
		devel/desktop-file-utils \
		multimedia/gstreamer-0.10/plugins-base

USE_GMAKE=	Yes

CONFIGURE_STYLE=gnu
CONFIGURE_ENV=	CPPFLAGS="-I${X11BASE}/include -I${LOCALBASE}/include" \
		LDFLAGS="-L${X11BASE}/lib -L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--enable-py-build-only \
		--with-python=${MODPY_BIN}

# don't install under share/gnome/help/, there is no yelp (xml) file
FAKE_FLAGS=	gcompris_helpdir=${PREFIX}/share/doc/gcompris/html

pre-configure:
	${SUBST_CMD} ${WRKSRC}/src/chess_computer-activity/chess.c \
		${WRKSRC}/src/electric-activity/electric.py

post-install:
	rm ${PREFIX}/lib/gcompris/*.{a,la}
	find ${PREFIX}/share/gcompris -type f -perm 755 -exec chmod 644 {} \;
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/gcompris

.include <bsd.port.mk>
