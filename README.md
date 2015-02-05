# collectd-docker

[![tag.jpg](https://img.shields.io/github/release/revett/collectd-docker.svg)](https://github.com/revett/collectd-docker/releases) [![docker.jpg](https://img.shields.io/badge/docker-hub-green.svg)](https://registry.hub.docker.com/u/revett/collectd/)

Simple [CollectD](https://github.com/collectd/collectd) instance running within a [Docker](https://github.com/docker/docker) container. It sends CPU statistics every 10 seconds to a specified endpoint, either [Graphite](https://github.com/graphite-project) or [InfluxDB](https://github.com/influxdb/influxdb).

**Note** - also accepts traffic from [StatsD](https://github.com/etsy/statsd/) clients on `localhost:8125`.

## Setup

1. [Install Docker](http://docs.docker.com/installation/mac/).
2. Pull the latest image from the Docker [registry](https://registry.hub.docker.com/u/revett/collectd/):

```
docker pull revett/collectd
```

## Usage

Start the container:

```
docker run -d -e CONFIG_TYPE=influxdb -e EP_HOST=example.com -e EP_PORT 2003 revett/collectd
```

### Environment Variables

You **must** replace the required environment variables within the `docker run` command shown above:

**Required**:

* `CONFIG_TYPE`
  - Either: `graphite` or `influxdb`
* `EP_HOST`
  - IP or hostname for the endpoint.
* `EP_PORT`
  - Default: `2003`
  - Port for the endpoint.

**Optional**:

* `HOST_NAME`
  - Default: `collectd-docker`
  - Used to create the namespace.
* `PREFIX`
  - Default: `local.debug`
  - Used to create the namespace.
  - **Graphite** only.

### Namespace

When viewing the metrics within [Grafana](http://grafana.org/) via Graphite for example, they will come under the following namespace:

```
{{PREFIX}}.{{HOST_NAME}}.cpu-*
```
