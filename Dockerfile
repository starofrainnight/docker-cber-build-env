FROM ubuntu:18.04
LABEL MAINTAINER Hong-She Liang <starofrainnight@gmail.com>

ENV LANG C.UTF-8
# Avoiding user interaction with tzdata
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    p7zip-full \
    wget \
    flex \
    build-essential \
    python3 \
    subversion \
    subversion-tools \
    git-all \
    uuid \
    libuuid1 \
    uuid-dev \
    pkg-config \
    cmake \
    cmake-curses-gui \
    openjdk-11-jdk \
    && apt-get clean

RUN cd /tmp && wget -c http://ftp.gnu.org/gnu/bison/bison-3.5.2.tar.xz
RUN cd /tmp && tar xvf bison-3.5.2.tar.xz
RUN cd /tmp/bison-3.5.2 && ./configure && make && make install
RUN rm -rf /tmp/bison*

ADD files/grun /usr/local/bin/
ADD files/antlr4 /usr/local/bin/
RUN chmod +x /usr/local/bin/grun /usr/local/bin/antlr4
RUN cd /tmp && wget https://www.antlr.org/download/antlr-4.8-complete.jar && mv antlr-4.8-complete.jar /usr/local/lib/
RUN cd /tmp && git clone --depth=1 https://github.com/antlr/antlr4.git && cd ./antlr4/runtime/Cpp && cmake . && make && make install
RUN rm -rf /tmp/antlr4
