# $OpenBSD: Makefile,v 1.31 2018/01/22 21:40:32 kili Exp $

COMMENT =		parser and writer for config files

DISTNAME =		ConfigFile-1.1.4
REVISION =		8
CATEGORIES =		devel sysutils
HOMEPAGE =		https://github.com/jgoerzen/configfile/wiki

MAINTAINER =		David Coppa <dcoppa@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

MODGHC_PACKAGE_KEY =	FYFUJ30piBqKtBmw6DAzRo

RUN_DEPENDS +=		devel/hs-MissingH>=1.0.0 \
			devel/hs-mtl
BUILD_DEPENDS +=	${RUN_DEPENDS}

.include <bsd.port.mk>
