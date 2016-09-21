# == Class: kubernetes::node::kubelet
#
# Module to install an up-to-date version of kubelet from package.
#
# === Parameters
#
# [*kubelet_service_ensure*]
#   Whether you want to kubelet daemon to start up
#   Defaults to running
#
# [*kubelet_service_enable*]
#   Whether you want to kubelet daemon to start up at boot
#   Defaults to true
#
# [*kubelet_address*]
#   The IP address for the Kubelet to serve on
#   (set to 0.0.0.0 for all interfaces)
#   ** Defaults to "0.0.0.0"
#
# [*kubelet_allow_privileged*]
#   If true, allow containers to request privileged mode.
#   ** Defaults to false
#
# [*kubelet_alsologtostderr*]
#   Log to standard error as well as files
#   ** Defaults to false
#
# [*kubelet_api_servers*]
#   List of Kubernetes API servers for publishing events,
#   and reading pods and services. (ip:port), comma separated.
#   ** Defaults to undef
#
# [*kubelet_application_metrics_count_limit*]
#   Max number of application metrics to store (per container)
#   ** Defaults to 100
#
# [*kubelet_boot_id_file*]
#   Comma-separated list of files to check for boot-id.
#   Use the first one that exists.
#   ** Defaults to "/proc/sys/kernel/random/boot_id"
#
# [*kubelet_cadvisor_port*]
#   The port of the localhost cAdvisor endpoint
#   ** Defaults to 4194
#
# [*kubelet_cert_dir*]
#   The directory where the TLS certs are located
#   (by default /var/run/kubernetes). If --tls-cert-file
#   and --tls-private-key-file are provided,
#   this flag will be ignored
#   ** Defaults to "/var/run/kubernetes"
#
# [*kubelet_cgroup_root*]
#   Optional root cgroup to use for pods. This is handled by
#   the container runtime on a best effort basis. Default: '',
#   which means use the container runtime default.
#   ** Defaults to undef
#
# [*kubelet_chaos_chance*]
#   If > 0.0, introduce random client errors and latency.
#   Intended for testing.
#   ** Defaults to "0.0"
#
# [*kubelet_cloud_config*]
#   The path to the cloud provider configuration file.
#   Empty string for no configuration file.
#   ** Defaults to undef
#
# [*kubelet_cloud_provider*]
#   The provider for cloud services. Empty string for no provider.
#   ** Defaults to undef
#
# [*kubelet_cluster_dns*]
#   IP address for a cluster DNS server. If set, kubelet will
#   configure all containers to use this for DNS resolution in
#   addition to the host's DNS servers
#   ** Defaults to undef
#
# [*kubelet_cluster_domain*]
#   Domain for this cluster. If set, kubelet will configure all
#   containers to search this domain in addition to the
#   host's search domains
#   ** Defaults to undef
#
# [*kubelet_config*]
#   Path to the config file or directory of files
#   ** Defaults to undef
#
# [*kubelet_configure_cbr0*]
#   If true, kubelet will configure cbr0 based
#   on Node.Spec.PodCIDR.
#   ** Defaults to false
#
# [*kubelet_container_hints*]
#   location of the container hints file
#   ** Defaults to "/etc/cadvisor/container_hints.json"
#
# [*kubelet_container_runtime*]
#   The container runtime to use. Possible values:
#   'docker', 'rkt'.
#   ** Defaults to 'docker'.
#
# [*kubelet_containerized*]
#   Experimental support for running kubelet in a container.
#   Intended for testing.
#   ** Defaults to false
#
# [*kubelet_cpu_cfs_quota*]
#   Enable CPU CFS quota enforcement for containers
#   that specify CPU limits
#   ** Defaults to true
#
# [*kubelet_docker*]
#   docker endpoint
#   ** Defaults to "unix:///var/run/docker.sock"
#
# [*kubelet_docker_endpoint*]
#   If non-empty, use this for the docker endpoint
#   to communicate with...
#   ** Defaults to undef
#
# [*kubelet_docker_env_metadata_whitelist*]
#   a comma-separated list of environment variable keys
#   that needs to be collected for docker containers
#   ** Defaults to undef
#
# [*kubelet_docker_exec_handler*]
#   Handler to use when executing a command in a container.
#   Valid values are 'native' and 'nsenter'. Defaults to 'native'.
#   ** Defaults to 'native'
#
# [*kubelet_docker_only*]
#   Only report docker containers in addition to root stats
#   ** Defaults to false
#
# [*kubelet_docker_root*]
#   Absolute path to the Docker state root directory
#   ** Default to "/var/lib/docker"
#
# [*kubelet_docker_run*]
#   Absolute path to the Docker run directory
#   ** Defaults "/var/run/docker"
#
# [*kubelet_enable_custom_metrics*]
#   Support for gathering custom metrics.
#   ** Defaults to false
#
# [*kubelet_enable_debugging_handlers*]
#   Enables server endpoints for log collection and
#   local running of containers and commands
#   ** Defaults to true
#
# [*kubelet_enable_load_reader*]
#   Whether to enable cpu load reader
#   ** Defaults to false
#
# [*kubelet_enable_server*]
#   Enable the Kubelet's server
#   ** Defaults to true
#
# [*kubelet_event_burst*]
#   Maximum size of a bursty event records, temporarily
#   allows event records to burst to this number, while
#   still not exceeding event-qps. Only used if
#   ** Defaults to 10
#
# [*kubelet_event_qps*]
#   If > 0, limit event creations per second to this
#   value. If 0, unlimited.
#   ** Defaults to 5
#
# [*kubelet_event_storage_age_limit*]
#   Max length of time for which to store events (per type).
#   Value is a comma separated list of key values, where the
#   keys are event types (e.g.: creation, oom) or "default" and
#   the value is a duration. Default is applied to all
#   non-specified event types
#   ** Defaults to "default=24h"
#
# [*kubelet_event_storage_event_limit*]
#   Max number of events to store (per type). Value is a comma
#   separated list of key values, where the keys are event types
#   (e.g.: creation, oom) or "default" and the value is an integer.
#   Default is applied to all non-specified event types
#   ** Defaults to "default=100000"
#
# [*kubelet_experimental_flannel_overlay*]
#   Experimental support for starting the kubelet with the default
#   overlay network (flannel). Assumes flanneld is already running
#   in client mode.
#   ** Defaults to false
#
# [*kubelet_file_check_frequency*]
#   Duration between checking config files for new data
#   ** Defaults to "20s"
#
# [*kubelet_global_housekeeping_interval*]
#   Interval between global housekeepings
#   ** Defaults to "1m0s"
#
# [*kubelet_google_json_key*]
#   The Google Cloud Platform Service Account JSON
#   Key to use for authentication.
#   ** Defaults to undef
#
# [*kubelet_hairpin_mode*]
#   How should the kubelet setup hairpin NAT. This allows
#   endpoints of a Service to loadbalance back to themselves
#   if they should try to access their own Service. Valid values
#   are "promiscuous-bridge", "hairpin-veth" and "none".
#   ** Defaults to "promiscuous-bridge"
#
# [*kubelet_healthz_bind_address*]
#    IP address for the healthz server to serve on, defaulting
#   to 127.0.0.1 (set to 0.0.0.0 for all interfaces)
#   ** Defaults to "127.0.0.1"
#
# [*kubelet_healthz_port*]
#   The port of the localhost healthz endpoint
#   ** Defaults to 10248
#
# [*kubelet_host_ipc_sources*]
#   Comma-separated list of sources from which the
#   Kubelet allows pods to use the host ipc namespace.
#   ** Defaults to "*"
#
# [*kubelet_host_network_sources*]
#   Comma_separated list of sources from which the
#   Kubelet allows pods to use of host network.
#   ** Defaults to "*"
#
# [*kubelet_host_pid_sources*]
#   Comma_separated list of sources from which the
#   Kubelet allows pods to use the host pid namespace.
#   ** Defaults to "*"
#
# [*kubelet_hostname_override*]
#   If non-empty, will use this string as identification
#   instead of the actual hostname.
#   ** Defaults to undef
#
# [*kubelet_housekeeping_interval*]
#   Interval between container housekeepings
#   ** Defaults to "10s"
#
# [*kubelet_http_check_frequency*]
#   Duration between checking http for new data
#   ** Defaults to "20s"
#
# [*kubelet_image_gc_high_threshold*]
#   The percent of disk usage after which image
#   garbage collection is always run. Default: 90%
#   ** Defaults to 90
#
# [*kubelet_image_gc_low_threshold*]
#   The percent of disk usage before which image garbage
#   collection is never run. Lowest disk usage to garbage
#   collect to.
#   ** Defaults to "80"
#
# [*kubelet_kube_api_burst*]
#   Burst to use while talking with kubernetes apiserver
#   ** Defaults to 10
#
# [*kubelet_kube_api_qps*]
#   QPS to use while talking with kubernetes apiserver
#   ** Defaults to 5
#
# [*kubelet_kube_reserved*]
#   A set of ResourceName=ResourceQuantity (e.g. cpu=200m,memory=150G)
#   pairs that describe resources reserved for kubernetes system
#   components. Currently only cpu and memory are supported. See
#   http://releases.k8s.io/HEAD/docs/user-guide/compute-resources.md
#   for more detail.
#   ** Defaults to undef
#
# [*kubelet_kubeconfig*]
#   Path to a kubeconfig file, specifying how to authenticate to
#   API server (the master location is set by the api-servers flag).
#   ** Defaults to "/var/lib/kubelet/kubeconfig"
#
# [*kubelet_kubelet_cgroups*]
#   Optional absolute name of cgroups to create and
#   run the Kubelet in.
#   ** Defaults to undef
#
# [*kubelet_lock_file*]
#   <Warning: Alpha feature> The path to file for kubelet
#   to use as a lock file.
#   ** Defaults to undef
#
# [*kubelet_log_backtrace_at*]
#   when logging hits line file:N, emit a stack trace
#   ** Defaults to undef
#
# [*kubelet_log_cadvisor_usage*]
#    to log the usage of the cAdvisor container
#   ** Defaults to false
#
# [*kubelet_log_dir*]
#   If non-empty, write log files in this directory
#   ** Defaults to undef
#
# [*kubelet_log_flush_frequency*]
#   Maximum number of seconds between log flushes
#   ** Defaults to "5s"
#
# [*kubelet_logtostderr*]
#   log to standard error instead of files
#   ** Defaults to true
#
# [*kubelet_low_diskspace_threshold_mb*]
#   The absolute free disk space, in MB, to maintain.
#   When disk space falls below this threshold, new
#   pods would be rejected.
#   ** Defaults to 256
#
# [*kubelet_machine_id_file*]
#   Comma-separated list of files to check for machine-id.
#   Use the first one that exists.
#   ** Defaults to "/etc/machine-id,/var/lib/dbus/machine-id"
#
# [*kubelet_manifest_url*]
#   URL for accessing the container manifest
#   ** Defaults to undef
#
# [*kubelet_manifest_url_header*]
#   HTTP header to use when accessing the manifest URL,
#   with the key separated from the value with a ':',
#   as in 'key:value'
#   ** Defaults to undef
#
# [*kubelet_master_service_namespace*]
#   The namespace from which the kubernetes master
#   services should be injected into pods
#   ** Defaults to "default"
#
# [*kubelet_max_open_files*]
#   Number of files that can be opened by Kubelet process.
#   ** Defaults to 1000000
#
# [*kubelet_max_pods*]
#   Number of Pods that can run on this Kubelet.
#   ** Defaults to 110
#
# [*kubelet_maximum_dead_containers*]
#   Maximum number of old instances of containers to
#   retain globally.  Each container takes up some
#   disk space.
#   ** Defaults to 240
#
# [*kubelet_maximum_dead_containers_per_container*]
#   Maximum number of old instances to retain per container.
#   Each container takes up some disk space.
#   ** Defaults to 2
#
# [*kubelet_minimum_container_ttl_duration*]
#   Minimum age for a finished container before it is
#   garbage collected.  Examples: '300ms', '10s' or '2h45m'
#   ** Defaults to "1m0s"
#
# [*kubelet_minimum_image_ttl_duration*]
#   Minimum age for a unused image before it is garbage
#   collected.  Examples: '300ms', '10s' or '2h45m'.
#   ** Defaults to '2m0s'
#
# [*kubelet_network_plugin*]
#   <Warning: Alpha feature> The name of the network plugin
#   to be invoked for various events in kubelet/pod lifecycle
#   ** Defaults to undef
#
# [*kubelet_network_plugin_dir*]
#   <Warning: Alpha feature> The full path of the directory
#   in which to search for network plugins
#   ** Defaults to "/usr/libexec/kubernetes/kubelet-plugins/net/exec/"
#
# [*kubelet_node_ip*]
#   IP address of the node. If set, kubelet will use
#   this IP address for the node
#   ** Defaults to undef
#
# [*kubelet_node_labels*]
#   <Warning: Alpha feature> Labels to add when registering
#   the node in the cluster.  Labels must be key=value
#   pairs separated by ','.
#   ** Defaults to undef
#
# [*kubelet_node_status_update_frequency*]
#   Specifies how often kubelet posts node status to master.
#   Note: be cautious when changing the constant, it must
#   work with nodeMonitorGracePeriod in nodecontroller.
#   ** Defaults to "10s"
#
# [*kubelet_non_masquerade_cidr*]
#   Traffic to IPs outside this range will use IP masquerade.
#   ** Defaults to "10.0.0.0/8"
#
# [*kubelet_oom_score_adj*]
#   The oom-score-adj value for kubelet process.
#   Values must be within the range [-1000, 1000]
#   ** Defaults to "-999"
#
# [*kubelet_outofdisk_transition_frequency*]
#   Duration for which the kubelet has to wait before
#   transitioning out of out-of-disk node condition status.
#   ** Defaults to "5m0s"
#
# [*kubelet_pod_cidr*]
#   The CIDR to use for pod IP addresses, only used in standalone mode.
#   In cluster mode, this is obtained from the master.
#   ** Defaults to undef
#
# [*kubelet_pod_infra_container_image*]
#   The image whose network/ipc namespaces containers in
#   each pod will use.
#   ** Defaults to "gcr.io/google_containers/pause:2.0"
#
# [*kubelet_port*]
#   The port for the Kubelet to serve on.
#   ** Defaults to 10250
#
# [*kubelet_read_only_port*]
#   The read-only port for the Kubelet to serve on
#   with no authentication/authorization (set to 0 to disable)
#   ** Defaults to 10255
#
# [*kubelet_really_crash_for_testing*]
#   If true, when panics occur crash. Intended for testing.
#   ** Defaults to false
#
# [*kubelet_reconcile_cidr*]
#   Reconcile node CIDR with the CIDR specified by the
#   API server. No-op if register-node or configure-cbr0 is false.
#   ** Defaults to true
#
# [*kubelet_register_node*]
#   Register the node with the apiserver (defaults to true if
#   ** Defaults to true
#
# [*kubelet_register_schedulable*]
#   Register the node as schedulable. No-op if register-node is false.
#   ** Defaults to true
#
# [*kubelet_registry_burst*]
#   Maximum size of a bursty pulls, temporarily allows pulls to
#   burst to this number, while still not exceeding registry-qps.
#   Only used if
#   ** Defaults to 10
#
# [*kubelet_registry_qps*]
#   If > 0, limit registry pull QPS to this value. If 0, unlimited.
#   ** Defaults to "5.0"
#
# [*kubelet_resolv_conf*]
#   Resolver configuration file used as the basis for the container
#   DNS resolution configuration.
#   ** Defaults to "/etc/resolv.conf"
#
# [*kubelet_rkt_path*]
#   Path of rkt binary. Leave empty to use the first rkt in $PATH.
#   Only used if
#   ** Defaults to undef
#
# [*kubelet_rkt_stage1_image*]
#   image to use as stage1. Local paths and http/https URLs are supported.
#   If empty, the 'stage1.aci' in the same directory as '
#   ** Defaults to undef
#
# [*kubelet_root_dir*]
#   Directory path for managing kubelet files (volume mounts,etc).
#   ** Defaults to "/var/lib/kubelet"
#
# [*kubelet_runonce*]
#   If true, exit after spawning pods from local manifests or
#   remote urls. Exclusive with
#   ** Defaults to false
#
# [*kubelet_runtime_cgroups*]
#   Optional absolute name of cgroups to create and run the runtime in.
#   ** Defaults to undef
#
# [*kubelet_serialize_image_pulls*]
#   Pull images one at a time. We recommend *not* changing the default
#   value on nodes that run docker daemon with version < 1.9 or an Aufs
#   storage backend. Issue #10959 has more details.
#   ** Defaults to true
#
# [*kubelet_stderrthreshold*]
#   logs at or above this threshold go to stderr
#   ** Defaults to 2
#
# [*kubelet_storage_driver_buffer_duration*]
#   Writes in the storage driver will be buffered for this duration,
#   and committed to the non memory backends as a single transaction
#   ** Defaults to "1m0s"
#
# [*kubelet_storage_driver_db*]
#   database name
#   ** Defaults to "cadvisor"
#
# [*kubelet_storage_driver_host*]
#   database host:port
#   ** Defaults to "localhost:8086"
#
# [*kubelet_storage_driver_password*]
#   database password
#   ** Defaults to "root"
#
# [*kubelet_storage_driver_secure*]
#   use secure connection with database
#   ** Defaults to false
#
# [*kubelet_storage_driver_table*]
#   table name
#   ** Defaults to "stats"
#
# [*kubelet_storage_driver_user*]
#   database username
#   ** Defaults to "root"
#
# [*kubelet_streaming_connection_idle_timeout*]
#   Maximum time a streaming connection can be idle before
#   the connection is automatically closed. 0 indicates no
#   timeout. Example: '5m'
#   ** Defaults to "4h0m0s"
#
# [*kubelet_sync_frequency*]
#   Max period between synchronizing running containers and config
#   ** Defaults to "1m0s"
#
# [*kubelet_system_cgroups*]
#   Optional absolute name of cgroups in which to place all
#   non-kernel processes that are not already inside a cgroup
#   under `/`. Empty for no container. Rolling back the flag
#   requires a reboot.
#   ** Defaults to undef
#
# [*kubelet_system_reserved*]
#   A set of ResourceName=ResourceQuantity (e.g. cpu=200m,memory=150G)
#   pairs that describe resources reserved for non-kubernetes components.
#   Currently only cpu and memory are supported. See
#   http://releases.k8s.io/HEAD/docs/user-guide/compute-resources.md
#   for more detail.
#   ** Defaults to undef
#
# [*kubelet_tls_cert_file*]
#   File containing x509 Certificate for HTTPS.
#   (CA cert, if any, concatenated after server cert). If
#   ** Defaults to undef
#
# [*kubelet_tls_private_key_file*]
#   File containing x509 private key matching
#   ** Defaults to undef
#
# [*kubelet_v*]
#   log level for V logs
#   ** Defaults to 0
#
# [*kubelet_vmodule*]
#   comma-separated list of pattern=N settings for file-filtered logging
#   ** Defaults to undef
#
# [*kubelet_volume_plugin_dir*]
#   <Warning: Alpha feature> The full path of the directory in which
#   to search for additional third party volume plugins
#   ** Defaults to "/usr/libexec/kubernetes/kubelet-plugins/volume/exec/"
#
# [*kubelet_volume_stats_agg_period*]
#   Specifies interval for kubelet to calculate and cache the volume disk
#   usage for all pods and volumes.  To disable volume calculations, set to 0.
#   ** Defaults to '1m0s'
#
class kubernetes::node::kubelet (
  $kubelet_service_ensure                         = $kubernetes::node::params::kubelet_service_ensure,
  $kubelet_service_enable                         = $kubernetes::node::params::kubelet_service_enable,
  $kubelet_address                                = $kubernetes::node::params::kubelet_address,
  $kubelet_allow_privileged                       = $kubernetes::node::params::kubelet_allow_privileged,
  $kubelet_alsologtostderr                        = $kubernetes::node::params::kubelet_alsologtostderr,
  $kubelet_api_servers                            = $kubernetes::node::params::kubelet_api_servers,
  $kubelet_application_metrics_count_limit        = $kubernetes::node::params::kubelet_application_metrics_count_limit,
  $kubelet_boot_id_file                           = $kubernetes::node::params::kubelet_boot_id_file,
  $kubelet_cadvisor_port                          = $kubernetes::node::params::kubelet_cadvisor_port,
  $kubelet_cert_dir                               = $kubernetes::node::params::kubelet_cert_dir,
  $kubelet_cgroup_root                            = $kubernetes::node::params::kubelet_cgroup_root,
  $kubelet_chaos_chance                           = $kubernetes::node::params::kubelet_chaos_chance,
  $kubelet_cloud_config                           = $kubernetes::node::params::kubelet_cloud_config,
  $kubelet_cloud_provider                         = $kubernetes::node::params::kubelet_cloud_provider,
  $kubelet_cluster_dns                            = $kubernetes::node::params::kubelet_cluster_dns,
  $kubelet_cluster_domain                         = $kubernetes::node::params::kubelet_cluster_domain,
  $kubelet_config                                 = $kubernetes::node::params::kubelet_config,
  $kubelet_configure_cbr0                         = $kubernetes::node::params::kubelet_configure_cbr0,
  $kubelet_container_hints                        = $kubernetes::node::params::kubelet_container_hints,
  $kubelet_container_runtime                      = $kubernetes::node::params::kubelet_container_runtime,
  $kubelet_containerized                          = $kubernetes::node::params::kubelet_containerized,
  $kubelet_cpu_cfs_quota                          = $kubernetes::node::params::kubelet_cpu_cfs_quota,
  $kubelet_docker                                 = $kubernetes::node::params::kubelet_docker,
  $kubelet_docker_endpoint                        = $kubernetes::node::params::kubelet_docker_endpoint,
  $kubelet_docker_env_metadata_whitelist          = $kubernetes::node::params::kubelet_docker_env_metadata_whitelist,
  $kubelet_docker_exec_handler                    = $kubernetes::node::params::kubelet_docker_exec_handler,
  $kubelet_docker_only                            = $kubernetes::node::params::kubelet_docker_only,
  $kubelet_docker_root                            = $kubernetes::node::params::kubelet_docker_root,
  $kubelet_docker_run                             = $kubernetes::node::params::kubelet_docker_run,
  $kubelet_enable_custom_metrics                  = $kubernetes::node::params::kubelet_enable_custom_metrics,
  $kubelet_enable_debugging_handlers              = $kubernetes::node::params::kubelet_enable_debugging_handlers,
  $kubelet_enable_load_reader                     = $kubernetes::node::params::kubelet_enable_load_reader,
  $kubelet_enable_server                          = $kubernetes::node::params::kubelet_enable_server,
  $kubelet_event_burst                            = $kubernetes::node::params::kubelet_event_burst,
  $kubelet_event_qps                              = $kubernetes::node::params::kubelet_event_qps,
  $kubelet_event_storage_age_limit                = $kubernetes::node::params::kubelet_event_storage_age_limit,
  $kubelet_event_storage_event_limit              = $kubernetes::node::params::kubelet_event_storage_event_limit,
  $kubelet_experimental_flannel_overlay           = $kubernetes::node::params::kubelet_experimental_flannel_overlay,
  $kubelet_file_check_frequency                   = $kubernetes::node::params::kubelet_file_check_frequency,
  $kubelet_global_housekeeping_interval           = $kubernetes::node::params::kubelet_global_housekeeping_interval,
  $kubelet_google_json_key                        = $kubernetes::node::params::kubelet_google_json_key,
  $kubelet_hairpin_mode                           = $kubernetes::node::params::kubelet_hairpin_mode,
  $kubelet_healthz_bind_address                   = $kubernetes::node::params::kubelet_healthz_bind_address,
  $kubelet_healthz_port                           = $kubernetes::node::params::kubelet_healthz_port,
  $kubelet_host_ipc_sources                       = $kubernetes::node::params::kubelet_host_ipc_sources,
  $kubelet_host_network_sources                   = $kubernetes::node::params::kubelet_host_network_sources,
  $kubelet_host_pid_sources                       = $kubernetes::node::params::kubelet_host_pid_sources,
  $kubelet_hostname_override                      = $kubernetes::node::params::kubelet_hostname_override,
  $kubelet_housekeeping_interval                  = $kubernetes::node::params::kubelet_housekeeping_interval,
  $kubelet_http_check_frequency                   = $kubernetes::node::params::kubelet_http_check_frequency,
  $kubelet_image_gc_high_threshold                = $kubernetes::node::params::kubelet_image_gc_high_threshold,
  $kubelet_image_gc_low_threshold                 = $kubernetes::node::params::kubelet_image_gc_low_threshold,
  $kubelet_kube_api_burst                         = $kubernetes::node::params::kubelet_kube_api_burst,
  $kubelet_kube_api_qps                           = $kubernetes::node::params::kubelet_kube_api_qps,
  $kubelet_kube_reserved                          = $kubernetes::node::params::kubelet_kube_reserved,
  $kubelet_kubeconfig                             = $kubernetes::node::params::kubelet_kubeconfig,
  $kubelet_kubelet_cgroups                        = $kubernetes::node::params::kubelet_kubelet_cgroups,
  $kubelet_lock_file                              = $kubernetes::node::params::kubelet_lock_file,
  $kubelet_log_backtrace_at                       = $kubernetes::node::params::kubelet_log_backtrace_at,
  $kubelet_log_cadvisor_usage                     = $kubernetes::node::params::kubelet_log_cadvisor_usage,
  $kubelet_log_dir                                = $kubernetes::node::params::kubelet_log_dir,
  $kubelet_log_flush_frequency                    = $kubernetes::node::params::kubelet_log_flush_frequency,
  $kubelet_logtostderr                            = $kubernetes::node::params::kubelet_logtostderr,
  $kubelet_low_diskspace_threshold_mb             = $kubernetes::node::params::kubelet_low_diskspace_threshold_mb,
  $kubelet_machine_id_file                        = $kubernetes::node::params::kubelet_machine_id_file,
  $kubelet_manifest_url                           = $kubernetes::node::params::kubelet_manifest_url,
  $kubelet_manifest_url_header                    = $kubernetes::node::params::kubelet_manifest_url_header,
  $kubelet_master_service_namespace               = $kubernetes::node::params::kubelet_master_service_namespace,
  $kubelet_max_open_files                         = $kubernetes::node::params::kubelet_max_open_files,
  $kubelet_max_pods                               = $kubernetes::node::params::kubelet_max_pods,
  $kubelet_maximum_dead_containers                = $kubernetes::node::params::kubelet_maximum_dead_containers,
  $kubelet_maximum_dead_containers_per_container  = $kubernetes::node::params::kubelet_maximum_dead_containers_per_container,
  $kubelet_minimum_container_ttl_duration         = $kubernetes::node::params::kubelet_minimum_container_ttl_duration,
  $kubelet_minimum_image_ttl_duration             = $kubernetes::node::params::kubelet_minimum_image_ttl_duration,
  $kubelet_network_plugin                         = $kubernetes::node::params::kubelet_network_plugin,
  $kubelet_network_plugin_dir                     = $kubernetes::node::params::kubelet_network_plugin_dir,
  $kubelet_node_ip                                = $kubernetes::node::params::kubelet_node_ip,
  $kubelet_node_labels                            = $kubernetes::node::params::kubelet_node_labels,
  $kubelet_node_status_update_frequency           = $kubernetes::node::params::kubelet_node_status_update_frequency,
  $kubelet_non_masquerade_cidr                    = $kubernetes::node::params::kubelet_non_masquerade_cidr,
  $kubelet_oom_score_adj                          = $kubernetes::node::params::kubelet_oom_score_adj,
  $kubelet_outofdisk_transition_frequency         = $kubernetes::node::params::kubelet_outofdisk_transition_frequency,
  $kubelet_pod_cidr                               = $kubernetes::node::params::kubelet_pod_cidr,
  $kubelet_pod_infra_container_image              = $kubernetes::node::params::kubelet_pod_infra_container_image,
  $kubelet_port                                   = $kubernetes::node::params::kubelet_port,
  $kubelet_read_only_port                         = $kubernetes::node::params::kubelet_read_only_port,
  $kubelet_really_crash_for_testing               = $kubernetes::node::params::kubelet_really_crash_for_testing,
  $kubelet_reconcile_cidr                         = $kubernetes::node::params::kubelet_reconcile_cidr,
  $kubelet_register_node                          = $kubernetes::node::params::kubelet_register_node,
  $kubelet_register_schedulable                   = $kubernetes::node::params::kubelet_register_schedulable,
  $kubelet_registry_burst                         = $kubernetes::node::params::kubelet_registry_burst,
  $kubelet_registry_qps                           = $kubernetes::node::params::kubelet_registry_qps,
  $kubelet_resolv_conf                            = $kubernetes::node::params::kubelet_resolv_conf,
  $kubelet_rkt_path                               = $kubernetes::node::params::kubelet_rkt_path,
  $kubelet_rkt_stage1_image                       = $kubernetes::node::params::kubelet_rkt_stage1_image,
  $kubelet_root_dir                               = $kubernetes::node::params::kubelet_root_dir,
  $kubelet_runonce                                = $kubernetes::node::params::kubelet_runonce,
  $kubelet_runtime_cgroups                        = $kubernetes::node::params::kubelet_runtime_cgroups,
  $kubelet_serialize_image_pulls                  = $kubernetes::node::params::kubelet_serialize_image_pulls,
  $kubelet_stderrthreshold                        = $kubernetes::node::params::kubelet_stderrthreshold,
  $kubelet_storage_driver_buffer_duration         = $kubernetes::node::params::kubelet_storage_driver_buffer_duration,
  $kubelet_storage_driver_db                      = $kubernetes::node::params::kubelet_storage_driver_db,
  $kubelet_storage_driver_host                    = $kubernetes::node::params::kubelet_storage_driver_host,
  $kubelet_storage_driver_password                = $kubernetes::node::params::kubelet_storage_driver_password,
  $kubelet_storage_driver_secure                  = $kubernetes::node::params::kubelet_storage_driver_secure,
  $kubelet_storage_driver_table                   = $kubernetes::node::params::kubelet_storage_driver_table,
  $kubelet_storage_driver_user                    = $kubernetes::node::params::kubelet_storage_driver_user,
  $kubelet_streaming_connection_idle_timeout      = $kubernetes::node::params::kubelet_streaming_connection_idle_timeout,
  $kubelet_sync_frequency                         = $kubernetes::node::params::kubelet_sync_frequency,
  $kubelet_system_cgroups                         = $kubernetes::node::params::kubelet_system_cgroups,
  $kubelet_system_reserved                        = $kubernetes::node::params::kubelet_system_reserved,
  $kubelet_tls_cert_file                          = $kubernetes::node::params::kubelet_tls_cert_file,
  $kubelet_tls_private_key_file                   = $kubernetes::node::params::kubelet_tls_private_key_file,
  $kubelet_v                                      = $kubernetes::node::params::kubelet_v,
  $kubelet_vmodule                                = $kubernetes::node::params::kubelet_vmodule,
  $kubelet_volume_plugin_dir                      = $kubernetes::node::params::kubelet_volume_plugin_dir,
  $kubelet_volume_stats_agg_period                = $kubernetes::node::params::kubelet_volume_stats_agg_period,
) inherits kubernetes::node::params {
  include ::kubernetes::node

  if $cert_dir and ($tls_cert_file or $tls_private_key_file) {
    fail('You can\'t use both of cert_dir and tls_*.')
  }

  # Autoregister and create docker bridge
  if $register_node and $configure_cbr0 {
    package { ['bridge-utils']: ensure => 'present', } ->
    file { '/etc/kubernetes/node_initial.yaml':
      ensure  => 'file',
      content => template("${module_name}/node.yaml.erb"),
    } ->
    exec { 'register node':
      command => "/bin/kubectl create --server=${api_servers} -f /etc/kubernetes/node/node_initial.yaml",
      unless  => "/bin/kubectl describe nodes --server=${api_servers} ${::fqdn}",
    } ->
    # if we configure cbr0, most probably docker will have to wait for this first to be configured,
    exec { 'force kubelet to create cbr0':
      command => "/bin/kubelet --runonce=true --api_servers=${api_servers} --configure-cbr0=true --enable-server=false",
      creates => '/sys/class/net/cbr0/',
      returns => 1,
    } ~> Service['docker']
  }

  file { '/etc/kubernetes/kubelet':
    ensure  => 'file',
    content => template("${module_name}/etc/kubernetes/node/kubelet.erb"),
  } ~> Service['kubelet']
}
