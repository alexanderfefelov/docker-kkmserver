FROM ubuntu:16.04

ENV VERSION 2.1.24.15_09.12.2018

ADD https://github.com/alexanderfefelov/kkmserver-api/raw/master/extra/kkmserver/dist/deb/KkmServer_$VERSION.deb /

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update \
  && apt-get install -qq --yes --no-install-recommends liblttng-ust0 libcurl3 libgdiplus libc6-dev locales \
  && localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8 \
  && dpkg --install /KkmServer_$VERSION.deb \
  && rm --force /KkmServer_$VERSION.deb \
  && apt-get -qq clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD container/ /

ENV LANG ru_RU.utf8

VOLUME /opt/kkmserver/Settings

EXPOSE 5893

CMD ["/opt/kkmserver/kkmserver", "-s"]
