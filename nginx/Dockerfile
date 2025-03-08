FROM    	alpine:latest

RUN			apk update && \
			apk add --no-cache  nginx openssl

RUN 		mkdir -p /etc/nginx/ssl/ymafaman/ && chmod 700 /etc/nginx/ssl/ymafaman/

RUN			openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout /etc/nginx/ssl/ymafaman/ymafaman.key -out /etc/nginx/ssl/ymafaman/ymafaman.crt \
			-subj "/CN=ymafaman.42.fr/emailAddress=mfnyassine@gmail.com/O=1337"

WORKDIR		/etc/nginx

COPY    	./conf/*.conf ./http.d/

ENTRYPOINT	[ "nginx", "-g", "daemon off;" ]