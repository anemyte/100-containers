# NGINX HTTP Header Sniffer

Use to find out which HTTP headers an app sends out.

#### Usage:
1. Modify [conf.d/default.conf](conf.d/default.conf) by replacing `https://example.com` with an address of the actual server, to which you want to forward requests.
1. Bring up the proxy with `docker-compose up`
1. Make your application to use the proxy instead of real server.
1. See headers in container `stderr`:
```
nginx_1  | 2021/04/03 07:04:31 [error] 6#6: *1 [lua] header_filter_by_lua:7: 
nginx_1  | Request headers (name|value):
nginx_1  |     cache-control | max-age=0
nginx_1  |     sec-ch-ua | "Chromium";v="88", "Google Chrome";v="88", ";Not A Brand";v="99"
nginx_1  |     sec-ch-ua-mobile | ?0
nginx_1  |     dnt | 1
nginx_1  |     upgrade-insecure-requests | 1
nginx_1  |     user-agent | Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36
nginx_1  |     accept | text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
nginx_1  |     sec-fetch-site | none
nginx_1  |     sec-fetch-mode | navigate
nginx_1  |     sec-fetch-user | ?1
nginx_1  |     sec-fetch-dest | document
nginx_1  |     accept-encoding | gzip, deflate, br
nginx_1  |     accept-language | en-GB,en;q=0.9,ru-RU;q=0.8,ru;q=0.7,en-US;q=0.6
nginx_1  |     if-none-match | "3147526947+gzip"
nginx_1  |     host | localhost
nginx_1  |     if-modified-since | Thu, 17 Oct 2019 07:18:26 GMT
nginx_1  |     connection | keep-alive
nginx_1  |  while reading response header from upstream, client: 172.23.0.1, server: localhost, request: "GET / HTTP/1.1", upstream: "https://93.184.216.34:443/", host: "localhost"
```
Don't mind the first and the last lines, that's a side effect of using `ngx.ERR`.