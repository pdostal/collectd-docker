# collectd-docker

Simple [CollectD](https://github.com/collectd/collectd) instance running within a [Docker](https://github.com/docker/docker) container. It sends CPU statistics every 10 seconds to a specified endpoint (see below), which can accept traffic from the [write_graphite](https://collectd.org/wiki/index.php/Plugin:Write_Graphite) plugin.

**Note** 

* The primary purpose of this container is to test the [Ruby CollectD](https://github.com/revett/collectd) gem locally.
* The CollectD instance also accepts UDP traffic from StatsD clients on port `8125`.

## Setup 

1. [Install Docker](http://docs.docker.com/installation/mac/).
2. Pull the latest image from the Docker [registry](https://registry.hub.docker.com/u/revett/collectd-carbon/):

```
docker pull revett/collectd
```

## Usage

Start the container:

```
docker run -d -e HOST_NAME=test -e EP_HOST=example.com -e EP_PORT=2003 -p 8125:8125/udp revett/collectd
```

### Environment Variables

You **must** replace each of the following environment variables within the `docker run` command shown above:

* `HOST_NAME`
  - Used to create the namespace in Carbon/Graphite.
* `EP_HOST`
  - IP or hostname for the endpoint.
* `EP_PORT`
  - Port for the endpoint.
  
### Namespace

When viewing the metrics within [Grafana](http://grafana.org/) for example, they will come under the following namespace:

```
local.debug.{{HOST_NAME}}.cpu-*
```
