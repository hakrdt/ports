# $OpenBSD: Makefile,v 1.2 2018/01/11 19:27:11 rpe Exp $

COMMENT =	coturn STUN/TURN server

V =		4.5.0.7
DISTNAME =	turnserver-${V}
REVISION =	0

CATEGORIES =	telephony

HOMEPAGE =	https://github.com/coturn/coturn

MAINTAINER =		Ingo Feinerer <feinerer@logic.at>

# BSD
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c crypto event_core event_extra event_openssl event_pthreads
WANTLIB += hiredis intl mysqlclient pq pthread sqlite3 ssl

MASTER_SITES =		http://turnserver.open-sys.org/downloads/v${V}/ \
			http://coturn.net/turnserver/v${V}/

LIB_DEPENDS =		databases/mariadb \
			databases/postgresql \
			databases/sqlite3 \
			devel/gettext \
			devel/libevent2 \
			databases/libhiredis

CONFIGURE_STYLE =	simple
CONFIGURE_ARGS =	--localstatedir='${LOCALSTATEDIR}'
# There is no port for MongoDB development libraries and/or headers
CONFIGURE_ENV =		TURN_NO_MONGO=1

post-install:
	rm -rf ${PREFIX}/etc
	mv ${WRKINST}${LOCALSTATEDIR}/db/turndb \
		${PREFIX}/share/examples/turnserver

.include <bsd.port.mk>
