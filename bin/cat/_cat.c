#include <err.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

void
cat(int f, char *s)
{
	char buf[8192];
	long n;

	while((n=read(f, buf, (long)sizeof buf))>0)
		if(write(1, buf, n)!=n)
			err(1, "write error copying %s: %d", s, errno);
	if(n < 0)
		err(1, "error reading %s: %d", s, errno);
}

int
main(int argc, char *argv[])
{
	int f, i;

	if(argc == 1)
		cat(0, "");
	else for(i=1; i<argc; i++){
		f = open(argv[i], O_RDONLY);
		if(f < 0)
			err(1, "can't open %s: %d", argv[i], errno);
		else{
			cat(f, argv[i]);
			close(f);
		}
	}
	return 0;
}

