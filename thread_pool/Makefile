VERSION  = 1
RELEASE  = 0.0
NAME     = libthreadpool.so
SONAME   = $(NAME).$(VERSION)
LIB      = $(SONAME).$(RELEASE)
LIBOBJS  = thread_pool.o
INCLUDES = thread_pool.h 

override CFLAGS += -Wall -Werror

.PHONY: all clean

all: $(LIB)

$(LIBOBJS): override CFLAGS += -fPIC -lpthread

$(LIB): $(LIBOBJS)
	$(CC) $(LDFLAGS) -shared -Wl,-soname,$(SONAME) -o $@ $^
	ln -sf $(LIB) $(NAME)

install:
	mkdir -p $(DESTDIR)/usr/include/spe
	install $(INCLUDES) $(DESTDIR)/usr/include/spe
	mkdir -p $(DESTDIR)/usr/lib
	install $(LIB) $(DESTDIR)/usr/lib
	ln -sf $(LIB) $(DESTDIR)/usr/lib/$(NAME)
	ln -sf $(LIB) $(DESTDIR)/usr/lib/$(SONAME)

clean:
	rm -f *~ *.o $(LIB) $(EXE)
