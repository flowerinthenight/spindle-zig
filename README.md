```sh
# Adding submodule:
git submodule add -b \
  v2.28.x https://github.com/googleapis/google-cloud-cpp.git \
  google-cloud-cpp
git submodule update --remote

# Build google-cloud-cpp:
# Clone 'https://github.com/microsoft/vcpkg',
# run the corresponding bootstrap script, and add bin to $PATH.
cd google-cloud-cpp/
vcpkg install
cmake -S . -B cmake-out/ \
  -DCMAKE_TOOLCHAIN_FILE=path/to/vcpkg/scripts/buildsystems/vcpkg.cmake
```
