FROM ubuntu:18.04
MAINTAINER Lucas Hutchinson <lucas.hutchinson@gmail.com>
LABEL Description="Image for building esp32 projects from git"
WORKDIR /work

ADD . /work
RUN mkdir -p ~/esp

RUN apt-get update && apt-get install -y git wget make libncurses-dev flex bison gperf python python-serial ccache curl

RUN cd ~/esp && \
    wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz && \
    git clone --recursive --depth 1 https://github.com/espressif/esp-idf.git -b release/v3.0
    
ENV PATH=$PATH:$HOME/esp/xtensa-esp32-elf/bin
ENV IDF_PATH=~/esp/esp-idf
