FROM debian:stretch-slim

ENV KKMSERVER_VERSION 2.1.37.12_02.07.2020
ENV DEB=KkmServer_$KKMSERVER_VERSION.deb

ADD https://github.com/alexanderfefelov/kkmserver-api/raw/master/extra/kkmserver/dist/deb/$DEB /

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
    ca-certificates \
    libc6-dev \
    libcurl3 \
    libgdiplus \
    liblttng-ust0 \
    libssl1.1 \
    openssl \
  && dpkg --install /$DEB \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$DEB

ADD container/ /

ENV LANG ru_RU.utf8

VOLUME /opt/kkmserver/Settings

EXPOSE 5893

CMD ["/opt/kkmserver/kkmserver", "-s"]
