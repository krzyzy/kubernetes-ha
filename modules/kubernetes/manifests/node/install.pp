# == Class: kubernetes::node::install
#
# Module to install an up-to-date version of Docker from package.
#
# === Parameters
#
# [*node_package_ensure*]
#   Passed to the kubernetes-master package.
#   Defaults to present
#
# [*node_package_name*]
#   Setup kubernetes-master package name
#   Default to undef
#
class kubernetes::node::install (
    $node_package_ensure  = 'present',
    $node_package_name    = 'kubernetes-node',
  ) inherits kubernetes {

  package { 'kubernetes-node':
    ensure      => $node_package_ensure,
    name        => $node_package_name,
#    require     => Yumrepo['kubernetes', 'docker'],
  }
}
