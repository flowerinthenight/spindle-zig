**Note**: build not working.

```sh
# Adding submodule (tracking branch, not tag):
$ git submodule add -b \
    v2.28.x https://github.com/googleapis/google-cloud-cpp.git \
    google-cloud-cpp
$ git submodule update --init --recursive

# Build google-cloud-cpp (via CMake, not bazel):
# Clone 'https://github.com/microsoft/vcpkg',
# run the corresponding bootstrap script, and add bin to $PATH.
$ cd google-cloud-cpp/
$ vcpkg install
$ cmake -S . -B out/ \
    -DCMAKE_TOOLCHAIN_FILE=$PATH_TO_VCPKG/scripts/buildsystems/vcpkg.cmake \
    -DGOOGLE_CLOUD_CPP_WITH_MOCKS=OFF \
    -DBUILD_TESTING=OFF \
    -DGOOGLE_CLOUD_CPP_ENABLE_EXAMPLES=OFF \
    -DGOOGLE_CLOUD_CPP_ENABLE=spanner
$ cmake --build out -- -j $(nproc)

# Build bindings:
$ mkdir build && cd build/
$ cmake -S .. -G "Unix Makefiles"
$ cmake --build . -j $(nproc)
```
