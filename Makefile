PORTNAME=			openiked-portable
PORTVERSION=		6.9.0
CATEGORIES=			security net
MASTER_SITES=		OPENBSD/OpenIKED
DISTNAME=			openiked-${PORTVERSION}

MAINTAINER=	david@lapinbilly.eu
COMMENT=	IKEv2 daemon

LICENSE=	ISCL

LIB_DEPENDS=	libevent.so:devel/libevent

CONFLICTS_INSTALL=		openiked-[0-9]*
USES=		cmake ssl

USE_RC_SUBR=	iked
USERS=			_iked
GROUPS=			_iked

.include <bsd.port.options.mk>

# 12.0-STABLE after updating OpenSSL shared library version numbers.
.if ${OPSYS} == FreeBSD && ${OSVERSION} < 1200086
BROKEN_SSL=				base
BROKEN_SSL_REASON_base=	needs features only available in OpenSSL 1.1.0+ (DH_get0_pqg)
.endif

post-install:
	${MV} ${STAGEDIR}${PREFIX}/etc/iked.conf \
	    ${STAGEDIR}${PREFIX}/etc/iked.conf.sample


.include <bsd.port.mk>
