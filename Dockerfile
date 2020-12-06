FROM debian:stretch-slim

ARG KKMSERVER_VERSION=2.1.37.12_02.07.2020
ARG KKMSERVER_STUFF=KkmServer_$KKMSERVER_VERSION.deb

ADD container/ /
ADD https://github.com/alexanderfefelov/kkmserver-dist/raw/main/deb/$KKMSERVER_STUFF /

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       libc6-dev \
       libcurl3 \
       libgdiplus \
       liblttng-ust0 \
       libssl1.1 \
       netcat `# For health checks` \
       openssl \
  && dpkg --install $KKMSERVER_STUFF \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $KKMSERVER_STUFF

ENV LANG ru_RU.utf8

CMD ["/opt/kkmserver/kkmserver", "-s"]
