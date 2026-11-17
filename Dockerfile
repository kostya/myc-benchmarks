FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git wget clang crystal shards lld ruby && \
    pacman -Scc --noconfirm

WORKDIR /opt

RUN git clone https://github.com/kostya/qbe.git && \
    make -C qbe

RUN git clone https://github.com/michaelforney/cproc.git && \
    make -C cproc

ARG version="0.9.6"
RUN wget --progress=dot:giga -O - \
    https://github.com/vishvananda/cppgm/releases/download/v$version/cppgm-v$version-linux-x86_64.tar.gz \
    | tar -xz

ENV PATH="/opt/cppgm-v$version-linux-x86_64/bin:$PATH"

ARG myc_version="c154ee53f31d051e60f4b9a9a438963f73a265d7"
RUN git clone https://github.com/kostya/myc.git && \
    cd myc && \
    git checkout $myc_version && \
    sh build.sh

ENV PATH="/opt/gm/dev:/opt/myc:/opt/cproc:/opt/qbe:${PATH}"

