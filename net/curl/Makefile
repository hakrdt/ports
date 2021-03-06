# $OpenBSD: Makefile,v 1.139 2018/12/12 20:41:04 naddy Exp $

COMMENT=	get files from FTP, Gopher, HTTP or HTTPS servers

DISTNAME=	curl-7.63.0
SHARED_LIBS=	curl                 25.19    # 9.0
CATEGORIES=	net
HOMEPAGE=	https://curl.haxx.se/

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# MIT
PERMIT_PACKAGE_CDROM=	Yes

MASTER_SITES=	https://curl.haxx.se/download/
EXTRACT_SUFX=	.tar.xz

LIB_DEPENDS=	www/nghttp2
WANTLIB=	c crypto pthread nghttp2 ssl z

CONFIGURE_STYLE=gnu
# Beware of circular dependency curl -> brotli -> cmake -> curl
CONFIGURE_ARGS=	--with-ca-bundle=/etc/ssl/cert.pem \
		--without-brotli \
		--without-libidn2 \
		--without-libpsl \
		--without-libssh \
		--without-libssh2
CONFIGURE_ENV=	ac_cv_path_NROFF="/usr/bin/mandoc -Tascii"

# speed up some time-consuming configure tests
CONFIGURE_ENV+= \
    curl_cv_func_select_args="int,fd_set *,struct timeval *,int" \
    curl_cv_func_recv_args="int,void *,size_t,int,ssize_t" \
    curl_cv_func_send_args="int,const void *,size_t,int,ssize_t"

# Note:
# use ulimit -p 256 for test

.include <bsd.port.mk>
