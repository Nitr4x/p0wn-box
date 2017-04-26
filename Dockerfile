FROM debian:jessie

MAINTAINER Nitrax <nitrax@lokisec.fr>

WORKDIR /opt

# Adding Kali repository
RUN echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list

RUN gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
RUN gpg -a --export ED444FF07D8D0BF6 | apt-key add -

# Requirements
RUN apt-get update && apt-get -y install build-essential git libswitch-perl liblwp-useragent-determined-perl

# Installing tools
RUN apt-get -y install  dirb john p0f patator dotdotpwn enum4linux dnsenum smtp-user-enum wordlists hydra wpscan snmpcheck hping3 wafw00f crunch medusa set

# Setting shared folder
VOLUME /tmp/data

WORKDIR /tmp/data
