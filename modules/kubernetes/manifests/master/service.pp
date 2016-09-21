# == Class: kubernetes::master
#
# Module to install an up-to-date version of Docker from package.
#
# === Parameters
#
# [*apiserver_service_ensure*]
#   Whether you want to kube-apiserver daemons to start up
#   Defaults to present
#
# [*apiserver_service_enable*]
#   Whether you want to kube-apiserver daemons to start up at boot
#   Default to false
#
# [*controller_manager_service_ensure*]
#   Whether you want to kube-controller-manager daemons to start up
#   Defaults to present
#
# [*controller_manager_service_enable*]
#   Whether you want to kube-controller-manager daemons to start up at boot
#   Default to false
#
# [*scheduler_service_ensure*]
#   Whether you want to kube-scheduler daemons to start up
#   Defaults to present
#
# [*scheduler_service_enable*]
#   Whether you want to kube-scheduler daemons to start up at boot
#   Default to false
#
class kubernetes::master::service (
    $apisrv_service_ensure    = 'running',
    $conman_service_ensure    = 'running',
    $scheduler_service_ensure = 'running',
    $apisrv_service_enable    = 'true',
    $conman_service_enable    = 'true',
    $scheduler_service_enable = 'true',
  ) inherits kubernetes {

    service { 'kube-apiserver':
      ensure => $apisrv_service_ensure,
      enable => $apisrv_service_enable,
    }
    service { 'kube-controller-manager':
      ensure => $conman_service_ensure,
      enable => $conman_service_enable,
    }
    service { 'kube-scheduler':
      ensure => $scheduler_service_ensure,
      enable => $scheduler_service_enable,
    }
}
