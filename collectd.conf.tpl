Hostname "{{ HOST_NAME | default("collectd-docker") }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5

LoadPlugin cpu
LoadPlugin nginx
LoadPlugin statsd
LoadPlugin network

<Plugin statsd>
  Host "::"
  Port "8125"
  DeleteSets      true
  TimerPercentile 90.0
</Plugin>

<Plugin "nginx">
    URL "{{ NGINX_URL }}"
</Plugin>

<Plugin network>
  Server "{{ EP_HOST }}" "{{ EP_PORT }}"
  ReportStats true
</Plugin>
