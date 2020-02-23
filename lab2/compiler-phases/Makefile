CFLAGS = -Wall

.PHONY: all clean

all: hello

# Linking object file in executable.
hello: hello.o
	$(CC) $(LDFLAGS) -o $@ $<

# Assemble assembly file in object file.
hello.o: hello.s
	$(CC) $(ASFLAGS) -c -o $@ $<

# Compile pre-processed source code file into assembly file.
hello.s: hello.i
	$(CC) $(CFLAGS) -S -o $@ $<

# Preprocess raw C source code file into pre-processed source code file.
hello.i: hello.c
	$(CC) $(CPPFLAGS) -E -o $@ $<

clean:
	-rm -f hello.i hello.s hello.o hello
	-rm -f *~
