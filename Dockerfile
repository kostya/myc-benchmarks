FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git wget clang crystal shards lld ruby && \
    pacman -Scc --noconfirm

WORKDIR /opt

RUN git clone https://github.com/kostya/qbe.git && \
    make -C qbe

RUN git clone https://github.com/michaelforney/cproc.git && \
    make -C cproc

ARG gm_version="01bac61953a982df28933dfde0fa03eb65838ea4"
RUN git clone https://github.com/vishvananda/cppgm-extended.git gm && \
    cd gm && \
    git checkout $gm_version && \
    make -C dev cppgm++ CXX=clang++ CPPGM_HOST_CXX=clang++ -j8

ARG myc_version="4dcea3fadf690d19ecd652e41c29f2b3c1f00941"
RUN git clone https://github.com/vishvananda/myc.git && \
    cd myc && \
    git checkout $myc_version && \
    sh build.sh

ENV PATH="/opt/gm/dev:/opt/myc:/opt/cproc:/opt/qbe:${PATH}"

