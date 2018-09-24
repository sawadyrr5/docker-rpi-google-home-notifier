#FROM hypriot/rpi-node:latest
FROM arm32v7/node:latest

# MAINTAINER Shingo Hisakawa shingohisakawa@gmail.com

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apt-get update \
    && apt-get -y install git git-core \
    && apt-get -y install nodejs npm \
    && apt-get -y install libnss-mdns libavahi-compat-libdnssd-dev \
    && apt-get -y install vim emacs \
    && npm install forever -g

# RUN apt-get install nodejs git-core avahi-daemon avahi-discover libnss-mdns libavahi-compat-libdnssd-dev

RUN git clone https://github.com/noelportugal/google-home-notifier /google-home-notifier
RUN npm install -cwd /google-home-notifier

ADD replace.sh /

RUN /replace.sh

ADD start.sh /

ENTRYPOINT /start.sh
