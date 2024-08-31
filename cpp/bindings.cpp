#include "bindings.h"
#include "google/cloud/spanner/client.h"
#include <iostream>

Client::Client() {
  std::cout << "constructor" << std::endl;
}

Client::~Client() {
  std::cout << "destructor" << std::endl;
}

// void* init() {
//   return new (std::nothrow) Client();
// }

// void release(void* self) {
//   delete reinterpret_cast<Client*>(self);
// }

int hellocpp(int v) {
  std::cout << "cpp:hello" << std::endl;
  return v + NUM;
}
