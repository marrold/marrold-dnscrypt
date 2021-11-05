FROM lsiobase/ubuntu:bionic

WORKDIR /tmp

COPY build.sh /tmp/build.sh

RUN /tmp/build.sh

COPY root/ /

EXPOSE 5353

