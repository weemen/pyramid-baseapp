FROM mysql:5.7

COPY conf.d/*.cnf /etc/mysql/conf.d/

COPY /docker-entrypoint-initdb.d/
