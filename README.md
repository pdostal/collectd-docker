# collectd-docker

Simple [CollectD](https://github.com/collectd/collectd) instance running within a [Docker](https://github.com/docker/docker) container. It sends CPU statistics every 10 seconds to a specified endpoint (see below), which can accept traffic from the [write_graphite](https://collectd.org/wiki/index.php/Plugin:Write_Graphite) plugin.

**Note**

* The primary purpose of this container is to test the [Ruby CollectD](https://github.com/revett/collectd) gem locally.
* The CollectD instance also accepts traffic from [StatsD](https://github.com/etsy/statsd/) clients on `localhost:8125`.

## Setup

1. [Install Docker](http://docs.docker.com/installation/mac/).
2. Pull the latest image from the Docker [registry](https://registry.hub.docker.com/u/revett/collectd-carbon/):

```
docker pull revett/collectd
```

## Usage

Start the container:

```
docker run -d -e EP_HOST=example.com revett/collectd
```

### Environment Variables

You **must** replace the required environment variables within the `docker run` command shown above:

**Required**:

* `EP_HOST`
  - IP or hostname for the endpoint.

**Optional**:

* `HOST_NAME`, default: `collectd-docker`
  - Used to create the namespace in Graphite (endpoint).
* `EP_PORT`, default: `2003`
  - Port for the endpoint.
* `PREFIX`, default: `local.debug`
  - Used to create the namespace in Graphite (endpoint)

### Namespace

When viewing the metrics within [Grafana](http://grafana.org/) for example, they will come under the following namespace:

```
{{PREFIX}}.{{HOST_NAME}}.cpu-*
```
