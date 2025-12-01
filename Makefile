ECL=$(shell which ecl)
CC=$(shell which gcc)
DU=$(shell which du)
TM=/usr/bin/time

PROG0 = link
PROG1 = embed

.PHONY : profile
profile : compile
	# ------------------------------------------------------------
	$(DU) -h ./$(PROG0)
	$(TM) -p ./$(PROG0)
	# ------------------------------------------------------------
	$(DU) -h ./$(PROG1)
	$(TM) -p ./$(PROG1)

.PHONY : compile
compile : $(PROG0) $(PROG1)

$(PROG0).o : $(PROG0).lsp
	# ------------------------------------------------------------
	$(ECL) --norc -s -q --compile $(PROG0).lsp

$(PROG0) : $(PROG0).o
	$(ECL) --norc -o $(PROG0) --link $(PROG0).o

$(PROG1) : $(PROG1).c
	# ------------------------------------------------------------
	$(CC) -O3 -o $(PROG1) $(PROG1).c -lecl

.PHONY : clean
clean :
	rm $(PROG0) $(PROG1) $(wildcard *.o)
