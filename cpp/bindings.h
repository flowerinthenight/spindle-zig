#ifndef BINDINGS_CPP_H
#define BINDINGS_CPP_H

#ifdef __cplusplus
#include "google/cloud/spanner/client.h"

class Proxy {
public:
  Proxy();
  ~Proxy();
  void info(const char*, const char*, const char*);
};
#endif // __cplusplus

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

  void* init();
  void release(void*);
  void info(void*, const char*, const char*, const char*);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // BINDINGS_CPP_H
