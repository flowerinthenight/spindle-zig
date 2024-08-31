#ifndef BINDINGS_CPP_H
#define BINDINGS_CPP_H

#ifdef __cplusplus
class Client {
public:
  Client();
  ~Client();
};
#endif // __cplusplus

#ifdef __cplusplus
extern "C" {
#endif

  #define NUM 2
  int hellocpp(int v);

#ifdef __cplusplus
}
#endif

#endif // BINDINGS_CPP_H
