FROM		alpine:latest

RUN			apk update && \
			apk add --no-cache php-fpm php-mysqli curl

COPY		./tools/init-wordpress.sh /bin/init-wordpress.sh

RUN			chmod +x /bin/init-wordpress.sh

ENTRYPOINT	[ "/bin/sh" ]