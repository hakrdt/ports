# $OpenBSD: Makefile,v 1.5 2018/06/29 22:16:14 espie Exp $

COMMENT =		clone of the touhou games

V =			1.0a
DISTNAME =		taisei-$V
REVISION =		3

CATEGORIES =		games

HOMEPAGE =		http://taisei-project.org/

# MIT
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += GL GLU SDL SDL_ttf alut c freetype m openal png pthread
WANTLIB += z

GH_ACCOUNT =		laochailan
GH_PROJECT =		taisei
GH_TAGNAME =		v$V

CFLAGS +=	-fgnu89-inline
MODULES =		devel/cmake
RUN_DEPENDS =		devel/desktop-file-utils \
			x11/gtk+3,-guic
LIB_DEPENDS =		audio/freealut \
			audio/openal \
			devel/sdl-ttf \
			graphics/png

NO_TEST =		Yes

.include <bsd.port.mk>
