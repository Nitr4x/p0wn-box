FROM debian:jessie

MAINTAINER Nitrax <nitrax@lokisec.fr>

# Adding Kali repository
RUN echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list

RUN gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
RUN gpg -a --export ED444FF07D8D0BF6 | apt-key add -

# Requirements
RUN apt-get update && apt-get -y install build-essential git libswitch-perl liblwp-useragent-determined-perl

# Installing tools
RUN apt-get -y install  dirb john p0f patator dotdotpwn enum4linux dnsenum smtp-user-enum wordlists hydra snmpcheck hping3 wafw00f crunch medusa set wpscan

# Setting and lauching postgresql
ADD ./conf/database.sql /tmp/
RUN /etc/init.d/postgresql start && su postgres -c "psql -f /tmp/database.sql"
USER root
ADD ./conf/database.yml /usr/share/metasploit-framework/config/

# Setting shared folder
VOLUME /tmp/data

WORKDIR /tmp/data
