ECL=$(shell which ecl)
CC=$(shell which gcc)
DU=$(shell which du)
TM=/usr/bin/time

PROG0 = link
PROG1 = embed

.PHONY : profile
profile : compile
	# ------------------------------------------------------------
	$(DU) -b ./$(PROG0)
	$(TM) -p ./$(PROG0)
	# ------------------------------------------------------------
	$(DU) -b ./$(PROG1)
	$(TM) -p ./$(PROG1)

.PHONY : compile
compile : $(PROG0) $(PROG1)

libstatic.a : static.lsp
	# ------------------------------------------------------------
	$(ECL) --norc \
		--eval '(compile-file "static.lsp" :system-p t)' \
		--eval '(c:build-static-library "static" :lisp-files (quote ("static.o")) :init-name "init_static")' \
		--eval '(ext:quit)'

$(PROG0).o : libstatic.a $(PROG0).lsp
	# ------------------------------------------------------------
	$(ECL) --norc -c clean.c -h clean.eclh --data clean.data -s -q --compile $(PROG0).lsp

$(PROG0) : $(PROG0).o
	$(ECL) --norc -o $(PROG0) --link libstatic.a $(PROG0).o

$(PROG1) : libstatic.a $(PROG1).c
	# ------------------------------------------------------------
	$(CC) -O3 -o $(PROG1) $(PROG1).c libstatic.a -lecl

.PHONY : clean
clean :
	rm $(PROG0) $(PROG1) $(wildcard *.[oa]) $(wildcard clean.*)
