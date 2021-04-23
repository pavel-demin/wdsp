TARGET = libwdsp.a

SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

CC = gcc
AR = ar
RANLIB = ranlib
RM = rm -f

CFLAGS = -Wall -O3 -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard -ffast-math
ARFLAGS = cr

all: $(TARGET)

%.o: %.c
	${CC} -c ${CFLAGS} $< -o $@

$(TARGET): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $^
	$(RANLIB) $@

clean:
	$(RM) $(OBJECTS) $(TARGET)
