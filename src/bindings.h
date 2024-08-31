#ifndef _BINDINGS_CPP_
#define _BINDINGS_CPP_

#ifdef __cplusplus
#define EXTERN_C extern "C"
#else
#define EXTERN_C
#endif

#ifdef __cplusplus
#include "google/cloud/spanner/client.h"

class Client {
 public:
  Client();
  ~Client();
};

#endif // __cplusplus

#define NUM_1 1
EXTERN_C int plus1(int a);

#endif // _BINDINGS_CPP_
