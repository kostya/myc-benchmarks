FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git wget clang crystal shards lld ruby less vim mc && \
    pacman -Scc --noconfirm

WORKDIR /opt

RUN git clone https://github.com/kostya/qbe.git && \
    make -C qbe

ENV PATH="/opt/qbe:${PATH}"

RUN git clone https://github.com/michaelforney/cproc.git && \
    make -C cproc

ENV PATH="/opt/cproc:${PATH}"

RUN git clone https://github.com/vishvananda/cppgm-extended.git gm
RUN git clone https://github.com/vishvananda/myc.git

ARG gm_version="1597e573a4882a000810eb15f86d4cb230ce4afd"
RUN cd /opt/gm \
    && git fetch \
    && git checkout $gm_version \
    && make -C dev cppgm++ lowir-library CXX=clang++ CPPGM_HOST_CXX=clang++ -j8

ENV GM_LIBRARY="/opt/gm/dev/libcppgm_lowir.so"

ARG myc_version="4dcea3fadf690d19ecd652e41c29f2b3c1f00941"
RUN cd /opt/myc \
    && git fetch \
    && git checkout $myc_version \
    && crystal build ./src/cli/llvm.cr --release -o myc-llvm \
    && crystal build ./src/cli/qbe.cr --release -o myc-qbe \
    && crystal build ./src/cli/c.cr --release -o myc-c \
    && shards \
    && crystal build ./src/cli/gm.cr --release -o myc-gm \
    && crystal build ./src/cli/mycc.cr --release -o mycc
    && crystal build ./src/cli/gm.cr --release -o myc-gm-static \
    && crystal build ./src/cli/mycc.cr --release -o mycc-static

ENV PATH="/opt/gm/dev:/opt/myc:${PATH}"
