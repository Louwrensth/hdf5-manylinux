cmake_minimum_required(VERSION 3.24.0)
cmake_policy(SET CMP0074 NEW)

project(imas-deps-image-superbuild)

add_custom_target(superbuild ALL)

include(ExternalProject)

set(DOWNLOAD_DIR "/cache")

# set(BOOST_VERSION 1.86.0)
# ExternalProject_Add(
#     boost
#     URL https://github.com/boostorg/boost/releases/download/boost-${BOOST_VERSION}/boost-${BOOST_VERSION}-cmake.tar.xz
#     URL_HASH SHA256=2c5ec5edcdff47ff55e27ed9560b0a0b94b07bd07ed9928b476150e16b0efc57
#     CMAKE_GENERATOR Ninja
#     CMAKE_CACHE_ARGS
#         -DCMAKE_BUILD_TYPE:STRING=Release
#         -DCMAKE_INSTALL_LIBDIR:STRING=lib
#         -DBOOST_INCLUDE_LIBRARIES:STRING=algorithm;dll;stacktrace;core;math;numeric/ublas;serialization;multi_array
#     DOWNLOAD_DIR ${DOWNLOAD_DIR}
# )

# set(LIBHDF5_VERSION 1.14.5)
# set(ZLIB_VERSION 1.3)
# set(LIBAEC_VERSION 1.1.3)
# ExternalProject_Add(
#     libhdf5
#     URL https://github.com/HDFGroup/hdf5/releases/download/hdf5_${LIBHDF5_VERSION}/hdf5-${LIBHDF5_VERSION}.tar.gz
#     URL_HASH SHA256=ec2e13c52e60f9a01491bb3158cb3778c985697131fc6a342262d32a26e58e44
#     CMAKE_GENERATOR Ninja
#     CMAKE_CACHE_ARGS
#         -DCMAKE_BUILD_TYPE:STRING=Release
#         -DCMAKE_INSTALL_PREFIX:STRING=/usr/local
#         -DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=ON
#         -DHDF5_ENABLE_SZIP_SUPPORT:BOOL=ON
#         -DHDF5_BUILD_EXAMPLES:BOOL=OFF
#         -DHDF5_BUILD_TOOLS:BOOL=ON
#         -DBUILD_TESTING:BOOL=OFF
#         -DHDF5_ALLOW_EXTERNAL_SUPPORT:STRING=TGZ
#         -DZLIB_PACKAGE_NAME:STRING=zlib
#         -DZLIB_TGZ_NAME:STRING=zlib-${ZLIB_VERSION}.tar.gz
#         -DZLIB_TGZ_ORIGPATH:STRING=https://github.com/madler/zlib/releases/download/v${ZLIB_VERSION}
#         -DZLIB_USE_LOCALCONTENT:BOOL=OFF
#         -DLIBAEC_PACKAGE_NAME:STRING=libaec
#         -DLIBAEC_TGZ_NAME:STRING=libaec-${LIBAEC_VERSION}.tar.gz
#         -DLIBAEC_TGZ_ORIGPATH:STRING=https://github.com/MathisRosenhauer/libaec/releases/download/v${LIBAEC_VERSION}
#         -DLIBAEC_USE_LOCALCONTENT:BOOL=OFF
#         -DHDF_PACKAGE_NAMESPACE:STRING=ct
#     DOWNLOAD_DIR ${DOWNLOAD_DIR}
# )

# set(EIGEN_VERSION 3.4.0)
# ExternalProject_Add(
#     eigen
#     URL https://gitlab.com/libeigen/eigen/-/archive/${EIGEN_VERSION}/eigen-${EIGEN_VERSION}.tar.bz2
#     URL_HASH SHA256=b4c198460eba6f28d34894e3a5710998818515104d6e74e5cc331ce31e46e626
#     CMAKE_GENERATOR Ninja
#     CMAKE_CACHE_ARGS
#         -DCMAKE_BUILD_TYPE:STRING=Release
#         -DEIGEN_BUILD_DOC:BOOL=OFF
#         -DBUILD_TESTING:BOOL=OFF
#     DOWNLOAD_DIR ${DOWNLOAD_DIR}
# )

