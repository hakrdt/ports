# $OpenBSD: Makefile,v 1.12 2016/03/20 19:57:15 naddy Exp $

COMMENT=		universal forwarder for catalyst applications

MODULES=		cpan
PKG_ARCH=		*
DISTNAME=		Catalyst-Plugin-Pluggable-0.04
REVISION =		2
CATEGORIES=		www devel

# same as perl
PERMIT_PACKAGE_CDROM=	Yes

RUN_DEPENDS=		www/p5-Catalyst-Runtime

MAKE_ENV=		TEST_POD=Yes

.include <bsd.port.mk>
