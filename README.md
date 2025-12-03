### Intro

This project aims to familiarize writers with ECL compile without ASDF.

### Compile

```sh

~$ make
# ------------------------------------------------------------
/usr/bin/ecl --norc \
	--eval '(compile-file "static.lsp" :system-p t)' \
	--eval '(c:build-static-library "static" :lisp-files (quote ("static.o")) :init-name "init_static")' \
	--eval '(ext:quit)'
;;; Loading #P"/usr/lib64/ecl-24.5.10/cmp.fas"
;;;
;;; Compiling static.lsp.
;;; OPTIMIZE levels: Safety=2, Space=0, Speed=3, Debug=0
;;;
;;; Finished compiling static.lsp.
;;;
# ------------------------------------------------------------
/usr/bin/ecl --norc -c clean.c -h clean.eclh --data clean.data -s -q --compile link.lsp
;;; Loading #P"/usr/lib64/ecl-24.5.10/cmp.fas"
/usr/bin/ecl --norc -o link --link libstatic.a link.o
;;; Loading #P"/usr/lib64/ecl-24.5.10/cmp.fas"
# ------------------------------------------------------------
/usr/bin/gcc -O3 -o embed embed.c libstatic.a -lecl
# ------------------------------------------------------------
/usr/bin/du -h ./link
24K	./link
/usr/bin/time -p ./link
Hello world!
real 0.10
user 0.10
sys 0.01
# ------------------------------------------------------------
/usr/bin/du -h ./embed
24K	./embed
/usr/bin/time -p ./embed
Hello world!
real 0.10
user 0.11
sys 0.01

```

### Clean

```sh

~$ make clean

```

