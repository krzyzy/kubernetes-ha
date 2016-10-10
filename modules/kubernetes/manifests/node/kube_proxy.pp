# == Class: kubernetes::node::kube_proxy
#
# Module to install an up-to-date version of kubernetes::node::kube_proxy from package.
#
# === Parameters
#
# [*kubeproxy_service_ensure*]
#   Whether you want to kube_proxy daemon to start up
#   Defaults to running
#
# [*kubeproxy_service_enable*]
#   Whether you want to kube_proxy daemon to start up at boot
#   Defaults to true
#
# [*kubeproxy_alsologtostderr*]
#   Log to standard error as well as files
#   ** Defaults to false
#
# [*kubeproxy_bind_address*]
#   The IP address for the proxy server to serve on
#   (set to 0.0.0.0 for all interfaces)
#   ** Defaults to "0.0.0.0"
#
# [*kubeproxy_cleanup_iptables*]
#   If true cleanup iptables rules and exit.
#   ** Defaults to false
#
# [*kubeproxy_config_sync_period*]
#   How often configuration from the apiserver
#   is refreshed.  Must be greater than 0.
#   ** Defaults to "15m0s"
#
# [*kubeproxy_conntrack_max*]
#   Maximum number of NAT connections to
#   track (0 to leave as-is)
#   ** Defaults to 262144
#
# [*kubeproxy_conntrack_tcp_timeout_established*]
#   Idle timeout for established TCP connections
#   (0 to leave as-is)
#   ** Defaults to "24h0m0s"
#
# [*kubeproxy_healthz_bind_address*]
#   The IP address for the health check server to serve on,
#   defaulting to 127.0.0.1 (set to 0.0.0.0 for all interfaces)
#   ** Defaults to "127.0.0.1"
#
# [*kubeproxy_healthz_port*]
#   The port to bind the health check server. Use 0 to disable.
#   ** Defaults to 10249
#
# [*kubeproxy_hostname_override*]
#   If non-empty, will use this string as identification
#   instead of the actual hostname.
#   ** Defaults to undef
#
# [*kubeproxy_iptables_masquerade_bit*]
#   If using the pure iptables proxy, the bit of the
#   fwmark space to mark packets requiring SNAT with.
#   Must be within the range [0, 31].
#   ** Defaults to 14
#
# [*kubeproxy_iptables_sync_period*]
#   How often iptables rules are refreshed
#   (e.g. '5s', '1m', '2h22m').  Must be greater than 0.
#   ** Defaults to "30s"
#
# [*kubeproxy_kube_api_burst*]
#   Burst to use while talking with kubernetes apiserver
#   ** Defaults to 10
#
# [*kubeproxy_kube_api_qps*]
#   QPS to use while talking with kubernetes apiserver
#   ** Defaults to 5
#
# [*kubeproxy_kubeconfig*]
#   Path to kubeconfig file with authorization information
#   (the master location is set by the master flag).
#   ** Defaults to undef
#
# [*kubeproxy_log_backtrace_at*]
#   When logging hits line file:N, emit a stack trace
#   ** Defaults to undef
#
# [*kubeproxy_log_dir*]
#   If non-empty, write log files in this directory
#   ** Defaults to undef
#
# [*kubeproxy_log_flush_frequency*]
#   Maximum number of seconds between log flushes
#   ** Defaults to "5s"
#
# [*kubeproxy_logtostderr*]
#   Log to standard error instead of files
#   ** Defaults to true
#
# [*kubeproxy_masquerade_all*]
#   If using the pure iptables proxy, SNAT everything
#   ** Defaults to false
#
# [*kubeproxy_master*]
#   The address of the Kubernetes API server
#   (overrides any value in kubeconfig)
#   ** Defaults to undef
#
# [*kubeproxy_oom_score_adj*]
#   The oom-score-adj value for kube-proxy process.
#   Values must be within the range [-1000, 1000]
#   ** Defaults to "-999"
#
# [*kubeproxy_proxy_mode*]
#   Which proxy mode to use: 'userspace' (older) or
#   'iptables' (faster). If blank, look at the Node
#   object on the Kubernetes API and respect the
#   'net.experimental.kubernetes.io/proxy-mode' annotation
#   if provided. Otherwise use the best-available proxy
#   (currently iptables). If the iptables proxy is selected,
#   regardless of how, but the system's kernel or iptables versions
#   are insufficient, this always falls back to the userspace proxy.
#   ** Defaults to undef
#
# [*kubeproxy_proxy_port_range*]
#   Range of host ports (beginPort-endPort, inclusive) that may be
#   consumed in order to proxy service traffic. If unspecified (0-0)
#   then ports will be randomly chosen.
#   ** Defaults to undef
#
# [*kubeproxy_stderrthreshold*]
#   Logs at or above this threshold go to stderr
#   ** Defaults to 2
#
# [*kubeproxy_udp_timeout*]
#   How long an idle UDP connection will be kept open (e.g. '250ms', '2s').
#   Must be greater than 0. Only applicable for proxy-mode=userspace
#   ** Defaults to "250ms"
#
# [*kubeproxy_v*]
#   Log level for V logs
#   ** Defaults to 0
#
# [*kubeproxy_vmodule*]
#   Comma-separated list of pattern=N settings for file-filtered logging.
#   ** Defaults to undef
#
# [*kubeproxy_extra_args*]
#   Extra arguments for kubeproxy daemon.
#   ** Defaults to non
#
class kubernetes::node::kube_proxy (
  $kubeproxy_service_ensure                     = $kubernetes::node::params::kubeproxy_service_ensure,
  $kubeproxy_service_enable                     = $kubernetes::node::params::kubeproxy_service_enable,
  $kubeproxy_alsologtostderr                    = $kubernetes::node::params::kubeproxy_alsologtostderr,
  $kubeproxy_bind_address                       = $kubernetes::node::params::kubeproxy_bind_address,
  $kubeproxy_cleanup_iptables                   = $kubernetes::node::params::kubeproxy_cleanup_iptables,
  $kubeproxy_config_sync_period                 = $kubernetes::node::params::kubeproxy_config_sync_period,
  $kubeproxy_conntrack_max                      = $kubernetes::node::params::kubeproxy_conntrack_max,
  $kubeproxy_conntrack_tcp_timeout_established  = $kubernetes::node::params::kubeproxy_conntrack_tcp_timeout_established,
  $kubeproxy_healthz_bind_address               = $kubernetes::node::params::kubeproxy_healthz_bind_address,
  $kubeproxy_healthz_port                       = $kubernetes::node::params::kubeproxy_healthz_port,
  $kubeproxy_hostname_override                  = $kubernetes::node::params::kubeproxy_hostname_override,
  $kubeproxy_iptables_masquerade_bit            = $kubernetes::node::params::kubeproxy_iptables_masquerade_bit,
  $kubeproxy_iptables_sync_period               = $kubernetes::node::params::kubeproxy_iptables_sync_period,
  $kubeproxy_kube_api_burst                     = $kubernetes::node::params::kubeproxy_kube_api_burst,
  $kubeproxy_kube_api_qps                       = $kubernetes::node::params::kubeproxy_kube_api_qps,
  $kubeproxy_kubeconfig                         = $kubernetes::node::params::kubeproxy_kubeconfig,
  $kubeproxy_log_backtrace_at                   = $kubernetes::node::params::kubeproxy_log_backtrace_at,
  $kubeproxy_log_dir                            = $kubernetes::node::params::kubeproxy_log_dir,
  $kubeproxy_log_flush_frequency                = $kubernetes::node::params::kubeproxy_log_flush_frequency,
  $kubeproxy_logtostderr                        = $kubernetes::node::params::kubeproxy_logtostderr,
  $kubeproxy_masquerade_all                     = $kubernetes::node::params::kubeproxy_masquerade_all,
  $kubeproxy_master                             = $kubernetes::node::params::kubeproxy_master,
  $kubeproxy_oom_score_adj                      = $kubernetes::node::params::kubeproxy_oom_score_adj,
  $kubeproxy_proxy_mode                         = $kubernetes::node::params::kubeproxy_proxy_mode,
  $kubeproxy_proxy_port_range                   = $kubernetes::node::params::kubeproxy_proxy_port_range,
  $kubeproxy_stderrthreshold                    = $kubernetes::node::params::kubeproxy_stderrthreshold,
  $kubeproxy_udp_timeout                        = $kubernetes::node::params::kubeproxy_udp_timeout,
  $kubeproxy_v                                  = $kubernetes::node::params::kubeproxy_v,
  $kubeproxy_vmodule                            = $kubernetes::node::params::kubeproxy_vmodule,
  $kubeproxy_extra_args                         = $kubernetes::node::params::kubeproxy_extra_args,
) inherits kubernetes::node::params {
  include ::kubernetes::node

#  validate_bool($cleanup_iptables, $masquerade_all)
#  validate_integer([$healthz_port, $oom_score_adj,])

  file { '/etc/kubernetes/proxy':
    ensure  => 'file',
    content => template("${module_name}/etc/kubernetes/node/kube-proxy.conf.erb"),
  } ~>
  Service['kube-proxy']
}
