**Note**: build not working.

```sh
# Adding submodule (tracking branch, not tag):
$ git submodule add -b \
    v2.31.x https://github.com/googleapis/google-cloud-cpp.git \
    google-cloud-cpp
$ git submodule update --init --recursive

# Build dependencies:
# (For Ubuntu 22.04 LTS)
$ ./build-deps-static.sh

# Build bindings:
$ ./build-cpp.sh
```
