FROM postgres:latest
MAINTAINER João Ribeiro <joaosoft@gmail.com>

COPY setup.sh /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/setup.sh
