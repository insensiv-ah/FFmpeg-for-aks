# syntax=docker/dockerfile:1

FROM ubuntu:22.04
# Add required sources:
ADD https://github.com/insensiv-ah/FFmpeg-for-aks.git#n7.1.1 /ffmpeg
# Install build dependencies:
RUN apt update && apt install -y \
        build-essential \
        pkg-config \
        nasm && \
    rm -rf /var/lib/apt/lists/*
# Build custom FFmpeg:
WORKDIR /ffmpeg
RUN ./configure --prefix=/opt/insensiv/ffmpeg-for-aks --enable-rpath \
        --disable-static --enable-shared --disable-programs --disable-doc \
        --disable-indevs --disable-outdevs && \
    grep -q 'FFMPEG_LICENSE "LGPL version 2.1 or later"' config.h && \
    make -j9 && make install && make clean
