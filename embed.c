#include <ecl/ecl.h>

int main(int argc, char** argv) {
  cl_boot(argc, argv);

  cl_eval(c_string_to_object(" (format t \"Hello world!~%\") "));

  cl_shutdown();
  return 0;
}
