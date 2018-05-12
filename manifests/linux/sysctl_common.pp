class rbaselines::linux::sysctl_common (
  $sysctl_options        = $::rbaselines::params::sysctl_options,
) inherits rbaselines::params {
  rbaselines::sysctl { 'common':
    sysctl_options        => $sysctl_options,
  }
}