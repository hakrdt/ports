# $OpenBSD: Makefile,v 1.12 2018/09/20 11:16:59 robert Exp $

COMMENT=		MATE terminal

MATE_PROJECT=		mate-terminal
MATE_VERSION=		1.20.1

# GPLv3+
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB += ICE SM X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi
WANTLIB += Xinerama Xrandr Xrender c dconf epoxy expat ffi fontconfig
WANTLIB += freetype gio-2.0 glib-2.0 gmodule-2.0 gobject-2.0 gthread-2.0
WANTLIB += iconv intl m pcre pixman-1 pthread xcb
WANTLIB += xcb-render xcb-shm z
WANTLIB += atk-1.0 atk-bridge-2.0 atspi cairo-gobject cairo dbus-1
WANTLIB += gdk-3 gdk_pixbuf-2.0 gmp gnutls graphite2 gtk-3 harfbuzz
WANTLIB += hogweed idn2 nettle p11-kit pango-1.0 pangocairo-1.0
WANTLIB += pangoft2-1.0 png tasn1 unistring vte-2.91 pcre2-8
WANTLIB += fribidi

MODULES=		devel/dconf \
			x11/gnome

BUILD_DEPENDS=		devel/gsettings-desktop-schemas
RUN_DEPENDS=		devel/gsettings-desktop-schemas \
			x11/mate/desktop

LIB_DEPENDS=		devel/vte3

MODGNOME_TOOLS=		desktop-file-utils yelp

CONFIGURE_STYLE=	gnu

.include <bsd.port.mk>
