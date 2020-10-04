FROM alpine:3.12

RUN apk add -U \
	bash \
	nginx \
	&& rm -rf /var/cache/apk*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# https://bugs.alpinelinux.org/issues/6380
RUN mkdir -p /run/nginx

ENV POWERED_BY Hephy

COPY rootfs /

CMD ["/bin/boot"]
EXPOSE 80
