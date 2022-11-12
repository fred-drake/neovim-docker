FROM ubuntu:jammy
WORKDIR /work
ENV NEOVIM_BRANCH release-0.8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -qq -y curl git nodejs python3 \
    python3-pip fzf ripgrep tree npm tzdata ninja-build gettext libtool libtool-bin autoconf automake \
    cmake g++ pkg-config zip unzip \
    && rm -rf /var/lib/apt/lists/*
RUN git clone --branch ${NEOVIM_BRANCH} --depth 1 https://github.com/neovim/neovim \
    && make -C neovim -j4 \
    && make -C neovim install \
    && rm -rf neovim

