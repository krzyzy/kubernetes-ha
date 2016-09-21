# Class: kubernetes
#
# This module manages kubernetes.
# There is not too much to do, just lets check if
# we want to set up master or node and include proper class.
#
# Parameters:
#
# [*manage_repo*]
#   Setup repository for kubernetes package
#   Default to false
#
# [*kubernetes_role*]
#   Set role of kubernetes server
#   Defaults to node
#
class kubernetes (
  $manage_repo      = 'false',
  $kubernetes_role  = 'node',
) inherits kubernetes::params {

  if $manage_repo == 'true' {
    include ::kubernetes::repo
  }

  if $kubernetes_role == 'master' {
    include kubernetes::master
  } else {
    include kubernetes::node
  }
}
