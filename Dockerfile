FROM debian:jessie

MAINTAINER Nitrax <nitrax@lokisec.fr>

# Adding Kali repository
RUN echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list

RUN gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
RUN gpg -a --export ED444FF07D8D0BF6 | apt-key add -

# Requirements
RUN apt-get update && apt-get -y install build-essential git libswitch-perl liblwp-useragent-determined-perl wget tmux vim locales

# Installing tools
RUN apt-get -y install  dirb john p0f patator dotdotpwn enum4linux dnsenum smtp-user-enum wordlists hydra snmpcheck hping3 wafw00f crunch medusa set wpscan httrack nmap sslscan sqlmap

# Setting and lauching postgresql
ADD ./conf/database.sql /tmp/
RUN /etc/init.d/postgresql start && su postgres -c "psql -f /tmp/database.sql"
USER root
ADD ./conf/database.yml /usr/share/metasploit-framework/config/

# Setting fish shell
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list
RUN wget -qO - http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key | apt-key add -
RUN apt update
RUN apt -y install fish
ADD conf/conf.fish /root/.config/fish/conf.d/

WORKDIR /opt

# Install oh-my-fish
RUN git clone https://github.com/oh-my-fish/oh-my-fish omf
RUN /opt/omf/bin/install --offline --noninteractive
RUN echo "omf install godfather" | fish

# Setting tmux
ADD conf/locale.gen /etc/
ADD conf/.tmux.conf /root/
RUN locale-gen

# Setting shared folder
VOLUME /tmp/data

WORKDIR /tmp/data
