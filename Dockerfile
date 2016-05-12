FROM ubuntu:xenial

RUN apt-get update -q && \
    apt-get upgrade -qy && \
    apt-get install -qy git-core && \
    apt-get install -qy python && \
    apt-get clean
  
RUN git clone https://github.com/CouchPotato/CouchPotatoServer.git /opt/couchpotato

ADD launch.sh /launch.sh
RUN chmod +x "/launch.sh"

VOLUME  ["/data/downloads"]
VOLUME  ["/data/movies"]
VOLUME  ["/data/couchpotato"]


EXPOSE 5050

CMD ["/launch.sh"]
