# == Class: kubernetes::master::scheduler
#
# Module to setup kubernetes scheduler service
#
# === Parameters
#
# [*scheduler_service_ensure*]
#   Whether you want the scheduler daemon to start up
#   Defaults to running
#
# [*scheduler_service_enable*]
#   Whether you want the scheduler daemon to start up at boot
#   Defaults to true
#
# [*scheduler_address*]
#   The IP address to serve on (set to 0.0.0.0 for all interfaces)
#   Defaults to "0.0.0.0"
#
# [*scheduler_algorithm_provider*]
#   The scheduling algorithm provider to use, one of: DefaultProvider
#   Defaults to "DefaultProvider"
#
# [*scheduler_alsologtostderr*]
#   log to standard error as well as files
#   Defaults to false
#
# [*scheduler_kube_api_burst*]
#   Burst to use while talking with kubernetes apiserver
#   Defaults to 100
#
# [*scheduler_kube_api_qps*]
#   QPS to use while talking with kubernetes apiserver
#   Defaults to 50
#
# [*scheduler_kubeconfig*]
#   Path to kubeconfig file with authorization and
#   master location information.
#   Defaults to none
#
# [*scheduler_leader_elect*]
#   Start a leader election client and gain leadership
#   before executing the main loop. Enable this when running
#   replicated components for high availability.
#   Defaults to false
#
# [*scheduler_leader_elect_lease_duration*]
#   The duration that non-leader candidates will wait after
#   observing a leadership renewal until attempting to acquire
#   leadership of a led but unrenewed leader slot. This is
#   effectively the maximum duration that a leader can be
#   stopped before it is replaced by another candidate.
#   This is only applicable if leader election
#   is enabled.
#   Defaults to 15s
#
# [*scheduler_leader_elect_renew_deadline*]
#   The interval between attempts by the acting master to
#   renew a leadership slot before it stops leading. This
#   must be less than or equal to the lease duration.
#   This is only applicable if leader election is enabled.
#   Defaults to 10s
#
# [*scheduler_leader_elect_retry_period*]
#   The duration the clients should wait between attempting
#   acquisition and renewal of a leadership. This is
#   only applicable if leader election is enabled.
#   Defaults to 2s
#
# [*scheduler_log_backtrace_at*]
#   when logging hits line file:N, emit a stack trace
#   Defaults to 0
#
# [*scheduler_log_dir*]
#   If non-empty, write log files in this directory
#   Defaults to none
#
# [*scheduler_log_flush_frequency*]
#   Maximum number of seconds between log flushes
#   Defaults to 5s
#
# [*scheduler_logtostderr*]
#   log to standard error instead of files
#   Defaults to true
#
# [*scheduler_master*]
#   The address of the Kubernetes API server
#   (overrides any value in kubeconfig)
#   Defaults to none
#
# [*scheduler_policy_config_file*]
#   File with scheduler policy configuration
#   Defaults to none
#
# [*scheduler_port*]
#   The port that the scheduler's http service runs on
#   Defaults to 10251
#
# [*scheduler_profiling*]
#   Enable profiling via web interface host:port/debug/pprof/
#   Defaults to true
#
# [*scheduler_scheduler_name*]
#   Name of the scheduler, used to select which pods will be
#   processed by this scheduler, based on pod's annotation
#   with key 'scheduler.alpha.kubernetes.io/name'
#   Defaults to "default-scheduler"
#
# [*scheduler_stderrthreshold*]
#   logs at or above this threshold go to stderr
#   Defaults to 2
#
# [*scheduler_v*]
#   log level for V logs
#   Defaults to 0
#
# [*scheduler_vmodule*]
#   comma-separated list of pattern=N settings
#   for file-filtered logging
#   Defaults to none
#
# [*scheduler_extra_args*]
#   Extra arguments for scheduler daemon.
#   ** Defaults to non
#
class kubernetes::master::scheduler (
  $scheduler_service_ensure               = $kubernetes::master::params::scheduler_service_ensure,
  $scheduler_service_enable               = $kubernetes::master::params::scheduler_service_enable,
  $scheduler_address                      = $kubernetes::master::params::scheduler_address,
  $scheduler_algorithm_provider           = $kubernetes::master::params::scheduler_algorithm_provider,
  $scheduler_alsologtostderr              = $kubernetes::master::params::scheduler_alsologtostderr,
  $scheduler_kube_api_burst               = $kubernetes::master::params::scheduler_kube_api_burst,
  $scheduler_kube_api_qps                 = $kubernetes::master::params::scheduler_kube_api_qps,
  $scheduler_kubeconfig                   = $kubernetes::master::params::scheduler_kubeconfig,
  $scheduler_leader_elect                 = $kubernetes::master::params::scheduler_leader_elect,
  $scheduler_leader_elect_lease_duration  = $kubernetes::master::params::scheduler_leader_elect_lease_duration,
  $scheduler_leader_elect_renew_deadline  = $kubernetes::master::params::scheduler_leader_elect_renew_deadline,
  $scheduler_leader_elect_retry_period    = $kubernetes::master::params::scheduler_leader_elect_retry_period,
  $scheduler_log_backtrace_at             = $kubernetes::master::params::scheduler_log_backtrace_at,
  $scheduler_log_dir                      = $kubernetes::master::params::scheduler_log_dir,
  $scheduler_log_flush_frequency          = $kubernetes::master::params::scheduler_log_flush_frequency,
  $scheduler_logtostderr                  = $kubernetes::master::params::scheduler_logtostderr,
  $scheduler_master                       = $kubernetes::master::params::scheduler_master,
  $scheduler_policy_config_file           = $kubernetes::master::params::scheduler_policy_config_file,
  $scheduler_port                         = $kubernetes::master::params::scheduler_port,
  $scheduler_profiling                    = $kubernetes::master::params::scheduler_profiling,
  $scheduler_scheduler_name               = $kubernetes::master::params::scheduler_name,
  $scheduler_stderrthreshold              = $kubernetes::master::params::scheduler_stderrthreshold,
  $scheduler_v                            = $kubernetes::master::params::scheduler_v,
  $scheduler_vmodule                      = $kubernetes::master::params::scheduler_vmodule,
  $scheduler_extra_args                   = $kubernetes::master::params::scheduler_extra_args,
) inherits kubernetes::master::params {
  include ::kubernetes::master
  file { '/etc/kubernetes/scheduler':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/kubernetes/master/scheduler.erb"),
  } ~> Service['kube-scheduler']
}
