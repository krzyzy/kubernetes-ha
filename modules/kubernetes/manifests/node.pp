# == Class: kubernetes::node
#
# Module to install an up-to-date version of kubernetes::node from package.
#
# === Parameters
#
# [*manage_repo*]
#   Setup repository for kubernetes package
#   Default to false
#
# [*kubernetes_role*]
#   Set role of kubernetes server
#   Defaults to node
#
class kubernetes::node (
  $kubernetes_role  = 'node',
) inherits kubernetes {

  class { 'kubernetes::node::install': } ->
  class { 'kubernetes::node::config': } ->
  class { 'kubernetes::node::service': }
}
