CC := gcc
CFLAGS := -I. -static
LDFLAGS := $(CFLAGS)

all:uncpio mkcpio

uncpio: uncpio.c
	$(CC) $(CFLAGS) -c $< -o ${<:.c=.o}
	$(CC) $(LDFLAGS) ${<:.c=.o} -o $@
mkbootimg:mkcpio.c sha.o
	$(CC) $(CFLAGS) -c $< -o ${<:.c=.o}
	$(CC) $(LDFLAGS) ${^:.c=.o} -o $@
clean:
	-rm *.o uncpio mkcpio
install:
	-install uncpio -m 0755 ~/bin
	-install mkcpio -m 0755 ~/bin