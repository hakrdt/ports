# $OpenBSD: Makefile,v 1.3 2017/10/20 20:26:53 jca Exp $

COMMENT=	implementation of IDNA2008 internationalized domain names

DISTNAME=	libidn2-2.0.0
REVISION=	0
CATEGORIES=	devel
HOMEPAGE=	https://www.gnu.org/software/libidn/\#libidn2

SHARED_LIBS=	idn2	1.0	# 3.0

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv3+
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	https://alpha.gnu.org/gnu/libidn/
EXTRACT_SUFX=	.tar.xz

WANTLIB=	c iconv unistring

LIB_DEPENDS=	converters/libunistring

CONFIGURE_STYLE=gnu
CONFIGURE_ARGS=	--disable-nls
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/build-aux

.include <bsd.port.mk>
