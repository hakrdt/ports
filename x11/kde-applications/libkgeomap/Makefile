# $OpenBSD: Makefile,v 1.7 2018/12/18 09:39:21 rsadowski Exp $

COMMENT =		library for mapping photos on maps for KDE
DISTNAME =		libkgeomap-${VERSION}
REVISION =		3

SHARED_LIBS =		kgeomap		0.1

CATEGORIES =		geo graphics net

WANTLIB =  c iconv intl m pthread
WANTLIB += ${COMPILER_LIBCXX}
WANTLIB += QtDBus QtGui QtNetwork QtSvg QtXml
WANTLIB += ${KDE4LIB}/kdeui ${KDE4LIB}/kexiv2 ${KDE4LIB}/khtml
WANTLIB += ${KDE4LIB}/kio ${KDE4LIB}/kjs ${KDE4LIB}/kparts
WANTLIB += ${KDE4LIB}/nepomuk ${KDE4LIB}/nepomukutils
WANTLIB += ${KDE4LIB}/marblewidget
WANTLIB += soprano

LIB_DEPENDS =		${MODKDE4_DEP_DIR}/libkexiv2 \
			${MODKDE4_DEP_DIR}/marble

MODULES +=	x11/kde-applications \
		multimedia/phonon

MODKDE4_USE =		libs

# neede by kgeomap_test_itemmarkertiler
TEST_IS_INTERACTIVE =	X11

.include <bsd.port.mk>
