#include "bindings.h"
#include "google/cloud/spanner/client.h"
#include <iostream>

Client::Client() {
  std::cout << "constructor" << std::endl;
}

Client::~Client() {
  std::cout << "destructor" << std::endl;
}

void Client::hello() {
  std::cout << "hello from cpp class" << std::endl;
}

// Our C interface(s):

void* init() {
  return new (std::nothrow) Client();
}

void release(void* self) {
  delete reinterpret_cast<Client*>(self);
}

void hello(void* self) {
  auto p = reinterpret_cast<Client*>(self);
  p->hello();
}
