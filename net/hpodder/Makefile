# $OpenBSD: Makefile,v 1.37 2016/09/23 09:16:56 sthen Exp $

COMMENT =		command line podcast aggregator

DISTNAME =		hpodder-1.1.6
REVISION =		14
CATEGORIES =		net
HOMEPAGE =		https://github.com/jgoerzen/hpodder/wiki

MAINTAINER =		David Coppa <dcoppa@openbsd.org>

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB =		c iconv m pthread sqlite3 util

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage nort

LIB_DEPENDS =		converters/libiconv \
			databases/sqlite3

BUILD_DEPENDS =		devel/hs-ConfigFile \
			devel/hs-mtl \
			devel/hs-network-uri \
			textproc/hs-HaXml>=1.22 \
			databases/hs-HDBC-sqlite3>=1.1.0
RUN_DEPENDS =		net/curl>=7.15.5 \
			audio/py-mutagen>=1.9

post-install:
	${INSTALL_MAN} ${FILESDIR}/hpodder.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
