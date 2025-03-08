FROM		alpine:latest

RUN			apk update && \
			apk add --no-cache mariadb mariadb-client

RUN			mkdir -p /var/lib/mysql && \
			chown -R mysql:mysql /var/lib/mysql && \
			mkdir -p /var/lib/mysql/log && \
			chown -R mysql:mysql /var/lib/mysql/log && \
			chmod 740 /var/lib/mysql/log

COPY		./conf/*.cnf /etc/my.cnf.d/

COPY		./tools/init-db.sh /bin/init-db.sh

RUN			chmod +x /bin/init-db.sh

ENTRYPOINT	[ "/bin/init-db.sh" ]