# @summary Configure the connection to the RedHat Subscription Manager
#
# Set the org and activation key to establish a connection to the RHSM for the host.
#
# @param activationkey
#   activation key used to preconfigure RHSM subscription before system is registered
#
# @param enabled
#   Enable/disable rhsm registration.
#
# @param org
#   organization ID for RHSM subscription
#
# @example
#   include rhsm
class rhsm (
  String  $activationkey,
  Boolean $enabled,
  String  $org,
) {

  if ($enabled) {
    if ($org !~ String[1]) {
      notify {'Missing org value':}
    }
    elsif ($activationkey !~ String[1]) {
      notify {'Missing activationkey value':}
    }
    else {
      exec { 'RHSM-register':
        command => Sensitive("subscription-manager register --org=${org} --activationkey=${activationkey}"),
        creates => '/etc/pki/consumer/cert.pem',
        path    => [
          '/bin',
          '/usr/bin',
        ],
      }
      exec { 'RHSM-enable-repos':
        command => 'subscription-manager config --rhsm.manage_repos=1',
        onlyif  => 'grep manage_repos /etc/rhsm/rhsm.conf | egrep -i \'0|no\'',
        path    => [
          '/bin',
          '/usr/bin',
        ],
      }

    }
  }
  else {
    exec { 'RHSM-disable-repos':
      command => 'subscription-manager config --rhsm.manage_repos=0',
      onlyif  => 'grep manage_repos /etc/rhsm/rhsm.conf | egrep -i \'1|yes\'',
      path    => [
        '/bin',
        '/usr/bin',
      ],
    }
  }
}
