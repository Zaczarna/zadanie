#zmienne: kompilator, plik zrodlowy, pliki tymczasowe .o, folder wyjsciowy, plik wyjsciowy
CC := g++
SRCDIR := src
BUILDDIR := build
BINDIR :=bin
TARGET := main
 
#zmienna ktora przechowuje typ pliku, ???src znajduje pliki ktore maja koncowke cpp, oznacza wszystkie pliki ktore maja .o, flagi kompilatora(opcje)
# dolaczane pliki naglowkowe
SRCEXT := cpp
SOURCES := $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
OBJECTS := $(patsubst $(SRCDIR)/%,$(BUILDDIR)/%,$(SOURCES:.$(SRCEXT)=.o))
CFLAGS := -c -Wall
INC := -I include

# sprawdzic sobie
.PHONY: run clean

# tworzy foldr build jesli go nie ma, kompiluje po kolei pliki zrodlowe do obiektow z rozszerzenie .o, 
$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) $(INC) -o $@ $<

# tworzy folder bin, komiluje te obiekty do wyjsciowego pliku
$(TARGET): $(OBJECTS)
	mkdir -p $(BINDIR)
	$(CC) $^ -o $(BINDIR)/$(TARGET)

# czysci pliki tymczasow/posrednie
clean:
	-rm -f $(BUILDDIR)/*.o

# uruchamia
run:
	./$(BINDIR)/$(TARGET)