# Makefile.

ROOTDIR := $(shell pwd)
OBJDIR := $(ROOTDIR)/intermediate
OUTDIR := $(ROOTDIR)/bin
SRCDIR := $(ROOTDIR)/src

build: clean
	$(shell mkdir -p $(OBJDIR) )
	$(shell mkdir -p $(OUTDIR) )
	gcc $(SRCDIR)/main.c -o $(OUTDIR)/main -lSDL2

clean: 
	@echo "Cleaning app..."
	rm -rf $(OBJDIR)
	rm -rf $(OUTDIR)

all: clean build
	@echo "Buildling helper app"