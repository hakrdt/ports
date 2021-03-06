# $OpenBSD: Makefile,v 1.49 2018/10/23 01:03:17 danj Exp $

# optional dependencies
# py-pyrax

COMMENT =	encrypted backup using rsync algorithm

MODPY_EGG_VERSION = 0.7.18.2
DISTNAME =	duplicity-${MODPY_EGG_VERSION}

CATEGORIES =	sysutils

HOMEPAGE =	http://www.nongnu.org/duplicity/

MASTER_SITES =	${MASTER_SITE_SAVANNAH:=duplicity/}

# GPLv2
PERMIT_PACKAGE_CDROM =	Yes

MODULES =	lang/python
MODPY_SETUPTOOLS =	Yes

WANTLIB +=	pthread rsync ${MODPY_WANTLIB}

LIB_DEPENDS +=	net/librsync \
		${MODPY_LIB_DEPENDS}

RUN_DEPENDS +=	devel/py-fasteners \
		devel/py-pexpect \
		net/ncftp \
		net/py-boto \
		gnupg-<2:security/gnupg \
		sysutils/py-lockfile

TEST_DEPENDS =	archivers/gtar \
		archivers/par2cmdline \
		devel/py-mock \
		devel/py-pexpect \
		sysutils/py-lockfile

MAKE_ENV +=	LIBRSYNC_DIR=${LOCALBASE}

MODPY_ADJ_FILES =	bin/duplicity bin/rdiffdir \
			testing/manual/backendtest \
			testing/overrides/bin/hsi \
			testing/overrides/bin/lftp \
			testing/overrides/bin/ncftpget \
			testing/overrides/bin/ncftpls \
			testing/overrides/bin/ncftpput \
			testing/overrides/bin/tahoe

post-extract:
	chmod 644 ${WRKSRC}/bin/*.1

.include <bsd.port.mk>
