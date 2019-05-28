.POSIX:

PREFIX=/usr
CFLAGS:=$(CFLAGS)
CFLAGS+=-fPIC -Wall -O3
LIBS=-lm
VPATH=src
SOURCES:=$(patsubst src/%.c, %.c, $(wildcard src/*.c))
OBJECTS:=$(SOURCES:%.c=%.o)
ARCHIVE:=$(OBJECTS:%.o=%.a)
SHARED:=$(OBJECTS:%.o=%.so)
ifndef TARGET
TARGET=release
endif

all: $(SHARED) $(ARCHIVE) $(OBJECTS)

%.o: %.c
	@mkdir -p $(TARGET)
	$(CC) -c $(CFLAGS) $< -o $(addprefix $(TARGET)/, $@)

%.a: $(OBJECTS)
	$(AR) $(ARFLAGS) $(addprefix $(TARGET)/, $@) $(addprefix $(TARGET)/, $?)

%.so: $(OBJECTS)
	$(CC) -shared -o $(addprefix $(TARGET)/lib, $@) $(addprefix $(TARGET)/, $?)

install:
	@echo todo

clean:
	rm -rf $(TARGET)

.PHONY: install clean
