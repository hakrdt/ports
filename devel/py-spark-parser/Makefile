# $OpenBSD: Makefile,v 1.7 2018/02/27 21:47:38 espie Exp $

COMMENT =		early-algorithm context-free grammar parser

MODPY_EGG_VERSION =	1.6.1
DISTNAME =		spark_parser-${MODPY_EGG_VERSION}
PKGNAME =		py-spark-parser-${MODPY_EGG_VERSION}
CATEGORIES =		devel
REVISION =		0

HOMEPAGE =		https://github.com/rocky/python-spark/

MAINTAINER =		Alexandr Shadchin <shadchin@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/python

MODPY_PI =		Yes
MODPY_SETUPTOOLS =	Yes

RUN_DEPENDS =		devel/py-click${MODPY_FLAVOR}
TEST_DEPENDS =		devel/py-nose${MODPY_FLAVOR}

FLAVORS =		python3
FLAVOR ?=

post-install:
	mv ${PREFIX}/bin/spark-parser-coverage{,${MODPY_BIN_SUFFIX}}

do-test:
	cd ${WRKSRC} && ${LOCALBASE}/bin/nosetests${MODPY_BIN_SUFFIX} test/*.py

.include <bsd.port.mk>
