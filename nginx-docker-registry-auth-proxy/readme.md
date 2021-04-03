# Container Registry Auth Proxy

This is to avoid using `docker login` on every machine on LAN. By using this proxy you can
provide unrestricted access to a private registry.

# Usage:

1. Use `docker login` once to generate credentials.
1. Inspect `$HOME/.docker/config.json`, find `auth` for the registry:
    ```json
    {
        "auths": {
            "registry.example.com": {
                "auth": "YOU NEED THIS STRING"
            }
        }
    }
    ```
1. Fill in the environment variables in `docker-compose.yml`:
    * `NGINX_SERVER_NAME`: host name of the proxy.
    * `NGINX_AUTH_CREDENTIALS`: the `auth` hash you've got during the previous step.
    * `NGINX_PROXY_TO`: URL of the private registry.
1. Bring up the proxy with `docker-compose up` and test it with `docker pull $NGINX_SERVER_NAME/image:tag`.