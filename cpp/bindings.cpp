#include "bindings.h"
#include "google/cloud/spanner/client.h"
#include <iostream>
namespace spanner = ::google::cloud::spanner;

Proxy::Proxy() {
  std::cout << "constructor" << std::endl;
}

Proxy::~Proxy() {
  std::cout << "destructor" << std::endl;
}

void Proxy::info(const char* project, const char* instance, const char* db) {
  std::cout << "input: " << project << ", " << instance << ", " << db << std::endl;
  auto database = spanner::Database("mobingi-main", "alphaus-prod", "main");
  auto connection = spanner::MakeConnection(database);
  auto client = spanner::Client(connection);
}

// Our C interface(s):

void* init() {
  return new (std::nothrow) Proxy();
}

void release(void* self) {
  delete reinterpret_cast<Proxy*>(self);
}

void info(void* self, const char* project, const char* instance, const char* db) {
  auto p = reinterpret_cast<Proxy*>(self);
  p->info(project, instance, db);
}
