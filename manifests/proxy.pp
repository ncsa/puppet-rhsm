# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   rhsm::proxy { 'namevar': }
define rhsm::proxy (
  String $host_port,
) {
  $parts = $hostport.split(/:/)
  $_host = $parts[0]
  $_port = $parts[1]

  notify {"RHSM::PROXY Host: ${_host} ${_port}":}

  exec{'set rhsm proxy':
    command => "/usr/bin/subscription_manager config --server.proxy=${_host} --server.proxy_port=${_port}",
#NOTE: Want this to only run if proxy isn't already set up
#subscription_manager config list 
#if current matches parameters, do nothing
# UNLESS subscription_manager config --list | grep -q "proxy=${_host}"
#UNLESS, ONLYIF     
}
