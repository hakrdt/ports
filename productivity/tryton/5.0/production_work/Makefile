# $OpenBSD: Makefile,v 1.1.1.1 2018/12/19 08:26:10 semarie Exp $

MODPY_EGG_VERSION =	5.0.0
TRYTON_MODULE =		production_work

TRYTON_DEPENDS +=	company \
			production \
			production_routing \
			stock

RUN_DEPENDS +=		databases/py-sql${MODPY_FLAVOR}

.include <bsd.port.mk>
