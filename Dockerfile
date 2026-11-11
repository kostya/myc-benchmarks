FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel git wget clang crystal shards lld ruby && \
    pacman -Scc --noconfirm

WORKDIR /opt

RUN git clone https://github.com/kostya/qbe.git && \
    make -C qbe

RUN git clone https://github.com/michaelforney/cproc.git && \
    make -C cproc

ARG gm_version="1ddd7507ee861649d43d1e72dcde7bb17a85a691"
RUN git clone https://github.com/vishvananda/cppgm-extended.git gm && \
    cd gm && \
    git checkout $gm_version && \
    make -C dev cppgm++ CXX=clang++ CPPGM_HOST_CXX=clang++ -j8

ARG myc_version="add_gm"
RUN git clone https://github.com/kostya/myc.git && \
    cd myc && \
    git checkout $myc_version && \
    sh build.sh

ENV PATH="/opt/gm/dev:/opt/myc:/opt/cproc:/opt/qbe:${PATH}"

RUN for t in clang gcc cproc qbe cppgm++ myc-llvm myc-qbe myc-c myc-gm; do \
      printf '%s: ' "$t"; \
      command -v "$t" >/dev/null 2>&1 \
        && { "$t" --version 2>&1 | head -n1 || "$t" -v 2>&1 | head -n1; } \
        || echo "not found"; \
    done
    