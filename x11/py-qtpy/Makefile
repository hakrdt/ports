# $OpenBSD: Makefile,v 1.7 2018/11/10 20:36:07 danj Exp $

COMMENT =		provides an abstraction layer of various Qt bindings

MODPY_EGG_VERSION =	1.5.2
DISTNAME =		QtPy-${MODPY_EGG_VERSION}
PKGNAME =		py-qtpy-${MODPY_EGG_VERSION}
CATEGORIES =		x11

HOMEPAGE =		https://github.com/spyder-ide/qtpy

MAINTAINER =		Elias M. Mariani <marianielias@gmail.com>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_SETUPTOOLS =	Yes

FLAVORS =		python3
FLAVOR ?=

TEST_DEPENDS +=		devel/py-mock${MODPY_FLAVOR} \
			devel/py-test${MODPY_FLAVOR} \
			x11/py-qt5${MODPY_FLAVOR}

TEST_IS_INTERACTIVE =	x11

# XXX fails with PORTS_PRIVSEP
do-test:
	cd ${WRKSRC}/qtpy/tests && ${MODPY_BIN} -m pytest

.include <bsd.port.mk>
