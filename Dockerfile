FROM ubuntu:latest
MAINTAINER Jacek Grobelny jacek.grobelny@gmail.com

ENV PATH /minecraft:$PATH
ENV LD_LIBRARY_PATH /minecraft

RUN apt-get update && \
	apt-get install --no-install-recommends -y lsof unzip curl wget libssl1.0.0 && \
	apt-get clean && \
    mkdir /minecraft && \
    wget --no-check-certificate https://minecraft.azureedge.net/bin-linux/bedrock-server-1.6.1.0.zip -O /minecraft/bedrock-server-1.6.1.0.zip && \
    unzip /minecraft/bedrock-server-1.6.1.0.zip -d /minecraft

WORKDIR /minecraft

ENTRYPOINT [ "bedrock_server" ]
