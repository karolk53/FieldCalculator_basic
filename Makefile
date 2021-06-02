#Plik Makefile do podstawowej wersjii zadania 2

#zmiennych uzylem m.in. w celu latwego zmieniania zrodel zapisu i nazwy programu
LIBD=libs
SRCD=srcs
BIND=bin
INCD=include
PROG=Code2
pwd=$(shell pwd)


.PHONY: clean export install uninstall
.SUFFIXES: .c .o .a .so

#VPATH przechowuje katalogi w celu wyszukania potrzebnych plikow
VPATH = $(LIBD) $(SRCD) $(BIND) $(INCD)

#tworzenie plikow przy uzyciu reguly wzorca
%.o:%.c
	gcc -c $(SRCD)/* -I./$(INCD)
%.o:pole%.c
	gcc -c $(SRCD)/$^
%.o:obj%.c
	gcc -c -fPIC $(SRCD)/$^

main.o: main.c
polepr.o: polepr.c
objpr.o: objpr.c

#tworzenie bibliotek i kompilacja samego programu przy ich uzyciu
libpolepr.a: polepr.o
	ar rs $(LIBD)/$@ $^
libobjpr.so: objpr.o
	gcc -shared -o $(LIBD)/$@ $^
$(PROG): main.o libpolepr.a libobjpr.so
	gcc -o $(BIND)/$@ $^ -L$(LIBD)


#export zmiennej LD_LIBRARY_PATH do poprawnego dzialania biblioteki dynamicznej
export:
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(pwd)/

#instalacja, deinstalacja programu oraz czyszczenie z niepotrzebnych plikow
install:
	cp $(BIND)/$(PROG) /usr/local/bin
uninstall:
	rm /usr/local/bin/$(PROG)
clean:
	rm *.o $(LIBD)/* $(BIND)/*	
