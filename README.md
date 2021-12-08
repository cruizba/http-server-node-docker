# http-server-node-docker
Dockerized version of http-server package of npm with automatic builds

Supports:
- amd64
- armv7
- arm64

# How to run

Go to the directory you want to serve and execute:

```
docker run -v $(pwd):/public -p 8000:8000 cruizba/http-server -p 8000
```

To use other ports...

```
docker run -v $(pwd):/public -p 8123:8123 cruizba/http-server -p 8123
```

To use basic auth...

```
docker run -v $(pwd):/public -p 8123:8123 cruizba/http-server -p 8123 --username admin --password secret
```

Very easy, ¿right?

All the options that can be used are present in the [http-server](https://www.npmjs.com/package/http-server) documentation.

# Why

I wanted to have an easy way to spawn http-server to use it temporary to share files by demand. I've also wanted to have automatic builds
of new versions of http-server in a docker image because all images I see of http-server does not convince me.
