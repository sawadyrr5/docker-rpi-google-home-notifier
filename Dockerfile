#FROM hypriot/rpi-node:latest
FROM arm32v7/node:latest

# MAINTAINER Shingo Hisakawa shingohisakawa@gmail.com

# RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apt-get update
# RUN apt-get install nodejs git-core avahi-daemon avahi-discover libnss-mdns libavahi-compat-libdnssd-dev
RUN apt-get -y install git git-core
RUN apt-get -y install nodejs npm
RUN apt-get -y install libnss-mdns libavahi-compat-libdnssd-dev

RUN apt-get -y install vim emacs
RUN npm install forever -g
RUN git clone https://github.com/noelportugal/google-home-notifier /google-home-notifier
RUN npm install -cwd /google-home-notifier

ADD replace.sh /

RUN /replace.sh

ADD start.sh /

ENTRYPOINT /start.sh
