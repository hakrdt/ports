# $OpenBSD: Makefile,v 1.22 2018/05/25 13:01:41 espie Exp $

COMMENT=		wm-dockapp; shows the current date

DISTNAME=		wmdate-0.7
REVISION=		3
CATEGORIES=		x11 x11/windowmaker

# BSD
PERMIT_PACKAGE_CDROM=	Yes

WANTLIB=		X11 Xau Xdmcp Xext Xpm c dockapp

LIB_DEPENDS=		devel/libdockapp

NO_TEST=		Yes
CONFIGURE_STYLE=	imake noman

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/doc/wmdate
	${INSTALL_DATA} ${WRKSRC}/COPYING ${PREFIX}/share/doc/wmdate

.include <bsd.port.mk>
