# $OpenBSD: Makefile,v 1.1 2016/07/05 20:01:47 schwarze Exp $

REGRESS_TARGETS=cat_b cat_n cat_s cat_v

cat_b:
	cat -b ${.CURDIR}/cat_b.in | cmp -s ${.CURDIR}/cat_b.out /dev/stdin

cat_n:
	cat -n ${.CURDIR}/cat_n.in | cmp -s ${.CURDIR}/cat_n.out /dev/stdin

cat_s:
	cat -s ${.CURDIR}/cat_s.in | cmp -s ${.CURDIR}/cat_s.out /dev/stdin

cat_v:
	cat -v ${.CURDIR}/cat_v.in | cmp -s ${.CURDIR}/cat_v.out /dev/stdin

.include <bsd.regress.mk>
