FROM postgres:latest
MAINTAINER João Ribeiro <joaosoft@gmail.com>

ENV PG_MAX_WAL_SENDERS 8
ENV PG_WAL_KEEP_SEGMENTS 32

COPY setup.sh /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/setup.sh
