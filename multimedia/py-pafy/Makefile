# $OpenBSD: Makefile,v 1.8 2018/11/26 09:27:03 ajacoutot Exp $

MODPY_EGG_VERSION =	0.5.4
COMMENT =	download YouTube content and retrieve metadata
DISTNAME =	pafy-${MODPY_EGG_VERSION}
PKGNAME =	py-pafy-${MODPY_EGG_VERSION}
CATEGORIES =	multimedia

# LGPLv3+
PERMIT_PACKAGE_CDROM =	Yes

MODULES =	lang/python
MODPY_SETUPTOOLS =	Yes
MODPY_PI =	Yes

MODPY_VERSION =	${MODPY_DEFAULT_VERSION_3}

BUILD_DEPENDS =		www/youtube-dl
RUN_DEPENDS =		www/youtube-dl

.include <bsd.port.mk>
