FROM redis:3.0.2

MAINTAINER aurelien@derniercri.io

RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash - && \
    apt-get update && apt-get install -y npm supervisor \
    ; apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /var/log/supervisor

RUN npm install -g hornet

COPY build_files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

VOLUME ["/var/log/supervisor"]

EXPOSE 8187

CMD ["/usr/bin/supervisord"]