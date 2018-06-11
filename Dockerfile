FROM python:3

ENV PROJ4_VERSION=5.0.1

# Install Proj.4
RUN wget --no-check-certificate --content-disposition https://github.com/OSGeo/proj.4/releases/download/${PROJ4_VERSION}/proj-${PROJ4_VERSION}.tar.gz -O /tmp/proj-${PROJ4_VERSION}.tar.gz \
    && tar -xvf /tmp/proj-${PROJ4_VERSION}.tar.gz -C /tmp \
    && cd /tmp/proj-${PROJ4_VERSION} \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && rm -rf /tmp/proj-${PROJ4_VERSION}
