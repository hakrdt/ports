# $OpenBSD: Makefile,v 1.9 2018/06/29 22:16:28 espie Exp $

COMMENT =	kill-all-robots game for KDE
DISTNAME =	killbots-${MODKDE4_VERSION}
REVISION =	4

WANTLIB =  c m pthread
WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += lib/qt4/QtDBus lib/qt4/QtGui lib/qt4/QtSvg
WANTLIB += lib/qt4/QtXml
WANTLIB += ${KDE4LIB}/kdeui

MODKDE4_USE =	games

RUN_DEPENDS =	devel/desktop-file-utils \
		x11/gtk+3,-guic

.include <bsd.port.mk>
