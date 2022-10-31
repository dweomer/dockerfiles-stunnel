FROM alpine:latest

RUN set -x \
 && addgroup -S stunnel \
 && adduser -S -G stunnel stunnel \
 && apk add --update --no-cache \
        ca-certificates \
        libintl \
        openssl \
        stunnel \
 && grep main /etc/apk/repositories > /etc/apk/main.repo \
 && apk add --update --no-cache --repositories-file=/etc/apk/main.repo \
        gettext \
 && cp -v /usr/bin/envsubst /usr/local/bin/ \
 && apk del --purge \
        gettext \
 && apk --no-network info openssl \
 && apk --no-network info stunnel
COPY *.template openssl.cnf /srv/stunnel/
COPY stunnel.sh /srv/

RUN set -x \
 && chmod +x /srv/stunnel.sh \
 && mkdir -p /var/run/stunnel /var/log/stunnel \
 && chown -vR stunnel:stunnel /var/run/stunnel /var/log/stunnel \
 && mv -v /etc/stunnel/stunnel.conf /etc/stunnel/stunnel.conf.original

ENTRYPOINT ["/srv/stunnel.sh"]
CMD ["stunnel"]

LABEL org.label-schema.name="dweomer/stunnel" \
      org.label-schema.description="Stunnel on Alpine" \
      org.label-schema.url="https://github.com/dweomer/dockerfiles-stunnel/" \
      org.label-schema.usage="https://github.com/dweomer/dockerfiles-stunnel/blob/master/README.md" \
      org.label-schema.vcs-url="https://github.com/dweomer/dockerfiles-stunnel/" \
      org.label-schema.vendor="Jacob Blain Christen - mailto:dweomer5@gmail.com, https://github.com/dweomer, https://twitter.com/dweomer" \
      org.label-schema.schema-version="1.0"
