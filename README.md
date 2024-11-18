**Note**: build not working.

```sh
# Adding submodule (tracking branch, not tag):
$ git submodule add -b \
    v2.28.x https://github.com/googleapis/google-cloud-cpp.git \
    google-cloud-cpp
$ git submodule update --init --recursive

# Build dependencies:
$ ./build-deps.sh

# Build bindings:
$ ./build-cpp.sh
```
