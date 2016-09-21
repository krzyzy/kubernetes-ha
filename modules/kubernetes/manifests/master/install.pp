# == Class: kubernetes::master::install
#
# Module to install an up-to-date version of Docker from package.
#
# === Parameters
#
# [*master_package_ensure*]
#   Passed to the kubernetes-master package.
#   Defaults to present
#
# [*master_package_name*]
#   Setup kubernetes-master package name
#   Default to undef
#
class kubernetes::master::install (
    $master_package_ensure  = 'present',
    $master_package_name    = 'kubernetes-master',
  ) inherits kubernetes {

  package { 'kubernetes-master':
    ensure      => $master_package_ensure,
    name        => $master_package_name,
  }
}
