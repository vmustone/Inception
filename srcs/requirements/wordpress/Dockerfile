FROM alpine:3.18

RUN addgroup -S nginx && \
	adduser -S -G nginx -g nginx nginx

RUN apk update && \
	apk add --no-cache \
	php81 \
	php81-fpm \
	php81-cgi \
	php81-phar \
	php81-json \
	php81-mysqli \
	php81-curl \
	php81-iconv \
	wget \
	composer \
	bash \
	mariadb-client

EXPOSE 9000

RUN mkdir -p /run/php/ /var/www/html/wordpress/

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

COPY ./tools/configure.sh /

RUN chmod +x configure.sh

CMD ["sh", "/configure.sh"]
