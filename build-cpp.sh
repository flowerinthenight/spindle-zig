ROOT_DIR=${PWD}
rm -rfv cmake-out/
cmake -S . -B cmake-out -DCMAKE_PREFIX_PATH=${ROOT_DIR}/deps/usr
cmake --build cmake-out -- -j $(nproc)
