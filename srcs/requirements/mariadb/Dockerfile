FROM alpine:3.18

RUN apk update && \
	apk add --no-cache \
	mariadb \
	mariadb-client

EXPOSE 3306

COPY conf/configure.cnf /etc/my.cnf.d/configure.cnf
RUN chmod 644 /etc/my.cnf.d/configure.cnf

COPY ./tools/setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh
ENTRYPOINT ["sh", "/tmp/setup.sh"]
