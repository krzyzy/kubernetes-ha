# == Class: kubernetes::master::controller_manager
#
# Module to setup kubernetes controller manager service
#
# === Parameters
#
# [*conman_service_ensure*]
#   Whether you want the controller-manager daemon to start up
#   Defaults to running
#
# [*conman_service_enable*]
#   Whether you want the controller-manager daemon to start up at boot
#   Defaults to true
#
# [*conman_address*]
#   The IP address to serve on (set to 0.0.0.0
#   for all interfaces)
#   Defaults to 0.0.0.0
#
# [*conman_allocate_node_cidrs*]
#   Should CIDRs for Pods be allocated and set on
#   the cloud provider.
#   Defaults to false
#
# [*conman_alsologtostderr*]
#   log to standard error as well as files
#   Defaults to false
#
# [*conman_cloud_config*]
#   The path to the cloud provider configuration file.
#   Empty string for no configuration file.
#   Defaults to none
#
# [*conman_cloud_provider*]
#   The provider for cloud services. Empty string for no provider.
#   Defaults to none
#
# [*conman_cluster_cidr*]
#   CIDR Range for Pods in cluster.
#   Defaults to none
#
# [*conman_cluster_name*]
#   The instance prefix for the cluster
#   Defaults to "kubernetes"
#
# [*conman_concurrent_deployment_syncs*]
#   The number of deployment objects that are allowed to
#   sync concurrently. Larger number = more responsive
#   deployments, but more CPU (and network) load
#   Defaults to 5
#
# [*conman_concurrent_endpoint_syncs*]
#   The number of endpoint syncing operations that
#   will be done concurrently. Larger number = faster
#   endpoint updating, but more CPU (and network) load
#   Defaults to 5
#
# [*conman_concurrent_namespace_syncs*]
#   The number of namespace objects that are allowed to
#   sync concurrently. Larger number = more responsive
#   namespace termination, but more CPU (and network) load
#   Defaults to 2
#
# [*conman_concurrent_rc_syncs*]
#   The number of replication controllers that are allowed
#   to sync concurrently. Larger number = more responsive
#   replica management, but more CPU (and network) load
#   Defaults to 5
#
# [*conman_concurrent_replicaset_syncs*]
#   The number of replica sets that are allowed to sync
#   concurrently. Larger number = more responsive replica
#   management, but more CPU (and network) load
#   Defaults to 5
#
# [*conman_concurrent_resource_quota_syncs*]
#   The number of resource quotas that are allowed to sync
#   concurrently. Larger number = more responsive quota
#   management, but more CPU (and network) load
#   Defaults to 5
#
# [*conman_daemonset_lookup_cache_size*]
#   The the size of lookup cache for daemonsets.
#   Larger number = more responsive daemonsets, but more MEM load.
#   Defaults to 1024
#
# [*conman_deleting_pods_burst*]
#   Number of nodes on which pods are bursty deleted
#   in case of node failure. For more details look into RateLimiter.
#   Defaults to 10
#
# [*conman_deleting_pods_qps*]
#   Number of nodes per second on which pods are
#   deleted in case of node failure.
#   Defaults to 0.1
#
# [*conman_deployment_controller_sync_period*]
#   Period for syncing the deployments.
#   Defaults to 30s
#
# [*conman_enable_hostpath_provisioner*]
#   Enable HostPath PV provisioning when running
#   without a cloud provider. This allows testing
#   and development of provisioning features. HostPath
#   provisioning is not supported in any way, won't
#   work in a multi-node cluster, and should not be used
#   for anything other than testing or development.
#   Defaults to false
#
# [*conman_horizontal_pod_autoscaler_sync_period*]
#   The period for syncing the number of pods
#   in horizontal pod autoscaler.
#   Defaults to 30s
#
# [*conman_kube_api_burst*]
#   Burst to use while talking with kubernetes apiserver
#   Defaults to 30
#
# [*conman_kube_api_qps*]
#   QPS to use while talking with kubernetes apiserver
#   Defaults to 20
#
# [*conman_kubeconfig*]
#   Path to kubeconfig file with authorization
#   and master location information.
#   Defaults to none
#
# [*conman_leader_elect*]
#   Start a leader election client and gain leadership
#   before executing the main loop. Enable this when
#   running replicated components for high availability.
#   Defaults to false
#
# [*conman_leader_elect_lease_duration*]
#   The duration that non-leader candidates will wait
#   after observing a leadership renewal until attempting
#   to acquire leadership of a led but unrenewed leader slot.
#   This is effectively the maximum duration that a leader
#   can be stopped before it is replaced by another candidate.
#   This is only applicable if leader election is enabled.
#   Defaults to 15s
#
# [*conman_leader_elect_renew_deadline*]
#   The interval between attempts by the acting master to
#   renew a leadership slot before it stops leading. This must
#   be less than or equal to the lease duration. This is only
#   applicable if leader election is enabled.
#   Defaults to 10s
#
# [*conman_leader_elect_retry_period*]
#   The duration the clients should wait between attempting
#   acquisition and renewal of a leadership. This is only
#   applicable if leader election is enabled.
#   Defaults to 2s
#
# [*conman_log_backtrace_at*]
#   when logging hits line file:N, emit a stack trace
#   Defaults to 0
#
# [*conman_log_dir*]
#   If non-empty, write log files in this directory
#   Defaults to none
#
# [*conman_log_flush_frequency*]
#   Maximum number of seconds between log flushes
#   Defaults to 5s
#
# [*conman_logtostderr*]
#   Log to standard error instead of files
#   Defaults to true
#
# [*conman_master*]
#   The address of the Kubernetes API server
#   (overrides any value in kubeconfig)
#   Defaults to none
#
# [*conman_min_resync_period*]
#   The resync period in reflectors will be random
#   between MinResyncPeriod and 2*MinResyncPeriod
#   Defaults to 12h0m0s
#
# [*conman_namespace_sync_period*]
#   The period for syncing namespace life-cycle updates
#   Defaults to 5m0s
#
# [*conman_node_monitor_grace_period*]
#   Amount of time which we allow running Node to be
#   unresponsive before marking it unhealty. Must be N
#   times more than kubelet's nodeStatusUpdateFrequency,
#   where N means number of retries allowed for kubelet
#   to post node status.
#   Defaults to 40s
#
# [*conman_node_monitor_period*]
#   The period for syncing NodeStatus in NodeController.
#   Defaults to 5s
#
# [*conman_node_startup_grace_period*]
#   Amount of time which we allow starting Node to be
#   unresponsive before marking it unhealty.
#   Defaults to 1m0s
#
# [*conman_node_sync_period*]
#   The period for syncing nodes from cloudprovider.
#   Longer periods will result in fewer calls to cloud
#   provider, but may delay addition of new nodes to cluster.
#   Defaults to 10s
#
# [*conman_pod_eviction_timeout*]
#   The grace period for deleting pods on failed nodes.
#   Defaults to 5m0s
#
# [*conman_port*]
#   The port that the controller-manager's http
#   service runs on
#   Defaults to 10252
#
# [*conman_profiling*]
#   Enable profiling via web interface host:port/debug/pprof/\
#   Defaults to true
#
# [*conman_pv_recycler_increment_timeout_nfs*]
#   The increment of time added per Gi to ActiveDeadlineSeconds
#   for an NFS scrubber pod
#   Defaults to 30
#
# [*conman_pv_recycler_minimum_timeout_hostpath*]
#   The minimum ActiveDeadlineSeconds to use for a HostPath
#   Recycler pod. This is for development and testing
#   only and will not work in a multi-node cluster.
#   Defaults to 60
#
# [*conman_pv_recycler_minimum_timeout_nfs*]
#   The minimum ActiveDeadlineSeconds to use for an NFS Recycler pod
#   Defaults to 300
#
# [*conman_pv_recycler_pod_template_filepath_hostpath*]
#   The file path to a pod definition used as a template for
#   HostPath persistent volume recycling. This is for development
#   and testing only and will not work in a multi-node cluster.
#   Defaults to none
#
# [*conman_pv_recycler_pod_template_filepath_nfs*]
#   The file path to a pod definition used as a template
#   for NFS persistent volume recycling
#   Defaults to none
#
# [*conman_pv_recycler_timeout_increment_hostpath*]
#   The increment of time added per Gi to ActiveDeadlineSeconds
#   for a HostPath scrubber pod. This is for development and
#   testing only and will not work in a multi-node cluster.
#   Defaults to 30
#
# [*conman_pvclaimbinder_sync_period*]
#   The period for syncing persistent volumes and persistent volume claims
#   Defaults to 10m0s
#
# [*conman_replicaset_lookup_cache_size*]
#   The the size of lookup cache for replicatsets. Larger number = more
#   responsive replica management, but more MEM load.
#   Defaults to 4096
#
# [*conman_replication_controller_lookup_cache_size*]
#   The the size of lookup cache for replication controllers.
#   Larger number = more responsive replica management, but more MEM load.
#   Defaults to 4096
#
# [*conman_resource_quota_sync_period*]
#   The period for syncing quota usage status in the system
#   Defaults to 5m0s
#
# [*conman_root_ca_file*]
#   If set, this root certificate authority will be included
#   in service account's token secret. This must be a 3
#   valid PEM-encoded CA bundle.
#   Defaults to none
#
# [*conman_service_account_private_key_file*]
#   Filename containing a PEM-encoded private RSA key used
#   to sign service account tokens.
#   Defaults to none
#
# [*conman_service_sync_period*]
#   The period for syncing services with their
#   external load balancers
#   Defaults to 5m0s
#
# [*conman_stderrthreshold*]
#   Logs at or above this threshold go to stderr
#   Defaults to 2
#
# [*conman_terminated_pod_gc_threshold*]
#   Number of terminated pods that can exist before the terminated
#   pod garbage collector starts deleting terminated pods. If <= 0,
#   the terminated pod garbage collector is disabled.
#   Defaults to 12500
#
# [*conman_v*]
#   Log level for V logs
#   Defaults to 0
#
# [*conman_vmodule*]
#   Ccomma-separated list of pattern=N settings
#   for file-filtered logging
#   Defaults to none
#
class kubernetes::master::controller_manager (
  $conman_conman_service_ensure                       = $kubernetes::master::params::conman_service_ensure,
  $conman_conman_service_enable                       = $kubernetes::master::params::conman_service_enable,
  $conman_conman_address                              = $kubernetes::master::params::conman_address,
  $conman_allocate_node_cidrs                         = $kubernetes::master::params::conman_allocate_node_cidrs,
  $conman_alsologtostderr                             = $kubernetes::master::params::conman_alsologtostderr,
  $conman_cloud_config                                = $kubernetes::master::params::conman_cloud_config,
  $conman_cloud_provider                              = $kubernetes::master::params::conman_cloud_provider,
  $conman_cluster_cidr                                = $kubernetes::master::params::conman_cluster_cidr,
  $conman_cluster_name                                = $kubernetes::master::params::conman_cluster_name,
  $conman_concurrent_deployment_syncs                 = $kubernetes::master::params::conman_concurrent_deployment_syncs,
  $conman_concurrent_endpoint_syncs                   = $kubernetes::master::params::conman_concurrent_endpoint_syncs,
  $conman_concurrent_namespace_syncs                  = $kubernetes::master::params::conman_concurrent_namespace_syncs,
  $conman_concurrent_rc_syncs                         = $kubernetes::master::params::conman_concurrent_rc_syncs,
  $conman_concurrent_replicaset_syncs                 = $kubernetes::master::params::conman_concurrent_replicaset_syncs,
  $conman_concurrent_resource_quota_syncs             = $kubernetes::master::params::conman_concurrent_resource_quota_syncs,
  $conman_daemonset_lookup_cache_size                 = $kubernetes::master::params::conman_daemonset_lookup_cache_size,
  $conman_deleting_pods_burst                         = $kubernetes::master::params::conman_deleting_pods_burst,
  $conman_deleting_pods_qps                           = $kubernetes::master::params::conman_deleting_pods_qps,
  $conman_deployment_controller_sync_period           = $kubernetes::master::params::conman_deployment_controller_sync_period,
  $conman_enable_hostpath_provisioner                 = $kubernetes::master::params::conman_enable_hostpath_provisioner,
  $conman_horizontal_pod_autoscaler_sync_period       = $kubernetes::master::params::conman_horizontal_pod_autoscaler_sync_period,
  $conman_kube_api_burst                              = $kubernetes::master::params::conman_kube_api_burst,
  $conman_kube_api_qps                                = $kubernetes::master::params::conman_kube_api_qps,
  $conman_kubeconfig                                  = $kubernetes::master::params::conman_kubeconfig,
  $conman_leader_elect                                = $kubernetes::master::params::conman_leader_elect,
  $conman_leader_elect_lease_duration                 = $kubernetes::master::params::conman_leader_elect_lease_duration,
  $conman_leader_elect_renew_deadline                 = $kubernetes::master::params::conman_leader_elect_renew_deadline,
  $conman_leader_elect_retry_period                   = $kubernetes::master::params::conman_leader_elect_retry_period,
  $conman_log_backtrace_at                            = $kubernetes::master::params::conman_log_backtrace_at,
  $conman_log_dir                                     = $kubernetes::master::params::conman_log_dir,
  $conman_log_flush_frequency                         = $kubernetes::master::params::conman_log_flush_frequency,
  $conman_logtostderr                                 = $kubernetes::master::params::conman_logtostderr,
  $conman_master                                      = $kubernetes::master::params::conman_master,
  $conman_min_resync_period                           = $kubernetes::master::params::conman_min_resync_period,
  $conman_namespace_sync_period                       = $kubernetes::master::params::conman_namespace_sync_period,
  $conman_node_monitor_grace_period                   = $kubernetes::master::params::conman_node_monitor_grace_period,
  $conman_node_monitor_period                         = $kubernetes::master::params::conman_node_monitor_period,
  $conman_node_startup_grace_period                   = $kubernetes::master::params::conman_node_startup_grace_period,
  $conman_node_sync_period                            = $kubernetes::master::params::conman_node_sync_period,
  $conman_pod_eviction_timeout                        = $kubernetes::master::params::conman_pod_eviction_timeout,
  $conman_port                                        = $kubernetes::master::params::conman_port,
  $conman_profiling                                   = $kubernetes::master::params::conman_profiling,
  $conman_pv_recycler_increment_timeout_nfs           = $kubernetes::master::params::conman_pv_recycler_increment_timeout_nfs,
  $conman_pv_recycler_minimum_timeout_hostpath        = $kubernetes::master::params::conman_pv_recycler_minimum_timeout_hostpath,
  $conman_pv_recycler_minimum_timeout_nfs             = $kubernetes::master::params::conman_pv_recycler_minimum_timeout_nfs,
  $conman_pv_recycler_pod_template_filepath_hostpath  = $kubernetes::master::params::conman_pv_recycler_pod_template_filepath_hostpath,
  $conman_pv_recycler_pod_template_filepath_nfs       = $kubernetes::master::params::conman_pv_recycler_pod_template_filepath_nfs,
  $conman_pv_recycler_timeout_increment_hostpath      = $kubernetes::master::params::conman_pv_recycler_timeout_increment_hostpath,
  $conman_pvclaimbinder_sync_period                   = $kubernetes::master::params::conman_pvclaimbinder_sync_period,
  $conman_replicaset_lookup_cache_size                = $kubernetes::master::params::conman_replicaset_lookup_cache_size,
  $conman_replication_controller_lookup_cache_size    = $kubernetes::master::params::conman_replication_controller_lookup_cache_size,
  $conman_resource_quota_sync_period                  = $kubernetes::master::params::conman_resource_quota_sync_period,
  $conman_root_ca_file                                = $kubernetes::master::params::conman_root_ca_file,
  $conman_service_account_private_key_file            = $kubernetes::master::params::conman_service_account_private_key_file,
  $conman_service_sync_period                         = $kubernetes::master::params::conman_service_sync_period,
  $conman_stderrthreshold                             = $kubernetes::master::params::conman_stderrthreshold,
  $conman_terminated_pod_gc_threshold                 = $kubernetes::master::params::conman_terminated_pod_gc_threshold,
  $conman_v                                           = $kubernetes::master::params::conman_v,
  $conman_vmodule                                     = $kubernetes::master::params::conman_vmodule,
) inherits kubernetes::master::params {
  include ::kubernetes::master

  file { '/etc/kubernetes/controller-manager':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/kubernetes/master/controller-manager.erb"),
  } ~> Service['kube-controller-manager']
}
