rm -rfv build && mkdir build && cd build/
cmake -S .. -DCMAKE_PREFIX_PATH=$PWD/../deps/usr
cmake --build . -j $(nproc)
