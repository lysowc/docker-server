FROM redis:7.2.3

LABEL maintainer="lysowc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

## For security settings uncomment, make the dir, copy conf, and also start with the conf, to use it
RUN mkdir -p /usr/local/etc/redis
COPY redis.conf /usr/local/etc/redis/redis.conf

#CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
