FROM python:3

RUN apt update -y && apt install -y --fix-missing --no-install-recommends \
    software-properties-common build-essential ca-certificates \
    make cmake wget unzip libtool automake curl autoconf \
    zlib1g-dev libsqlite3-dev pkg-config sqlite3 gcc g++

RUN apt-get install tcl \
    && wget -O sqlite.tar.gz https://www.sqlite.org/src/tarball/sqlite.tar.gz?r=release \
    && tar xvfz sqlite.tar.gz && ./sqlite/configure --prefix=/usr && make && make install

ARG PROJ4_VERSION=6.2.1
RUN wget http://download.osgeo.org/proj/proj-${PROJ4_VERSION}.tar.gz -O /tmp/proj-${PROJ4_VERSION}.tar.gz \
    && tar -xvf /tmp/proj-${PROJ4_VERSION}.tar.gz -C /tmp \
    && cd /tmp/proj-${PROJ4_VERSION} \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && rm -rf /tmp/proj-${PROJ4_VERSION}