# set(YAML_CPP_VERSION 0.8.0)
# ExternalProject_Add(
#     yamlcpp
#     URL https://github.com/jbeder/yaml-cpp/archive/refs/tags/${YAML_CPP_VERSION}.tar.gz
#     URL_HASH SHA256=fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16
#     CMAKE_GENERATOR Ninja
#     CMAKE_CACHE_ARGS
#         -DCMAKE_BUILD_TYPE:STRING=Release
#         -DCMAKE_INSTALL_LIBDIR:STRING=lib
#         -DYAML_CPP_DISABLE_UNINSTALL:BOOL=OFF
#         -DYAML_CPP_FORMAT_SOURCE:BOOL=OFF
#         -DBUILD_TESTING:BOOL=OFF
#         -DBUILD_SHARED_LIBS:BOOL=ON
#     DOWNLOAD_DIR ${DOWNLOAD_DIR}
# )

# set(SUNDIALS_VERSION 7.0.0)
# ExternalProject_Add(
#     sundials
#     URL https://github.com/LLNL/sundials/releases/download/v${SUNDIALS_VERSION}/sundials-${SUNDIALS_VERSION}.tar.gz
#     URL_HASH SHA256=d762a7950ef4097fbe9d289f67a8fb717a0b9f90f87ed82170eb5c36c0a07989
#     CMAKE_GENERATOR Ninja
#     CMAKE_CACHE_ARGS
#         -DCMAKE_BUILD_TYPE:STRING=Release
#         -DCMAKE_INSTALL_LIBDIR:STRING=lib
#         -DBUILD_SHARED_LIBS:BOOL=OFF
#         -DEXAMPLES_ENABLE_C:BOOL=OFF
#         -DEXAMPLES_INSTALL:BOOL=OFF
#         -DENABLE_LAPACK:BOOL=ON
#         -DBLA_VENDOR:STRING=OpenBLAS
#     DOWNLOAD_DIR ${DOWNLOAD_DIR}
# )

set(FMT_VERSION 10.2.1)
ExternalProject_Add(
    fmt
    URL https://github.com/fmtlib/fmt/releases/download/${FMT_VERSION}/fmt-${FMT_VERSION}.zip
    URL_HASH SHA256=312151a2d13c8327f5c9c586ac6cf7cddc1658e8f53edae0ec56509c8fa516c9
    CMAKE_GENERATOR Ninja
    CMAKE_CACHE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=Release
        -DCMAKE_INSTALL_LIBDIR:STRING=lib
        -DFMT_DOC:BOOL=OFF
        -DFMT_TEST:BOOL=OFF
        -DBUILD_SHARED_LIBS:BOOL=ON
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
)

# set(HIGHFIVE_VERSION 2.10.0)
# ExternalProject_Add(
#     highfive
#     URL https://github.com/BlueBrain/HighFive/archive/refs/tags/v${HIGHFIVE_VERSION}.tar.gz
#     URL_HASH SHA256=c29e8e1520e7298fabb26545f804e35bb3af257005c1c2df62e39986458d7c38
#     CMAKE_GENERATOR Ninja
#     CMAKE_CACHE_ARGS
#         -DCMAKE_BUILD_TYPE:STRING=Release
#         -DHIGHFIVE_UNIT_TESTS:BOOL=OFF
#         -DHIGHFIVE_USE_BOOST:BOOL=ON
#         -DHIGHFIVE_USE_EIGEN:BOOL=ON
#         -DHIGHFIVE_EXAMPLES:BOOL=OFF
#         -DHIGHFIVE_BUILD_DOCS:BOOL=OFF
#         -DBoost_NO_BOOST_CMAKE:BOOL=OFF
#     DEPENDS boost eigen libhdf5
#     DOWNLOAD_DIR ${DOWNLOAD_DIR}
# )

set(UDA_VERSION 2.8.1)
ExternalProject_Add(
    uda
    URL https://github.com/ukaea/UDA/archive/refs/tags/${UDA_VERSION}.tar.gz
    URL_HASH SHA256=58ad0b9adcf5e9ac4b31e38df38a47d3d6e8501beed5958cf7237a60177c1c0e
    CMAKE_GENERATOR Ninja
    CMAKE_ARGS
        --debug-find
        --trace
    CMAKE_CACHE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=Release
        -Wno-deprecated
        -DBUILD_SHARED_LIBS:BOOL=ON
        -DBoost_NO_BOOST_CMAKE:BOOL=OFF
        -DCLIENT_ONLY:BOOL=ON
        -DENABLE_CAPNP:BOOL=ON
        -DSSLAUTHENTICATION:BOOL=ON
        -DNO_IDL_WRAPPER:BOOL=ON
        -DNO_JAVA_WRAPPER:BOOL=ON
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    DEPENDS fmt
)
add_dependencies(superbuild uda)
