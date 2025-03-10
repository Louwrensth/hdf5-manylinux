# Note, expects BASE_IMAGE manylinux_2_28 (Alma 8 based)
ARG BASE_IMAGE=manylinux_2_28
# Note, TARGET_ARCH is deliberately different from TARGETARCH which is defined by docker.
ARG TARGET_ARCH=x86_64
FROM quay.io/pypa/${BASE_IMAGE}_${TARGET_ARCH} AS builder

# Has to be repeated here so it's imported from the "top level" above the FROM
ARG TARGET_ARCH

ARG FMT_VERSION=11.1.4
ARG UDA_VERSION=2.8.1

# COPY CMakeLists.txt /build/
WORKDIR /build/

RUN --mount=type=cache,target=/cache echo "Install system dependencies" \
    && dnf list available \
    && dnf -y install libssl-devel \
    && dnf -y install pkg-config ninja-build \
    && dnf -y install libboost-devel libboost-system-devel libboost-filesystem-devel libboost-program-options-devel libboost-test-devel libboost-iostreams-devel \
    && dnf -y install libhdf5-serial-devel \
    && dnf -y install capnproto libcapnp-devel \
    && dnf -y install libspdlog-dev libxml2-devel libtirpc-dev xsltproc

# RUN --mount=type=cache,target=/cache echo "CMake superbuild" \
#     && cmake -G Ninja -S . -B build \
#     && cd build \
#     && ninja \
#     && cd .. \
#     && rm -rf build

RUN --mount=type=cache,target=/cache echo "Install fmt" \
    && curl -LO https://github.com/fmtlib/fmt/archive/refs/tags/${FMT_VERSION}.tar.gz \
    && tar zxf ${FMT_VERSION}.tar.gz \
    && cd fmt-${FMT_VERSION} \
    && cmake -G Ninja -B build . -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_LIBDIR:STRING=lib -DFMT_DOC:BOOL=OFF -DFMT_TEST:BOOL=OFF -DBUILD_SHARED_LIBS:BOOL=ON \
    && cmake --build build --target install \
    && cmake --install build \
    && cd .. \
    && rm -rf fmt-${FMT_VERSION} ${FMT_VERSION}.tar.gz

RUN --mount=type=cache,target=/cache echo "Install UDA" \
    && curl -LO https://github.com/ukaea/UDA/archive/refs/tags/${UDA_VERSION}.tar.gz \
    && tar zxf ${UDA_VERSION}.tar.gz \
    && cd UDA-${UDA_VERSION} \
    && cmake -G Ninja -B build . --trace --debug-find -Wno-deprecated -DBUILD_SHARED_LIBS:BOOL=ON -DSSLAUTHENTICATION:BOOL=ON -DCLIENT_ONLY:BOOL=ON -DENABLE_CAPNP:BOOL=ON \
    && cmake --build build --target install \
    && cmake --install build \
    && cd .. \
    && rm -rf UDA-${UDA_VERSION} ${UDA_VERSION}.tar.gz

