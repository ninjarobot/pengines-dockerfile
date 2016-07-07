FROM debian:jessie
RUN apt-get update && apt-get install -y \
        wget git \
        build-essential autoconf curl chrpath pkg-config \
        ncurses-dev libreadline-dev libunwind8-dev \
        libgmp-dev \
        libssl-dev \
        unixodbc-dev \
        zlib1g-dev libarchive-dev \
        libossp-uuid-dev \
        libxext-dev libice-dev libjpeg-dev libxinerama-dev libxft-dev \
        libxpm-dev libxt-dev \
        libdb-dev \
        openjdk-7-jdk junit
RUN wget http://www.swi-prolog.org/download/stable/src/swipl-7.2.3.tar.gz && tar -xzvf swipl-7.2.3.tar.gz && cd swipl-7.2.3 && ./configure && make && make install && make world && make install-world
RUN git clone https://github.com/SWI-Prolog/pengines
# Expose the default port for pengines
EXPOSE 3030
# Set the pengines admin account to admin:admin
RUN echo 'admin:$1$vUXiHMJy$DI1JHDLqTytUYGTHicJvE0' >>/pengines/passwd
WORKDIR /pengines
ENTRYPOINT /usr/local/bin/swipl
CMD -q run.pl