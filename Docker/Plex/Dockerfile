FROM debian:buster

ENV TERM=linux
ENV HOSTNAME plex-server

#USER luca

RUN sudo apt-get clean \
    && apt update \
	&& apt upgrade \
	&& apt install udev

COPY plexmediaserver_1.16.6.1592-b9d49bdb7_armhf.deb /root

RUN cd /root \
	&& dpkg -i plexmediaserver_1.16.6.1592-b9d49bdb7_armhf.deb

ENTRYPOINT [ "" ]