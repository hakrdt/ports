# $OpenBSD: pecl.port.mk,v 1.13 2018/12/12 23:46:18 sthen Exp $
# PHP PECL module

MODULES +=	lang/php

FLAVORS = php71 php72
FLAVOR ?= php71

# MODPECL_DEFAULTV is used in PLISTs so that @pkgpath markers are only
# applied for packages built against the "ports default" version of PHP,
# this allows updates from old removed versions without additional per-
# flavour PFRAG files.
.if ${FLAVOR} == php71
MODPHP_VERSION = 7.1
MODPECL_DEFAULTV = ""
.elif ${FLAVOR} == php72
MODPHP_VERSION = 7.2
MODPECL_DEFAULTV = "@comment "
.endif

CATEGORIES +=	www

_PECL_PREFIX =	pecl${MODPHP_VERSION:S/.//}
PKGNAME ?=	${_PECL_PREFIX}-${DISTNAME:S/pecl-//:L}
FULLPKGNAME ?=	${PKGNAME}
_PECLMOD ?=	${DISTNAME:S/pecl-//:C/-[0-9].*//:L}

SUBST_VARS +=	MODPECL_DEFAULTV

.if !defined(MASTER_SITES)
MASTER_SITES ?=	https://pecl.php.net/get/
HOMEPAGE ?=	https://pecl.php.net/package/${_PECLMOD}
EXTRACT_SUFX ?=	.tgz
.endif

# XXX CONFIGURE_STYLE would be nice but it can't be set here
AUTOCONF_VERSION ?= 2.62
AUTOMAKE_VERSION ?= 1.9

LIBTOOL_FLAGS += --tag=disable-static

DESTDIRNAME ?=	INSTALL_ROOT

BUILD_DEPENDS += www/pear \
	${MODGNU_AUTOCONF_DEPENDS} \
	${MODGNU_AUTOMAKE_DEPENDS}

MODPHP_DO_SAMPLE ?= ${_PECLMOD}
MODPHP_DO_PHPIZE ?= Yes

.if !target(do-test) && ${NO_TEST:L:Mno}
TEST_TARGET = test
TEST_FLAGS =  NO_INTERACTION=1
USE_GMAKE ?=  Yes
.endif
