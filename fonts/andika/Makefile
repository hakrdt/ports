# $OpenBSD: Makefile,v 1.7 2017/11/15 09:49:39 bentley Exp $

TYPEFACE =		andika
V =			5.000
COMMENT =		clear sans serif, Unicode-compliant font
DISTNAME =		Andika-$V
CATEGORIES =		fonts
REVISION =		0

HOMEPAGE =		https://software.sil.org/andika/

MAINTAINER =		George Rosamond <george@nycbug.org>

# SIL OFL 1.1
PERMIT_PACKAGE_CDROM =	Yes

MASTER_SITES =		https://software.sil.org/downloads/r/andika/

MODULES +=		font

NO_BUILD =		Yes
NO_TEST =		Yes

DOCDIR =		${PREFIX}/share/doc/andika

post-install:
	${INSTALL_DATA_DIR} ${DOCDIR}
	${INSTALL_DATA} ${WRKDIST}/*.txt ${DOCDIR}

.include <bsd.port.mk>
