# $OpenBSD: Makefile,v 1.2 2018/10/20 14:12:15 naddy Exp $

COMMENT=	high-level API for encoding .opus files

DISTNAME=	libopusenc-0.2.1
SHARED_LIBS=	opusenc		0.0	# 4.2
CATEGORIES=	audio

HOMEPAGE=	https://opus-codec.org/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# BSD
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=	m opus

MASTER_SITES=	https://archive.mozilla.org/pub/opus/

LIB_DEPENDS=	audio/opus

USE_GMAKE=	Yes
CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--disable-maintainer-mode	# avoid autotools cascade
CONFIGURE_ARGS+=--disable-doc			# requires doxygen

.include <bsd.port.mk>
