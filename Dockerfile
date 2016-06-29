FROM ubuntu:16.04

EXPOSE 8181

RUN mkdir -p /opt/snap/src

ADD https://github.com/intelsdi-x/snap/releases/download/v0.14.0-beta/snap-v0.14.0-beta-linux-amd64.tar.gz /opt/snap/src/
# ADD https://github.com/intelsdi-x/snap/releases/download/v0.14.0-beta/snap-plugins-v0.14.0-beta-linux-amd64.tar.gz /opt/snap/src/

ADD config.json /opt/snap/src/

# Docker unpacked the snap files when they're local
RUN mkdir /opt/snap/snap && cd /opt/snap/snap && tar -zxf /opt/snap/src/snap-v0.14.0-beta-linux-amd64.tar.gz
# && tar -zxf /opt/snap/src/snap-plugins-v0.14.0-beta-linux-amd64.tar.gz

ENTRYPOINT ["/opt/snap/snap/snap-v0.14.0-beta/bin/snapd", "--api-port", "8181", "--config", "/opt/snap/src/config.json"]

