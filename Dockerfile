FROM debian

ARG VERSION

RUN apt-get update && \
    apt-get install -y curl iptables nftables \
    cd /tmp && \
    curl -L -o udp2raw.tar.gz https://github.com/wangyu-/udp2raw/releases/download/$VERSION/udp2raw_binaries.tar.gz && \
    tar -xf udp2raw.tar.gz && \
    mkdir /opt/udp2raw && \
    mv udp2raw_amd64* udp2raw_arm* /opt/udp2raw/ && \
    chmod +x /opt/udp2raw/* && \
    apt-get autoclean && \
    rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

WORKDIR /opt

CMD [ "echo","HELLO WORLD" ]