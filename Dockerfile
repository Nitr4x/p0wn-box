FROM debian:jessie

MAINTAINER Nitrax <nitrax@lokisec.fr>

WORKDIR /tmp/data

# Adding Kali repository
RUN echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list

RUN gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
RUN gpg -a --export ED444FF07D8D0BF6 | apt-key add -

# Installing tools
RUN apt-get -y install build-essential git dirb john p0f patator emacs dotdotpwn enum4linux dnsenum smtp-user-enum wordlists hydra

# Setting shared folder
VOLUME /tmp/data

# dotdotpwn ==> install switch module
