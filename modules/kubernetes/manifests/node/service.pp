# == Class: kubernetes::master
#
# Module to install an up-to-date version of Docker from package.
#
# === Parameters
#
# [*kube_proxy_service_ensure*]
#   Whether you want to kube-proxy daemons to start up
#   Defaults to present
#
# [*kube_proxy_service_enable*]
#   Whether you want to kube-proxy daemons to start up at boot
#   Default to false
#
# [*kubelet_service_ensure*]
#   Whether you want to kubelet daemons to start up
#   Defaults to present
#
# [*kubelet_service_enable*]
#   Whether you want to kubelet daemons to start up at boot
#   Default to false
#
class kubernetes::node::service (
  $kube_proxy_service_ensure  = 'running',
  $kubelet_service_ensure     = 'running',
  $kube_proxy_service_enable  = 'true',
  $kubelet_service_enable     = 'true',
  ) inherits kubernetes {

  service { 'kube-proxy':
    ensure => $kube_proxy_service_ensure,
    enable => $kube_proxy_service_enable,
  }
  service { 'kubelet':
    ensure => $kubelet_service_ensure,
    enable => $kubelet_service_enable,
  }
}
