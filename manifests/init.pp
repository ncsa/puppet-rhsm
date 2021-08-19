# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include rhsm
class rhsm (
  String $org,
  String $activationkey,
{
 exec { 'RHSM-register':
    command => Sensitive("/usr/bin/subscription-manager register --org=${org} --activationkey=${activationkey}"),
    creates => '/etc/pki/consumer/cert.pem',
  }
}
