CPPFLAGS := -D_GNU_SOURCE
CFLAGS := -std=c11 -Wall -Wextra -O2 -flto -fPIC -fvisibility=hidden -pedantic
LDFLAGS := -Wl,--as-needed
LDLIBS := -lpthread
OBJECTS := malloc.o random.o util.o

hardened_malloc.so: $(OBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) -shared $^ $(LDLIBS) -o $@

malloc.o: malloc.c malloc.h random.h util.h
random.o: random.c random.h util.h
util.o: util.c util.h

clean:
	rm -f hardened_malloc.so $(OBJECTS)
