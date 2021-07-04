# Cron inside a container

Having cron in container environment is usually a bad practice for production but sometimes other ways are just too complicated/expensive in terms of time to implement. This is an example of how cron can be managed with environment variables. This is not the only way how one can create or update cron tasks in a container, but from management perspective I think using environment variables is the most convenient approach in long term.

The main component here is the [script](docker-entrypoint.sh), the [Dockerfile](Dockerfile) is just a minimal integration example. Take the script contents into startup sequence of your image, and the job is done.

Example usage (see [docker-compose.yml](docker-compose.yml) for full example):
```yaml
      CRONTAB: |
        # Now you can work with it like with a normal crontab

        # For example, you can declare variables:
        PATH=/usr/bin:/bin
        FOO=bar

        # Jobs (obviously):
        * * * * * echo "I'm doing something useful" > /proc/1/fd/1

        # Use variables:
        * * * * * echo "Hello, $$USER" >> hello.txt

        # Note 1:
        # Double 'dollar sign' is not a mistake. If you use signle dollar, docker
        # will interpret it as if you want to put here some variable from .env file.
        # So if you want to inject a docker variable use '$variable', if you want to
        # use system environment variable, use $$variable (docker will just cut off
        # the extra sign).

        # Note 2:
        # Remember: cron environment is limited in variables. It's best to explicitly
        # define any environment variables you want to use.
```
