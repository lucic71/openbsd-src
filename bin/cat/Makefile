#	$OpenBSD: Makefile,v 1.4 2017/02/19 00:46:57 jca Exp $

PROG=	_cat
MAN=	cat.1

beforeinstall:
	${INSTALL} -c -o root -g bin cat.sh ${DESTDIR}/bin/cat

.include <bsd.prog.mk>
