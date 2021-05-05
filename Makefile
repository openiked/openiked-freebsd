PORTNAME=			openiked-portable
DISTVERSIONPREFIX=	v
PORTVERSION=		6.9.0
CATEGORIES=			security net

MAINTAINER=	portmgr@FreeBSD.org
COMMENT=	IKEv2 daemon

LICENSE=	ISCL

LIB_DEPENDS=	libevent.so:devel/libevent

USES=		cmake ssl
USE_GITHUB=	yes
GH_ACCOUNT=	openiked

USE_RC_SUBR=	iked
USERS=			_iked
GROUPS=			_iked

post-install:
	${MV} ${STAGEDIR}${PREFIX}/etc/iked.conf \
	    ${STAGEDIR}${PREFIX}/etc/iked.conf.sample

.include <bsd.port.mk>
