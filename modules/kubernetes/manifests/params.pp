# Class: kubernetes::params
#
# This module manages kubernetes
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
class kubernetes::params {
  $manage_repo      = 'false'
  $kubernetes_role  = 'node'
}
