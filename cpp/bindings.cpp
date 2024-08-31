#include "bindings.h"
#include <iostream>

int plus1(int a) {
  std::cout << "from cpp" << std::endl;
  return a + NUM_1;
}
