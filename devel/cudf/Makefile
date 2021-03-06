# $OpenBSD: Makefile,v 1.9 2018/12/15 16:25:25 naddy Exp $

MULTI_PACKAGES =	-ocaml -main

COMMENT-ocaml =		CUDF library (Ocaml resources)
COMMENT-main =		CUDF library (C bindings)

CATEGORIES =		devel sysutils

VERSION =		0.9
DISTNAME =		cudf-${VERSION}
PKGNAME-ocaml =		ocaml-cudf-${VERSION}
PKGNAME-main =		libcudf-${VERSION}
REVISION =		0

MASTER_SITES =		https://gforge.inria.fr/frs/download.php/file/36602/

HOMEPAGE =		http://www.mancoosi.org/cudf/

# GPLv3+
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB =		c m

MODULES =		lang/ocaml
BUILD_DEPENDS =		devel/ocaml-extlib \
			lang/ocaml-camlp4 \
			sysutils/findlib \
			devel/ocaml-ocamlbuild \
			devel/glib2
RUN_DEPENDS =		devel/ocaml-extlib
TEST_DEPENDS =		devel/ounit

FAKE_FLAGS =		PREFIX=${PREFIX} BINDIR=${PREFIX}/bin \
			INCDIR=${PREFIX}/include LIBDIR=${PREFIX}/lib

USE_GMAKE =		Yes

ALL_TARGET =		all doc c-lib
TEST_TARGET =		test

.include <bsd.port.arch.mk>

.if ${PROPERTIES:Mocaml_native}
ALL_TARGET +=		opt c-lib-opt
.endif

.if ${MACHINE_ARCH} == "i386"
MAKE_ENV +=		LDFLAGS="-Wl,-znotext"
.endif

TEST_TARGET +=		c-lib-test

docdir =		${PREFIX}/share/doc/cudf/

post-install:
	-rm ${PREFIX}/lib/ocaml/cudf/*.o
	${INSTALL_DATA_DIR} ${docdir}/api/
	${INSTALL_DATA} ${WRKSRC}/{ChangeLog,COPYING,README} ${docdir}
	${INSTALL_DATA} ${WRKSRC}/cudf.docdir/* ${docdir}/api/

.include <bsd.port.mk>
