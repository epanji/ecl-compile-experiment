### Intro

This project aims to familiarize writers with ECL compile without ASDF.

### Compile

```sh

~$ make
# ------------------------------------------------------------
/usr/bin/ecl --norc -s -q --compile link.lsp
;;; Loading #P"/usr/lib64/ecl-24.5.10/cmp.fas"
/usr/bin/ecl --norc -o link --link link.o
;;; Loading #P"/usr/lib64/ecl-24.5.10/cmp.fas"
# ------------------------------------------------------------
/usr/bin/gcc -O3 -o embed embed.c -lecl
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
20K	./embed
/usr/bin/time -p ./embed
Hello world!
real 0.10
user 0.10
sys 0.02

```

### Clean

```sh

~$ make clean

```

