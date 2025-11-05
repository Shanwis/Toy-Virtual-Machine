CC = gcc
CFLAGS = -Iinclude

SRCDIR = src
OBJDIR = obj
BINDIR = bin

SRC := $(wildcard $(SRCDIR)/*.c)
OBJ := $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRC))
TARGET = $(BINDIR)/virtualMachine

$(shell mkdir -p $(OBJDIR) $(BINDIR))

FILE ?= program.asm

.PHONY: all clean run

all:$(TARGET)

$(TARGET):$(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

run:$(TARGET)
	./$(TARGET) $(FILE)

clean:
	rm -rf $(OBJDIR) $(BINDIR)