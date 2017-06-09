FROM ubuntu
LABEL maintainer "j"

ENV DEBIAN_FRONTEND noninteractive

# Add eclipse package-drone signature and repo
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 320E6224
RUN echo 'deb http://download.eclipse.org/package-drone/release/current/ubuntu package-drone default' > /etc/apt/sources.list.d/eclipse-package-drone.list

#    && apt-get install -y --force-yes --no-install-recommends \
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        org.eclipse.packagedrone.server \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

CMD ["/usr/lib/package-drone-server/instance/server"]
