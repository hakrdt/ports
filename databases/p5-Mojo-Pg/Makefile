# $OpenBSD: Makefile,v 1.3 2016/03/20 19:56:11 naddy Exp $

COMMENT =		dbd-pg wrapper for mojolicious

MODULES =		cpan databases/postgresql
PKG_ARCH =		*
DISTNAME =		Mojo-Pg-2.17
CATEGORIES =		databases
MAINTAINER =		Abel Abraham Camarillo Ojeda <acamari@verlet.org>

#Perl
PERMIT_PACKAGE_CDROM =	Yes

CPAN_AUTHOR =		SRI

RUN_DEPENDS =		databases/p5-DBD-Pg>=3.5.1 \
			www/p5-Mojo>=6

MODPOSTGRESQL_TEST_DBNAME =	testdb
TEST_FLAGS =		TEST_ONLINE=postgresql:///${MODPOSTGRESQL_TEST_DBNAME}

.include <bsd.port.mk>
