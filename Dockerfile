# Note, expects BASE_IMAGE manylinux_2_24 (Debian 9 based)
ARG BASE_IMAGE=manylinux_2_24
# Note, TARGET_ARCH is deliberately different from TARGETARCH which is defined by docker.
ARG TARGET_ARCH=x86_64
FROM quay.io/pypa/${BASE_IMAGE}_${TARGET_ARCH} AS builder

# Has to be repeated here so it's imported from the "top level" above the FROM
ARG TARGET_ARCH

COPY CMakeLists.txt /build/
WORKDIR /build/

RUN --mount=type=cache,target=/cache echo "Install system dependencies" \
    && echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --allow-downgrades libssl-dev libssl1.1=1.1.0l-1~deb9u1 \
    && apt-get install -y pkg-config ninja-build \
    && apt-get install -y libboost-dev libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-test-dev libboost-iostreams-dev \
    && apt-get install -y libhdf5-serial-dev \
    && apt-get install -y capnproto libcapnp-dev \
    && apt-get install -y libspdlog-dev libxml2-dev libtirpc-dev xsltproc \
    && apt-get install -y libfmt3-dev

RUN --mount=type=cache,target=/cache echo "CMake superbuild" \
    && cmake -G Ninja -S . -B build \
    && cd build \
    && ninja \
    && cd .. \
    && rm -rf build
