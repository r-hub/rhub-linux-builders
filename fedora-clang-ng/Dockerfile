
FROM fedora:34 AS base

RUN curl -LO https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.6/llvm-project-14.0.6.src.tar.xz
RUN dnf install -y xz glibc-devel.i686
RUN tar xJf llvm-project-14.0.6.src.tar.xz
WORKDIR llvm-project-14.0.6.src

RUN dnf install -y python cmake gcc g++ git perl 

RUN cmake -S llvm -B build -G "Unix Makefiles" \
    -DLLVM_ENABLE_PROJECTS="clang;openmp" \
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind;compiler-rt" \
    -DCMAKE_INSTALL_PREFIX=/usr/local/clang \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD=X86

RUN cd build/ && make -j 4

RUN cd build && make install
