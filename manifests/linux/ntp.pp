# == Class: rbaselines::ntp
#
# A class to configure ntp as client or server
#
# === Parameters
#
# [*ntp_role*]
#   If it should be a NTP client or server.
#
# [*ntp_servers*]
#   NTP servers to use.
#
# === Examples
#
#  class { 'rbaselines::ntp':
#           ntp_role => 'server',
#        }
#
# === Authors
#
# Andre Ramoni
#

class rbaselines::ntp (
  $ntp_servers = $::rbaselines::params::ntp_servers,
  $ntp_role    = 'client',
) inherits rbaselines::params {
  case $ntp_role {
    'client': { $restrict_options = 'kod notrap nomodify nopeer noserve' }
    'server': { $restrict_options = 'kod notrap nomodify nopeer noquery' }
    default: { fail("NTP role ${ntp_role} not supported.") }
  }
  $ntp_restrict = [
    "-4 default ${restrict_options}",
    "-6 default ${restrict_options}",
    '127.0.0.1',
    '::1',
    $::ipaddress,
  ]

  class { '::ntp':
    servers  => $ntp_servers,
    restrict => $ntp_restrict + $ntp_servers,
  }

}