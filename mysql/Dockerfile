FROM mysql:8.0.35

LABEL maintainer="lysowc <lysowc@gmail.com>" version="0.01" license="MIT" describe="local-server"

COPY my.cnf /etc/mysql/conf.d/my.cnf

RUN chmod 0444 /etc/mysql/conf.d/my.cnf

EXPOSE 3306
