PROGNAME=ned
PREFIX?=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/share/man/man1
OBJECTS=buf.o glbl.o io.o main.o re.o sub.o undo.o linenoise.o
CFLAGS+=-Wall -Wextra -pedantic -Werror
LDFLAGS+=-lbsd

all: $(PROGNAME)

debug: CFLAGS+=-g -O0
debug: $(PROGNAME)

$(PROGNAME): $(OBJECTS)
	$(CC) -o $@ $^ $(LDFLAGS)

install: $(PROGNAME)
	install -m 0755 $(PROGNAME) $(BINDIR)
	install -m 0644 $(PROGNAME).1 $(MANDIR)

clean:
	rm -rf *.o
	rm -rf *.exe
	rm -rf $(PROGNAME)
