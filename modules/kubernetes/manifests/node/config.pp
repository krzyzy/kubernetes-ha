# == Class: kubernetes::node::config
#
# Module to install an up-to-date version of kubernetes-node from package.
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
class kubernetes::node::config (
    $node_package_ensure   = 'present',
    $node_package_version  = 'latest',
  ) inherits kubernetes {

  file { '/etc/kubernetes/config':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/kubernetes/node/config.conf.erb"),
  } ->
  file { '/etc/kubernetes/manifests':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  } ->
  class { 'kubernetes::node::kube_proxy': } ->
  class { 'kubernetes::node::kubelet': }
}
