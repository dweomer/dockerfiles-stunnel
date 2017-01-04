# dweomer/stunnel
[![stars](https://img.shields.io/docker/stars/dweomer/stunnel.svg?maxAge=2592000)](https://hub.docker.com/r/dweomer/stunnel/) [![pulls](https://img.shields.io/docker/pulls/dweomer/stunnel.svg?maxAge=2592000)](https://hub.docker.com/r/dweomer/stunnel/) [![](https://images.microbadger.com/badges/image/dweomer/stunnel.svg)](https://microbadger.com/images/dweomer/stunnel "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/dweomer/stunnel.svg)](https://microbadger.com/images/dweomer/stunnel "Get your own version badge on microbadger.com")

## Stunnel on Alpine
To secure an LDAP container named `directory`:

```
docker run -itd --name ldaps --link directory:ldap \
        -e STUNNEL_SERVICE=ldaps \
        -e STUNNEL_ACCEPT=636 \
        -e STUNNEL_CONNECT=ldap:389 \
        -p 636:636 \
#       -v /etc/ssl/private/server.key:/etc/stunnel/stunnel.key:ro \
#       -v /etc/ssl/private/server.crt:/etc/stunnel/stunnel.pem:ro \
    dweomer/stunnel
```
