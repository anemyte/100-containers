# NGINX Config Test/Debug Containers

Okay it may look stupid but actually these are pretty useful. I use one of these almost every day and often many times a day to experiment with NGINX configuration. There are currently two versions:

1. [The quick one](quick) is useful for simple tests and sharing. There's only one file that defines both the application and config, so you can write short snippets and share them with copy-paste via email or messengers.
1. [The long one](long) is for something complex. The config files are mounted inside the container. Config changes are constantly checked by the startup script with automatic reload on successful configuration test.

#### Pro Tip
If you're going to use one of these to proxy requests to an application on your host machine:
* Docker Desktop for Windows or MacOS:
  * use `host.docker.internal` instead of `localhost` in NGINX config to refer to docker host.
  * your app should accept connections from any IP `0.0.0.0` and if there's a list of hosts (allowed headers), then `host.docker.internal` must be in it as well.

* On Linux you may just enable `network_mode: host` and it'll work as if it's running on the host (i.e. you can use `localhost` for upstream address).