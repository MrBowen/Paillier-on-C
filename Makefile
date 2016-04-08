# Usual compilation flags
CFLAGS = -Wall -Wextra -g -std=c99
CPPFLAGS =
LDFLAGS = -lgmp
EXE = main
OBJ = Paillier.o PIR_Naive.o main.o

# Special rules and targets
.PHONY: all paillier clean help

# Rules and targets
all: $(EXE)

$(EXE): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

Paillier.o: Paillier.c Paillier.h
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^

PIR_Naive.o: PIR_Naive.c Paillier.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^

main.o: main.c Paillier.c PIR_Naive.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^

clean:
	@rm -f *~ *.o $(EXE) a.out
	@rm -rf .DS_Store
	@rm -rf *.dSYM *.gch .yxy gdb.txt

help:
	@echo "Makefile Usage:"
	@echo "- make [all]\t\tStart the compilation of Sudoku"
	@echo "- make clean\t\tRemove all files generated by make"
	@echo "- make help\t\tDisplay this help"
