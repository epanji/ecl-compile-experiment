#include <ecl/ecl.h>

extern void init_static(cl_object cblock);

int main(int argc, char** argv) {
  cl_boot(argc, argv);

  ecl_init_module(NULL, init_static);

  cl_funcall(1, ecl_make_symbol("HELLO-WORLD", "STATIC"));

  cl_shutdown();
  return 0;
}
