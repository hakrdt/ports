# $OpenBSD: Makefile,v 1.109 2018/10/24 14:28:09 sthen Exp $

# XXX: PORTROACH set below to override the value from gnome.port.mk

COMMENT=		people aggregation library

GNOME_PROJECT=		folks
GNOME_VERSION=		0.11.4
REVISION=		13

# MODULE_VERSION in config.h
API_V=			43

SHARED_LIBS +=  folks                5.5      # 43.3
SHARED_LIBS +=  folks-dummy          0.0      # 43.3
SHARED_LIBS +=  folks-telepathy      5.2      # 43.3
SHARED_LIBS +=  folks-eds            1.2      # 43.3

SUBST_VARS=		API_V

HOMEPAGE=		https://wiki.gnome.org/Projects/Folks

WANTLIB += ${COMPILER_LIBCXX} c camel-1.2 crypto curl curses db
WANTLIB += dbus-1 dbus-glib-1 ebackend-1.2 ebook-1.2 ebook-contacts-1.2
WANTLIB += edata-book-1.2 edataserver-1.2 ffi gck-1 gcr-base-3
WANTLIB += gcrypt gdata gee-0.8 gio-2.0 glib-2.0 gmodule-2.0 goa-1.0
WANTLIB += gobject-2.0 gpg-error gthread-2.0 iconv icudata icui18n
WANTLIB += icuuc intl json-glib-1.0 lzma m nghttp2 nspr4 nss3
WANTLIB += nssutil3 oauth p11-kit pcre plc4 plds4 readline secret-1
WANTLIB += smime3 soup-2.4 sqlite3 ssl ssl3 telepathy-glib xml2
WANTLIB += z

COMPILER =		base-clang ports-gcc base-gcc

MODULES=		devel/dconf \
			x11/gnome

LIB_DEPENDS=		databases/evolution-data-server \
			devel/libgee \
			net/telepathy/telepathy-glib

# needed at runtime by the telepathy backend (AccountManager)
RUN_DEPENDS=		net/telepathy/telepathy-mission-control

TEST_DEPENDS=		${FULLPKGNAME}:${BASE_PKGPATH}

MODGNOME_TOOLS +=	gobject-introspection vala

# requires libofono (not ported)
CONFIGURE_ARGS += 	--disable-ofono-backend

# no Bluez stack on OpenBSD
CONFIGURE_ARGS +=	--disable-bluez-backend

# https://git.gnome.org/browse/folks/commit/Makefile.am?id=8ebe13c457660de380521874a006425083151741
CONFIGURE_ARGS += 	--disable-fatal-warnings

post-install:
	rm ${PREFIX}/lib/folks/${API_V}/backends/*/*.{a,la}

.include <bsd.port.mk>

PORTROACH=	# empty
