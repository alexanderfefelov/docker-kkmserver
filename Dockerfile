FROM debian:stretch-slim

ENV KKMSERVER_VERSION 2.1.25.12_22.12.2018

ADD https://github.com/alexanderfefelov/kkmserver-api/raw/master/extra/kkmserver/dist/deb/KkmServer_$KKMSERVER_VERSION.deb /

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
  && apt-get install -qq --yes --no-install-recommends liblttng-ust0 libcurl3 libgdiplus libc6-dev libssl1.0.2 locales \
  && localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8 \
  && dpkg --install /KkmServer_$KKMSERVER_VERSION.deb \
  && rm --force /KkmServer_$KKMSERVER_VERSION.deb \
  && apt-get -qq clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD container/ /

ENV LANG ru_RU.utf8

VOLUME /opt/kkmserver/Settings

EXPOSE 5893

CMD ["/opt/kkmserver/kkmserver", "-s"]
