# $OpenBSD: Makefile,v 1.22 2015/11/24 09:11:06 jasper Exp $

COMMENT=	SGML DTDs from The Electronic Publishing SIG

DISTNAME=	iso12083-1993
CATEGORIES=	textproc

MASTER_SITES=	ftp://info.ex.ac.uk/pub/SGML/ISO-12083/ \
		https://distfiles.nl/
DISTFILES=	article.dtd book.dtd maths.dtd serial.dtd

# custom
PERMIT_PACKAGE_CDROM=	Yes

DIST_SUBDIR=	iso12083

NO_BUILD=	Yes
NO_TEST=	Yes
PKG_ARCH=	*
WRKDIST=	${WRKDIR}
EXTRACT_ONLY=	# empty

INSTDIR=	${PREFIX}/share/sgml/iso12083

pre-install:
	${INSTALL_DATA_DIR} ${INSTDIR}

do-install:
	@for i in ${DISTFILES}; do \
		${INSTALL_DATA} ${FULLDISTDIR}/$$i ${INSTDIR}/$$i; \
	done
	@${INSTALL_DATA} ${FILESDIR}/catalog ${INSTDIR}/catalog

.include <bsd.port.mk>
