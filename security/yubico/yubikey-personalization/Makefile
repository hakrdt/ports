# $OpenBSD: Makefile,v 1.7 2018/05/17 10:32:12 sthen Exp $

COMMENT=	library and tools to program YubiKeys

YK_PROJECT=	yubikey-personalization
DISTNAME=	ykpers-1.19.0

SHARED_LIBS +=	ykpers-1                  0.7 # 20.0

CATEGORIES=	sysutils

WANTLIB += c json-c pthread usb-1.0 yubikey

LIB_DEPENDS=	devel/json-c \
		devel/libusb1>=1.0.9p1 \
		security/yubico/yubico-c

CONFIGURE_STYLE= gnu

.include <bsd.port.mk>
