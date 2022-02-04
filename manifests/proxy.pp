# @summary Set an optional proxy for RHSM
#
# @param hostname
#   hostname of httpproxy that RHSM should use
#
# @param port
#   port of httpproxy that RHSM should use
#
# @example
#   include rhsm::proxy
class rhsm::proxy (
  String $hostname,
  String $port,
) {

  if ($rhsm::enabled) {

    Exec{
      before  => Exec['RHSM-register'],
      path    => [
        '/bin',
        '/usr/bin',
      ],
    }

    if ( ! empty($hostname) and ! empty($port) ) {
      # IF BOTH ARE SET - SET PROXY
      exec{'set rhsm proxy_hostname':
        command => "subscription-manager config --server.proxy_hostname=${hostname}",
        # Only run if the proxy hostname isn't set or doesn't match the new value.
        unless  => "subscription-manager config --list | grep -q 'proxy_hostname = ${hostname}'",
      }
      exec{'set rhsm proxy_port':
        command => "subscription-manager config --server.proxy_port=${port}",
        # Only run if the proxy port isn't set or doesn't match the new value.
        unless  => "subscription-manager config --list | grep -q 'proxy_port = ${port}'",
      }
    }
    elsif ( empty($hostname) and empty($port) ) {
      # IF NEITHER ARE SET - UNSET PROXY
      exec{'remove rhsm proxy_hostname':
        command => 'subscription-manager config --remove=server.proxy_hostname',
        # Only run if the proxy hostname is set.
        unless  => 'subscription-manager config --list | grep proxy_hostname | egrep -q "\[\]"',
      }
      exec{'remove rhsm proxy_port':
        command => 'subscription-manager config --remove=server.proxy_port',
        # Only run if the proxy port is set.
        unless  => 'subscription-manager config --list | grep proxy_port | egrep -q "\[\]|-1"',
      }
    }
    else {
      # ERROR - ONE OF PARAMETERS IS SET WITHOUT THE OTHER ONE BEING SET
      if ( empty($hostname) ) {
        notify {'Supplied proxy_port, but missing proxy hostname value':}
      }
      elsif ( empty($port) ) {
        notify {'Supplied proxy hostname, but missing proxy port value':}
      }
    }

  }

}
