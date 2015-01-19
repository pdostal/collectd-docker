Hostname "{{ HOST_NAME }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5

LoadPlugin cpu
LoadPlugin write_graphite

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
