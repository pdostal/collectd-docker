<h1 align="center">collectd-docker</h1>

<p align="center">
  <a href="https://github.com/revett/collectd-docker/releases" target="_blank"><img src="https://img.shields.io/github/release/revett/collectd-docker.svg?style=flat-square&label=Release"></a>
  <a href="http://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/License-MIT-95a5a6.svg?style=flat-square"></a>
  <a href="https://registry.hub.docker.com/u/revett/collectd/" target="_blank"><img src="https://img.shields.io/badge/Docker-Hub-70D4FF.svg?style=flat-square"></a>
</p>

Simple [CollectD](https://github.com/collectd/collectd) instance running within a [Docker](https://github.com/docker/docker) container, with support to send statistics to either [Graphite](https://github.com/graphite-project), [Riemann](http://riemann.io/) or [InfluxDB](https://github.com/influxdb/influxdb).

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
docker run -d -e CONFIG_TYPE=influxdb -e EP_HOST=example.com -e EP_PORT=2003 revett/collectd
```

### Environment Variables

You **must** replace the required environment variables within the `docker run` command shown above:

**Required**:

* `CONFIG_TYPE`
  - Either: `graphite`, `riemann` or `influxdb`
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

## Licence

[The MIT License (MIT)](http://opensource.org/licenses/MIT)

Copyright (c) 2015 [Charlie Revett](http://twitter.com/charlierevett)
