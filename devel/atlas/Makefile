# $OpenBSD: Makefile,v 1.30 2018/10/28 08:30:03 bentley Exp $

COMMENT=	C++ reference implementation of the Atlas protocol

VERSION=	0.4.3.1
DISTNAME=	Atlas-C++-${VERSION}
PKGNAME=	${DISTNAME:S/C++-//:L}
REVISION =	9
SHARED_LIBS +=	Atlas                2.0      # .1.1
SHARED_LIBS +=	AtlasObjects         2.0      # .1.1
SHARED_LIBS +=	AtlasObjectsEntity   2.0      # .1.1
SHARED_LIBS +=	AtlasObjectsOperation 2.0      # .1.1
SHARED_LIBS +=	AtlasMessage         2.0      # .1.1
SHARED_LIBS +=	AtlasCodecs          2.0      # .1.1
SHARED_LIBS +=	AtlasNet             2.0      # .1.1
SHARED_LIBS +=	AtlasFunky           2.0      # .1.1
CATEGORIES=	devel

MAINTAINER=	Peter Valchev <pvalchev@sightly.net>

PERMIT_PACKAGE_CDROM=   Yes

MASTER_SITES=	ftp://ftp.ecs.soton.ac.uk/pub/worldforge/acorn/0.4/src/ \
		http://kafka.i-site.com/~novalis/mirrors/acorn/0.4/src/

WANTLIB+=	m ${COMPILER_LIBCXX}

COMPILER =		base-clang ports-gcc base-gcc

SEPARATE_BUILD=	Yes
CONFIGURE_STYLE= gnu

.include <bsd.port.mk>
