# == Class: kubernetes::master
#
# Module to install an up-to-date version of Docker from package.
#
# === Parameters
#
# [*manage_repo*]
#   Setup repository for kubernetes package
#   Default to false
#
# [*kubernetes_role*]
#   Set role of kubernetes server
#   Defaults to master
#
class kubernetes::master (
  $kubernetes_role  = 'master',
) inherits kubernetes {

  class { 'kubernetes::master::install': } ->
  class { 'kubernetes::master::config': } ->
  class { 'kubernetes::master::service': }
}
