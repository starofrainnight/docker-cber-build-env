FROM ubuntu:18.04
LABEL MAINTAINER Hong-She Liang <starofrainnight@gmail.com>

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    bash \
    wget \
    flex \
    build-essential \
    python3 \
    subversion \
    subversion-tools \
    git-all \
    && apt-get clean

RUN cd /tmp && wget -c http://ftp.gnu.org/gnu/bison/bison-3.5.2.tar.xz
RUN cd /tmp && tar xvf bison-3.5.2.tar.xz
RUN cd /tmp/bison-3.5.2 && ./configure && make && make install
RUN rm -rf /tmp/bison*
