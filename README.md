# Hornet-docker

* https://github.com/derniercri/hornet-docker

## Description

Hornet-docker offers a dockerization of Hornet, a realtime engine originally built for [Fresc](http://fre.sc).

You can find all informations about Hornet on its [Github repository](https://github.com/derniercri/hornet).

This docker image is based on the [official Redis Docker repository](https://registry.hub.docker.com/_/redis/), and is powered by [Supervisor](http://supervisord.org/) to control both processes of Redis and Hornet.

## Build it

Build this dockerfile by :

```
$ docker build -t hornet .
```

## Run it

Run the built hornet image by :

```
$ docker run --name some-hornet -p 8187:8187 -d hornet
```

You can also get the image from the [Nectify DockerHub](https://registry.hub.docker.com/u/nectify/hornet/) :

```
$ docker run --name some-hornet -p 8187:8187 -d nectify/hornet
```

## Link it

Connect the Hornet container from your application :

```
$ docker run --name some-app --link some-hornet:hornet -d application-that-uses-hornet
```

Docker will provide to your `some-app` container some useful environment variables with informations about Hornet address :

* `HORNET_PORT_8187_TCP_ADDR` : IP address of the container
* `HORNET_PORT_8187_TCP_PORT` : port number for Hornet

## Exposed ports

* `8187` : default port for Hornet
* `6379` : default port for Redis (from its [Dockerfile](https://github.com/docker-library/redis/blob/master/3.0/Dockerfile))

## Get the logs

Supervisor provides logs for Hornet and Redis.

These logs are in the directory `/var/log/supervisor`.

Share it with your Docker host by mounting it as a volume :

```
$ docker run --name some-hornet -p 8187:8187 -v /path/from/host:/var/log/supervisor -d hornet
```

## License

* This Dockerfile and Hornet are distributed under [Apache 2 License](http://www.apache.org/licenses/LICENSE-2.0.html).
* View [license information for Redis](http://redis.io/topics/license).
* npm is released under the [Artistic License 2.0](https://www.npmjs.com/policies/npm-license).
* Supervisor is released under the [ZPL-derived license](http://repoze.org/LICENSE.txt).