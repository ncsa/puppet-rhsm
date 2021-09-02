# @summary Configure the connection to the RedHat Subscription Manager
#
# Set the org and activation key to establish a connection to the RHSM for the host.
#
# @example
#   include rhsm
class rhsm (
  String $org,
  String $activationkey,
) {
  if ($org !~ String[1]) {
    notify {'Missing org value':}

  } elsif ($activationkey !~ String[1]) {
    notify {'Missing activationkey value':}

  } else {
    exec { 'RHSM-register':
       command => Sensitive("/usr/bin/subscription-manager register --org=${org} --activationkey=${activationkey}"),
       creates => '/etc/pki/consumer/cert.pem',
    }
  }
}
