# $OpenBSD: Makefile,v 1.11 2018/10/09 20:32:45 rsadowski Exp $

COMMENT =		Virtual Private Network (VPN) daemon
DISTNAME =		tinc-1.0.35
CATEGORIES =		net security
EPOCH =			0

HOMEPAGE =		https://www.tinc-vpn.org/

MAINTAINER =		Rafael Sadowski <rsadowski@openbsd.org>

# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c crypto lzo2 z

MASTER_SITES =		https://www.tinc-vpn.org/packages/

LIB_DEPENDS +=		archivers/lzo2

CONFIGURE_STYLE = 	gnu

CONFIGURE_ENV =		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"

USE_GMAKE =		Yes

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/tinc
	cp -r ${WRKSRC}/doc/sample-config/* ${PREFIX}/share/examples/tinc/
	chown -R ${SHAREOWN}:${SHAREGRP} ${PREFIX}/share/examples/tinc/
	chmod -R u=rwX,go=rX ${PREFIX}/share/examples/tinc/*

.include <bsd.port.mk>
