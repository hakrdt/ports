# $OpenBSD: Makefile,v 1.25 2018/01/22 21:42:27 kili Exp $

BROKEN-i386 =		needs a fixed rts/Linker.c in ghc

COMMENT =		functional graph library

# Dependency of meta/haskell-platform.
# Please do *not* update without thinking.
PORTROACH =		ignore:1

DISTNAME =		fgl-5.5.2.3
REVISION =		2
CATEGORIES =		devel

MAINTAINER =		Matthias Kilian <kili@openbsd.org>

# BSD3
PERMIT_PACKAGE_CDROM =	Yes

MODULES =		lang/ghc

MODGHC_BUILD =		cabal hackage haddock register

MODGHC_PACKAGE_KEY =	E6nTygjgXmbItPqw11u3Y

.include <bsd.port.mk>
