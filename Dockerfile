FROM ubuntu:xenial

RUN apt-get update -q && \
    apt-get upgrade -qy && \
    apt-get install -qy git-core && \
    apt-get install -qy python && \
    apt-get install -qy python-pip python-dev libssl-dev && \ 
    apt-get clean
  
RUN git clone https://github.com/CouchPotato/CouchPotatoServer.git /opt/couchpotato

RUN cd /tmp && \
    wget http://rarlab.com/rar/unrarsrc-5.2.7.tar.gz && \
    tar -xvf unrarsrc-5.2.7.tar.gz && \
    cd unrar && \
    make -f makefile && \
    install -v -m755 unrar /usr/bin

ADD launch.sh /launch.sh
RUN chmod +x "/launch.sh"

VOLUME  ["/data/downloads"]
VOLUME  ["/data/movies"]
VOLUME  ["/data/couchpotato"]


EXPOSE 5050

CMD ["/launch.sh"]
