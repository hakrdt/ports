# $OpenBSD: Makefile,v 1.19 2018/12/21 07:38:35 bentley Exp $

COMMENT=	portable lossless data compression library

DISTNAME=	ucl-1.03
REVISION=	3
CATEGORIES=	archivers devel
SHARED_LIBS +=	ucl                  1.0      # .1.0

HOMEPAGE=	https://www.oberhumer.com/opensource/ucl/

# GPLv2+
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	https://www.oberhumer.com/opensource/ucl/download/

.if ${MACHINE_ARCH} == "i386"
BUILD_DEPENDS=	devel/nasm
.endif

CONFIGURE_STYLE=	gnu
SEPARATE_BUILD=		Yes
CONFIGURE_ARGS+=	--enable-static
MODGNU_CONFIG_GUESS_DIRS=${WRKSRC}/acconfig
MAKE_FLAGS=		CFLAGS_O=""

do-test:
	${WRKBUILD}/examples/simple

.include <bsd.port.mk>
