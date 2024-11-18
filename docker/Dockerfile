FROM ubuntu:22.04
WORKDIR /tmp/
RUN apt-get update && apt-get --no-install-recommends install -y apt-transport-https apt-utils \
  automake build-essential cmake ca-certificates curl git \
  gcc g++ libc-ares-dev libc-ares2 libcurl4-openssl-dev libre2-dev \
  libssl-dev m4 make pkg-config tar wget zlib1g-dev
RUN git clone https://github.com/flowerinthenight/spindle-zig && \
  cd spindle-zig/ && \
  git submodule update --remote && \
  mkdir -p deps/usr/ && \
  mkdir -p deps/abseil-cpp/ && cd deps/abseil-cpp/ && curl -fsSL https://github.com/abseil/abseil-cpp/archive/20240722.0.tar.gz | tar -xzf - --strip-components=1 && cd ../../ && \
  mkdir -p deps/protobuf/ && cd deps/protobuf/ && curl -fsSL https://github.com/protocolbuffers/protobuf/archive/v28.3.tar.gz | tar -xzf - --strip-components=1 && cd ../../ && \
  mkdir -p deps/grpc/ && cd deps/grpc/ && curl -fsSL https://github.com/grpc/grpc/archive/v1.67.0.tar.gz | tar -xzf - --strip-components=1 && cd ../../ && \
  mkdir -p deps/crc32c/ && cd deps/crc32c/ && curl -fsSL https://github.com/google/crc32c/archive/1.1.2.tar.gz | tar -xzf - --strip-components=1 && cd ../../ && \
  mkdir -p deps/json/ && cd deps/json/ && curl -fsSL https://github.com/nlohmann/json/archive/v3.11.3.tar.gz | tar -xzf - --strip-components=1 && cd ../../ && \
  mkdir -p deps/opentelemetry-cpp/ && cd deps/opentelemetry-cpp/ && curl -fsSL https://github.com/open-telemetry/opentelemetry-cpp/archive/v1.17.0.tar.gz | tar -xzf - --strip-components=1 && cd ../../ && \
  ls -l deps/

FROM debian:stable-slim
RUN set -x && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app/
COPY --from=0 /tmp/zig-out/bin/zgroup .
ENTRYPOINT ["/app/zgroup"]
CMD ["group1", "0.0.0.0:8080"]
