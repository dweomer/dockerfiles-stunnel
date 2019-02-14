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

### Copyright Notice
>The [MIT License](LICENSE.txt) ([MIT](https://opensource.org/licenses/MIT))
>
> Copyright &copy; 2015-2019 [Jacob Blain Christen](https://github.com/dweomer)
>
> Permission is hereby granted, free of charge, to any person obtaining a copy of
> this software and associated documentation files (the "Software"), to deal in
> the Software without restriction, including without limitation the rights to
> use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
> the Software, and to permit persons to whom the Software is furnished to do so,
> subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all
> copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
> FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
> COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
> IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
