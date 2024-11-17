g++ -g -Wall \
    -I/home/f14t/ghf/spindle-zig/google-cloud-cpp \
    -I/home/f14t/ghf/spindle-zig/google-cloud-cpp/out/vcpkg_installed/x64-linux/include \
    -I/home/f14t/ghf/spindle-zig/google-cloud-cpp/out/external/googleapis \
    -I/home/f14t/ghf/spindle-zig/google-cloud-cpp/out/google/cloud/spanner \
    -L/home/f14t/ghf/spindle-zig/google-cloud-cpp/out/vcpkg_installed/x64-linux/lib \
    -L/home/f14t/ghf/spindle-zig/google-cloud-cpp/out/google/cloud \
    -L/home/f14t/ghf/spindle-zig/google-cloud-cpp/out/google/cloud/spanner \
    -L/home/f14t/ghf/spindle-zig/google-cloud-cpp/out/external/googleapis \
    -D_GLIBCXX_USE_CXX11_ABI=0 \
    bindings.cpp main.cpp -o test
