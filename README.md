# collectd-docker

Simple [CollectD](https://github.com/collectd/collectd) instance running within a [Docker](https://github.com/docker/docker) container. It sends CPU statistics every 10 seconds to a specified [Carbon](https://github.com/graphite-project/carbon) endpoint (see below), which will then be consumed by [Graphite](https://github.com/graphite-project/graphite-web). 

**Note** - the primary purpose for this container is to test the [Ruby CollectD Client](https://github.com/revett/collectd) locally.

## Setup 

1. [Install Docker](http://docs.docker.com/installation/mac/).
2. Pull the latest image from the Docker [registry](https://registry.hub.docker.com/u/revett/collectd-carbon/):

```
docker pull revett/collectd-docker
```

## Usage

Start the container:

```
docker run -d -e HOST_NAME=example -e CARBON_HOST=carbon.example.com -e CARBON_PORT=2003 revett/collectd-docker
```

### Environment Variables

You **must** replace each of the following environment variables within the `docker run` command shown above:

* `HOST_NAME`
  - Used to create the namespace in Carbon/Graphite.
* `CARBON_HOST`
  - Carbon IP or hostname
* `CARBON_PORT`
  - Carbon port.
  
### Carbon/Graphite Namespace

When viewing metrics within Graphite, they will come under the following namespace:

```
local.debug.{{HOST_NAME}}.cpu-*
```
