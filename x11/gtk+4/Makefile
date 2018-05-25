# $OpenBSD: Makefile,v 1.1.1.1 2018/05/24 15:54:09 ajacoutot Exp $

# XXX: PORTROACH is set at the end of this file to override gnome.port.mk
  
# XXX -Dman-pages=true yet no man page is built
# XXX add support for libcloudproviders? (-Denable-cloudproviders=true)

# Everything is a Freaking GLib/GTK+ problem
CFLAGS +=		-g
INSTALL_STRIP=		# empty

COMMENT-main=		multi-platform graphical toolkit
COMMENT-cups=		gtk+4 CUPS print backend
COMMENT-cloudprint=	gtk+4 Google Cloud Print backend
COMMENT-guic=		gtk+ icon theme caching utility

GNOME_PROJECT=		gtk+
GNOME_VERSION=		3.93.0

PKGNAME-main=		gtk+4-${GNOME_VERSION}
PKGNAME-cups=		gtk+4-cups-${GNOME_VERSION}
PKGNAME-cloudprint=	gtk+4-cloudprint-${GNOME_VERSION}
PKGNAME-guic=		gtk4-update-icon-cache-${GNOME_VERSION}

CATEGORIES=		x11 devel

SHARED_LIBS += gtk-4                     0.0 # 0.9300.0

HOMEPAGE=		http://www.gtk.org/

MAINTAINER=		Antoine Jacoutot <ajacoutot@openbsd.org>

# LGPLv2
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB +=		glib-2.0

MULTI_PACKAGES=		-main -cups -cloudprint -guic

MODULES=		devel/dconf \
			devel/meson \
			x11/gnome

BUILD_DEPENDS=		www/sassc

# x11/xkbcommon only needed for Wayland
LIB_DEPENDS-main=	${LIB_DEPENDS} \
			devel/pango \
			graphics/gdk-pixbuf2 \
			graphics/graphene \
			x11/gnome/at-spi2-atk
RUN_DEPENDS-main=	${RUN_DEPENDS}

# convenient dependency to prevent hunting what needs what:
# some apps need more icons than the stock ones
# some apps needs the svg version of the icon (librsvg pulled in)
RUN_DEPENDS-main +=	x11/gnome/adwaita-icon-theme

WANTLIB-main += ${WANTLIB}
WANTLIB-main += X11 Xcomposite Xcursor Xdamage Xext Xfixes Xi Xinerama
WANTLIB-main += Xrandr atk-1.0 atk-bridge-2.0 c cairo cairo-gobject
WANTLIB-main += epoxy fontconfig gdk_pixbuf-2.0 gio-2.0 gmodule-2.0
WANTLIB-main += gobject-2.0 graphene-1.0 harfbuzz intl m pango-1.0
WANTLIB-main += pangocairo-1.0 pangoft2-1.0

LIB_DEPENDS-cups=	${LIB_DEPENDS} \
			print/cups,-libs \
			${BASE_PKGPATH},-main=${GNOME_VERSION}
RUN_DEPENDS-cups=

WANTLIB-cups += ${WANTLIB}
WANTLIB-cups += cairo cups gio-2.0 gobject-2.0 gtk-4

LIB_DEPENDS-cloudprint=	${LIB_DEPENDS} \
			devel/json-glib \
			net/librest \
			${BASE_PKGPATH},-main=${GNOME_VERSION}
RUN_DEPENDS-cloudprint=

WANTLIB-cloudprint += ${WANTLIB}
WANTLIB-cloudprint += cairo gio-2.0 gobject-2.0 gtk-4 json-glib-1.0 rest-0.7

LIB_DEPENDS-guic=	graphics/gdk-pixbuf2
RUN_DEPENDS-guic=	x11/hicolor-icon-theme
                                                                                
# uses pledge()                                                                 
WANTLIB-guic += ${WANTLIB}
WANTLIB-guic += c gdk_pixbuf-2.0 intl

MODGNOME_TOOLS=		docbook gobject-introspection gtk-update-icon-cache \
			desktop-file-utils

TEST_IS_INTERACTIVE=	x11

CONFIGURE_ARGS=		-Denable-wayland-backend=false \
			-Denable-vulkan=no \
			-Dman-pages=true

# sync with devel/spidermonkey52: colord -> polkit -> spidermonkey52
# not for mips64el since there seems to be no colord pkg for it
.if ${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "amd64" || \
    ${MACHINE_ARCH} == "alpha" || ${MACHINE_ARCH} == "hppa" || \
    ${MACHINE_ARCH} == "powerpc" || ${MACHINE_ARCH} == "sparc64" || \
    ${MACHINE_ARCH} == "mips64"
LIB_DEPENDS-cups +=	graphics/colord
WANTLIB-cups +=	colord
.else
CONFIGURE_ARGS +=	-Denable-colord=false
.endif

pre-configure:
	${SUBST_CMD} ${WRKSRC}/modules/printbackends/meson.build

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/gtk+4
	mv ${WRKINST}${SYSCONFDIR}/gtk-4.0 ${PREFIX}/share/examples/gtk+4

.include <bsd.port.mk>

# Clear portroach annotation for we track an odd-numbered development branch
PORTROACH=