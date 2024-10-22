CC = gcc
CFLAGS = -Iinclude -Wall -Wextra -g
SRC = $(wildcard src/**/*.c)
OBJ = $(SRC:.c=.o)
TARGET = libmodular.a

all: $(TARGET)

$(TARGET): $(OBJ)
	ar rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f src/**/*.o $(TARGET)

test: all
	$(CC) $(CFLAGS) tests/**/*.c -o tests/run_tests $(OBJ)
	./tests/run_tests
