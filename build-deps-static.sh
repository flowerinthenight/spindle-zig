#!/bin/bash

ROOT_DIR=${PWD}
rm -rfv deps/usr/ && mkdir -p deps/usr/
# mkdir -p deps/abseil-cpp/ && cd deps/abseil-cpp/ && curl -fsSL https://github.com/abseil/abseil-cpp/archive/20240722.0.tar.gz | tar -xzf - --strip-components=1 && cd ${ROOT_DIR}/
# mkdir -p deps/protobuf/ && cd deps/protobuf/ && curl -fsSL https://github.com/protocolbuffers/protobuf/archive/v28.3.tar.gz | tar -xzf - --strip-components=1 && cd ${ROOT_DIR}/
# mkdir -p deps/grpc/ && cd deps/grpc/ && curl -fsSL https://github.com/grpc/grpc/archive/v1.67.0.tar.gz | tar -xzf - --strip-components=1 && cd ${ROOT_DIR}/
# mkdir -p deps/crc32c/ && cd deps/crc32c/ && curl -fsSL https://github.com/google/crc32c/archive/1.1.2.tar.gz | tar -xzf - --strip-components=1 && cd ${ROOT_DIR}/
# mkdir -p deps/json/ && cd deps/json/ && curl -fsSL https://github.com/nlohmann/json/archive/v3.11.3.tar.gz | tar -xzf - --strip-components=1 && cd ${ROOT_DIR}/

# abseil
cd deps/abseil-cpp/ && rm -rfv cmake-out/ && \
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DABSL_BUILD_TESTING=OFF \
        -DABSL_PROPAGATE_CXX_STD=ON \
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
        -DBUILD_TESTING=OFF \
        -DJSON_BuildTests=OFF \
        -S . -B cmake-out && \
    cmake --build cmake-out --target install -- -j $(nproc) && \
    cd ${ROOT_DIR}/

# opentelemetry-cpp
# cd deps/opentelemetry-cpp/ && rm -rfv cmake-out/ && \
#     cmake \
#         -DCMAKE_BUILD_TYPE=Release \
#         -DCMAKE_PREFIX_PATH=${ROOT_DIR}/deps/usr \
#         -DCMAKE_INSTALL_PREFIX=${ROOT_DIR}/deps/usr \
#         -DBUILD_SHARED_LIBS=yes \
#         -DWITH_EXAMPLES=OFF \
#         -DWITH_ABSEIL=ON \
#         -DBUILD_TESTING=OFF \
#         -DOPENTELEMETRY_INSTALL=ON \
#         -DOPENTELEMETRY_ABI_VERSION_NO=2 \
#         -S . -B cmake-out && \
#     cmake --build cmake-out --target install -- -j $(nproc) && \
#     cd ${ROOT_DIR}/

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
