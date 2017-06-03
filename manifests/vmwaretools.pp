# == Class: rbaselines::vmwaretools
#
# This class installs vmware tools package
# if the system is running on vmware.
#
# === Variables
#
# [*vmwaretools_package*]
#   Name of the package.
#
# === Examples
#
#  class { 'rbaselines::vmwaretools': }
#
# === Authors
#
# Andre Ramoni
#
class rbaselines::vmwaretools (
  $vmwaretools_package = $::rbaselines::params::vmwaretools_package,
) inherits rbaselines::params {
  if $::virtual == 'vmware' {
    package { $vmwaretools_package: ensure => 'installed' }
  }
}
