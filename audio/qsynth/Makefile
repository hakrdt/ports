# $OpenBSD: Makefile,v 1.4 2018/11/25 22:33:58 sebastia Exp $

COMMENT =		Qt GUI Interface for FluidSynth

DISTNAME =		qsynth-0.5.3

CATEGORIES =		audio

HOMEPAGE =		https://qsynth.sourceforge.io

MAINTAINER=		Sebastian Reitenbach <sebastia@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		${MASTER_SITE_SOURCEFORGE:=qsynth/}

WANTLIB += ${COMPILER_LIBCXX} Qt5Core Qt5Gui Qt5Widgets X11 c
WANTLIB += m fluidsynth Qt5X11Extras

MODULES =		devel/cmake \
			x11/qt5

LIB_DEPENDS +=		audio/fluidsynth \
			x11/qt5/qtx11extras

RUN_DEPENDS +=		devel/desktop-file-utils \

NO_TEST =		Yes

BUILD_DEPENDS =		audio/fluidsynth

post-build:
	cp ${WRKSRC}/src/qsynth.desktop ${WRKBUILD}/src/

.include <bsd.port.mk>
