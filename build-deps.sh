#!/bin/bash

ROOT_DIR=${PWD}

# abseil
cd deps/abseil-cpp/ && rm -rfv cmake-out/ && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DABSL_BUILD_TESTING=OFF \
        -DABSL_PROPAGATE_CXX_STD=ON \
        -DBUILD_SHARED_LIBS=yes \
        -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr \
        -S . -B cmake-out && \
    cmake --build cmake-out -- -j $(nproc) && \
    cmake --build cmake-out --target install -- -j $(nproc) && \
    cd ${ROOT_DIR}/

# protobuf
cd deps/protobuf/ && rm -rfv cmake-out/ && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=${ROOT_DIR}/deps/usr \
        -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr \
        -DBUILD_SHARED_LIBS=yes \
        -Dprotobuf_BUILD_TESTS=OFF \
        -Dprotobuf_ABSL_PROVIDER=package \
        -S . -B cmake-out && \
    cmake --build cmake-out -- -j $(nproc) && \
    cmake --build cmake-out --target install -- -j $(nproc) && \
    cd ${ROOT_DIR}/

# grpc
cd deps/grpc/ && rm -rfv cmake-out/ && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=${ROOT_DIR}/deps/usr \
        -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr \
        -DBUILD_SHARED_LIBS=yes \
        -DgRPC_INSTALL=ON \
        -DgRPC_BUILD_TESTS=OFF \
        -DgRPC_ABSL_PROVIDER=package \
        -DgRPC_CARES_PROVIDER=package \
        -DgRPC_PROTOBUF_PROVIDER=package \
        -DgRPC_RE2_PROVIDER=package \
        -DgRPC_SSL_PROVIDER=package \
        -DgRPC_ZLIB_PROVIDER=package \
        -S . -B cmake-out && \
    cmake --build cmake-out -- -j $(nproc) && \
    cmake --build cmake-out --target install -- -j $(nproc) && \
    cd ${ROOT_DIR}/

# crc32c
cd deps/crc32c/ && rm -rfv cmake-out/ && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=${ROOT_DIR}/deps/usr \
        -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr \
        -DBUILD_SHARED_LIBS=yes \
        -DCRC32C_BUILD_TESTS=OFF \
        -DCRC32C_BUILD_BENCHMARKS=OFF \
        -DCRC32C_USE_GLOG=OFF \
        -S . -B cmake-out && \
    cmake --build cmake-out -- -j $(nproc) && \
    cmake --build cmake-out --target install -- -j $(nproc) && \
    cd ${ROOT_DIR}/

# nlohmann_json library
cd deps/json/ && rm -rfv cmake-out/ && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=${ROOT_DIR}/deps/usr \
        -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr \
        -DBUILD_SHARED_LIBS=yes \
        -DBUILD_TESTING=OFF \
        -DJSON_BuildTests=OFF \
        -S . -B cmake-out && \
    cmake --build cmake-out --target install -- -j $(nproc) && \
    cd ${ROOT_DIR}/

# opentelemetry-cpp
cd deps/opentelemetry-cpp/ && rm -rfv cmake-out/ && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=${ROOT_DIR}/deps/usr \
        -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr \
        -DBUILD_SHARED_LIBS=yes \
        -DWITH_EXAMPLES=OFF \
        -DWITH_ABSEIL=ON \
        -DBUILD_TESTING=OFF \
        -DOPENTELEMETRY_INSTALL=ON \
        -DOPENTELEMETRY_ABI_VERSION_NO=2 \
        -S . -B cmake-out && \
    cmake --build cmake-out --target install -- -j $(nproc) && \
    cd ${ROOT_DIR}/

# google-cloud-cpp
cd google-cloud-cpp/ && rm -rfv cmake-out/ && \
    cmake -S . -B cmake-out \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr/ \
          -DBUILD_TESTING=OFF \
          -DGOOGLE_CLOUD_CPP_WITH_MOCKS=OFF \
          -DGOOGLE_CLOUD_CPP_ENABLE_EXAMPLES=OFF \
          -DGOOGLE_CLOUD_CPP_ENABLE=spanner && \
    cmake --build cmake-out -- -j $(nproc) && \
    cmake --build cmake-out --target install && \
    cd ${ROOT_DIR}/
