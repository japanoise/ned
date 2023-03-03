PROGNAME=ned
PREFIX?=/usr/local
BINDIR=$(PREFIX)/bin
OBJECTS=buf.o glbl.o io.o main.o re.o sub.o undo.o
CFLAGS+=-Wall -Wextra -pedantic -Werror
LDFLAGS+=-lbsd

all: $(PROGNAME)

debug: CFLAGS+=-g -O0
debug: $(PROGNAME)

$(PROGNAME): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

install: $(PROGNAME)
	install -m 0755 $(PROGNAME) $(BINDIR)

clean:
	rm -rf *.o
	rm -rf *.exe
	rm -rf $(PROGNAME)
