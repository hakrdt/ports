# $OpenBSD: Makefile,v 1.140 2018/11/24 20:16:33 ajacoutot Exp $

GOFFICE_API_VERSION=	0.10
GOFFICE_VERSION=	0.10.44

COMMENT=		spreadsheet application for GNOME

GNOME_PROJECT=		gnumeric
GNOME_VERSION=		1.12.44

GNUMERIC_API_VERSION=	${GNOME_VERSION:R}
SUBST_VARS=		GNOME_VERSION GOFFICE_GNOME_VERSION GOFFICE_API_VERSION GNUMERIC_API_VERSION

CATEGORIES=    		math

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender atk-1.0 atk-bridge-2.0
WANTLIB += atspi avahi-common bz2 c cairo cairo-gobject croco-0.6
WANTLIB += dbus-1 epoxy expat ffi fontconfig freetype gdk-3 gdk_pixbuf-2.0
WANTLIB += gio-2.0 glib-2.0 gmodule-2.0 gmp gobject-2.0 goffice-0.10
WANTLIB += graphite2 gs gsf-1 gthread-2.0 gtk-3 harfbuzz hogweed
WANTLIB += iconv idn2 intl jpeg lzma m nettle p11-kit pango-1.0
WANTLIB += pangocairo-1.0 pangoft2-1.0 pcre perl pixman-1 png
WANTLIB += pthread rsvg-2 spectre tasn1 unistring xcb xcb-render
WANTLIB += xcb-shm xml2 xslt z fribidi

MODULES=		devel/dconf \
			x11/gnome

LIB_DEPENDS=		devel/goffice=${GOFFICE_VERSION}

MODGNOME_TOOLS += desktop-file-utils gobject-introspection gtk-update-icon-cache
MODGNOME_TOOLS += yelp

CONFIGURE_STYLE=	gnu
CONFIGURE_ARGS=		--without-gda \
			--without-psiconv \
			--without-paradox \
			--without-python

post-install:
	rm ${PREFIX}/lib/goffice/${GOFFICE_API_VERSION}/plugins/gnumeric/gnumeric.{a,la}
	rm ${PREFIX}/lib/gnumeric/${GNOME_VERSION}/plugins/*/*.{a,la}

.include <bsd.port.mk>
