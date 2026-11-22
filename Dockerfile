FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git wget clang crystal shards lld ruby && \
    pacman -Scc --noconfirm

ENV CC=clang
WORKDIR /opt

RUN git clone https://github.com/kostya/qbe.git && \
    make -C qbe

ENV PATH="/opt/qbe:${PATH}"

RUN git clone https://github.com/michaelforney/cproc.git && \
    make -C cproc

ENV PATH="/opt/cproc:${PATH}"

RUN git clone https://github.com/kostya/myc.git

ENV PATH="/opt/myc:${PATH}"

ARG gm_version="0.10.3"
RUN mkdir -p /opt/myc/plugins/cppgm && wget -qO- https://github.com/vishvananda/cppgm/releases/download/v$gm_version/cppgm-v$gm_version-linux-x86_64.tar.gz | tar -xz -C /opt/myc/plugins/cppgm --strip-components=1

ENV PATH="/opt/myc/plugins/cppgm/bin:$PATH"

ARG myc_version="6ae1303a097db1d38e6972a235e5dc41721ea984"
RUN cd /opt/myc \
    && git fetch \
    && git checkout $myc_version \
    && sh build.sh

