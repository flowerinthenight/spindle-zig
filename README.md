```sh
# Adding submodule (tracking branch, not tag):
$ git submodule add -b \
    v2.28.x https://github.com/googleapis/google-cloud-cpp.git \
    google-cloud-cpp
$ git submodule update --remote

# Build google-cloud-cpp (via CMake, not bazel):
# Clone 'https://github.com/microsoft/vcpkg',
# run the corresponding bootstrap script, and add bin to $PATH.
$ cd google-cloud-cpp/
$ vcpkg install
$ cmake -S . -B cmake-out/ \
    -DCMAKE_TOOLCHAIN_FILE=$PATH_TO_VCPKG/scripts/buildsystems/vcpkg.cmake
$ cmake --build cmake-out -- -j $(nproc)
```
