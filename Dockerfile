FROM swipl/swipl
LABEL maintainer "Dave Curylo <dave@curylo.org>"
RUN apt-get install -y wget unzip \
    && wget https://github.com/SWI-Prolog/pengines/archive/master.zip \
    && unzip master.zip \
    && mv pengines-master pengines
# Expose the default port for pengines
EXPOSE 3030
# Set the pengines admin account to admin:admin
RUN echo 'admin:$1$vUXiHMJy$DI1JHDLqTytUYGTHicJvE0' >>/pengines/passwd
WORKDIR /pengines
ENTRYPOINT ["/bin/swipl"]
CMD ["-q","run.pl"]
