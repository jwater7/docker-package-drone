FROM ubuntu
LABEL maintainer "j"

ENV DEBIAN_FRONTEND noninteractive

# Eclipse package-drone signature
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 320E6224
RUN add-apt-repository "deb http://download.eclipse.org/package-drone/release/current/ubuntu package-drone default"

#    && apt-get install -y --force-yes --no-install-recommends \
#        openjdk-8-jre-headless \
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        org.eclipse.packagedrone.server \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["/usr/lib/package-drone-server/instance/server"]
