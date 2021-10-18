# @summary This define allows a proxy to be set for RHSM.
#
# @example
#   rhsm::proxy { 'namevar': $host_port => 'hostname:port' }
define rhsm::proxy (
  String $host_port,
) {
  $parts = $host_port.split(/:/)
  $_host = $parts[0]
  $_port = $parts[1]

  exec{'set rhsm proxy_hostname':
    command => "/usr/bin/subscription-manager config --server.proxy_hostname=${_host}",
    # Only run if the proxy hostname isn't set or doesn't match the new value.
    unless  => "/usr/bin/subscription-manager config --list | grep -q 'proxy_hostname = ${_host}'",
    before  => Exec['RHSM-register'],
  }

  exec{'set rhsm proxy_port':
    command => "/usr/bin/subscription-manager config --server.proxy_port=${_port}",
    # Only run if the proxy port isn't set or doesn't match the new value.
    unless  => "/usr/bin/subscription-manager config --list | grep -q 'proxy_port = ${_port}'",
    before  => Exec['RHSM-register'],
  }
}
