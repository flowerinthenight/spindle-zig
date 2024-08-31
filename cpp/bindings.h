#ifndef BINDINGS_CPP_H
#define BINDINGS_CPP_H

#ifdef __cplusplus
class Client {
public:
  Client();
  ~Client();
  void hello();
};
#endif // __cplusplus

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

  void* init();
  void release(void*);
  void hello(void*);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // BINDINGS_CPP_H
