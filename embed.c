#include <ecl/ecl.h>

extern void init_static(cl_object cblock);

int main(int argc, char** argv) {
  cl_boot(argc, argv);

  ecl_init_module(NULL, init_static);

  cl_funcall(1, ecl_make_symbol("HELLO-WORLD", "STATIC"));
  si_safe_eval(2,
      ecl_read_from_cstring(
        "(let ((*trace-output* *standard-output*))"
        "  (format t \"(time (static:fib 7777)): ~A~%\" (time (static:fib 7777))))"),
      ECL_NIL);

  cl_shutdown();
  return 0;
}
