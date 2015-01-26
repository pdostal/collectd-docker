Hostname "{{ HOST_NAME }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5

LoadPlugin statsd
LoadPlugin cpu
LoadPlugin write_graphite

<Plugin statsd>
  Host "::"
  Port "8125"
  DeleteSets      true
  TimerPercentile 90.0
</Plugin>

<Plugin "write_graphite">
 <Node "bbc">
   Host "{{ CARBON_HOST }}"
   Port "{{ CARBON_PORT }}"
   Protocol "tcp"
   LogSendErrors true
   EscapeCharacter "_"
   Prefix "local.debug."
 </Node>
</Plugin>
