# $OpenBSD: Makefile,v 1.41 2018/06/13 22:26:52 jeremy Exp $

COMMENT=	access a SQLite3 database from ruby

DISTNAME=	sqlite3-1.3.13
REVISION=	1
CATEGORIES=	databases

MAINTAINER =	Jeremy Evans <jeremy@openbsd.org>

HOMEPAGE=	https://github.com/sparklemotion/sqlite3-ruby

# BSD
PERMIT_PACKAGE_CDROM=	Yes

MODULES=		lang/ruby

WANTLIB=		sqlite3
LIB_DEPENDS=		databases/sqlite3

CONFIGURE_STYLE=	ruby gem ext

MODRUBY_TEST=	rake
TEST_DEPENDS=	devel/ruby-mocha,${MODRUBY_FLAVOR} \
			${FULLPKGNAME}:${BUILD_PKGPATH}

do-test:
	cd ${WRKSRC}/test && ${RUBY} -I . -rubygems -e \
		"require 'sqlite3'; Dir['test_*.rb'].each{|f| load(f)}"

.include <bsd.port.mk>
