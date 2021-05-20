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

post-install:
	${MV} ${STAGEDIR}${PREFIX}/etc/iked.conf \
	    ${STAGEDIR}${PREFIX}/etc/iked.conf.sample

.include <bsd.port.mk>
