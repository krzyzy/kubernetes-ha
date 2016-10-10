# == Class: kubernetes::master::apiserver
#
# Module to setup kubernetes apiserver service
#
# === Parameters
#
# [*apisrv_service_ensure*]
#   Whether you want the apiserver daemon to start up
#   ** Defaults to running
#
# [*apisrv_service_enable*]
#   Whether you want the apiserver daemon to start up at boot
#   ** Defaults to true
#
# [*apisrv_admission_control*]
#   Ordered list of plug-ins to do admission control of resources into cluster.
#   Comma-delimited list of: AlwaysAdmit, AlwaysDeny, AlwaysPullImages,
#   DenyEscalatingExec, DenyExecOnPrivileged, InitialResources, LimitRanger,
#   NamespaceAutoProvision, NamespaceExists, NamespaceLifecycle,
#   PersistentVolumeLabel, ResourceQuota, SecurityContextDeny, ServiceAccount
#   ** Defaulte to "AlwaysAdmit"
#
# [*apisrv_admission_control_config_file*]
#   File with admission control configuration.
#   ** Defaults to none
#
# [*apisrv_advertise_address*]
#   The IP address on which to advertise the apiserver to members of
#   the cluster. This address must be reachable by the rest of the
#   cluster. If blank, the --bind-address will be used. If
#   --bind-address is unspecified, the host's default interface will
#   be used.
#   ** Defaults to none
#
# [*apisrv_allow_privileged*]
#   If true, allow privileged containers.
#   ** Defaults to false
#
# [*apisrv_alsologtostderr*]
#   Log to standard error as well as files
#   ** Defaults to false
#
# [*apisrv_count*]
#   The number of apiservers running in the cluster
#   ** Defaults to 1
#
# [*apisrv_authorization_mode*]
#   Ordered list of plug-ins to do authorization on secure port.
#   Comma-delimited list of: AlwaysAllow,AlwaysDeny,ABAC,Webhook
#   ** Defaults to "AlwaysAllow"
#
# [*apisrv_authorization_policy_file*]
#   File with authorization policy in csv format,
#   used with --authorization-mode=ABAC, on the secure port.
#   ** Defaults to none
#
# [*apisrv_authorization_webhook_config_file*]
#   File with webhook configuration in kubeconfig format, used
#   with --authorization-mode=Webhook. The API server will query the
#   remote service to determine access on the API server's secure port.
#   ** Defaults to none
#
# [*apisrv_basic_auth_file*]
#   If set, the file that will be used to admit requests to the secure
#   port of the API server via http basic authentication.
#   ** Defaults to none
#
# [*apisrv_bind_address*]
#   The IP address on which to listen for the --secure-port port.
#   The associated interface(s) must be reachable by the
#   rest of the cluster, and by CLI/web clients. If blank,
#   all interfaces will be used (0.0.0.0).
#   ** Defaults to 0.0.0.0
#
# [*apisrv_cert_dir*]
#   The directory where the TLS certs are located (by default
#   /var/run/kubernetes). If --tls-cert-file and --tls-private-key-file
#   are provided, this flag will be ignored.
#   ** Defaults to "/var/run/kubernetes"
#
# [*apisrv_client_ca_file*]
#   If set, any request presenting a client certificate signed
#   by one of the authorities in the client-ca-file is authenticated
#   with an identity corresponding to the CommonName of the client certificate.
#   ** Defaults to none
#
# [*apisrv_cloud_config*]
#   The path to the cloud provider configuration file.
#   Empty string for no configuration file.
#   ** Defaults to none
#
# [*apisrv_cloud_provider*]
#   The provider for cloud services. Empty string for no provider.
#   ** Defaults to none
#
# [*apisrv_cors_allowed_origins*]
#   List of allowed origins for CORS, comma separated.
#   An allowed origin can be a regular expression to support subdomain matching.
#   If this list is empty CORS will not be enabled.
#   ** Defaults to none
#
# [*apisrv_delete_collection_workers*]
#   Number of workers spawned for DeleteCollection call.
#   These are used to speed up namespace cleanup.
#   ** Defaults to 1
#
# [*apisrv_etcd_cafile*]
#   SSL Certificate Authority file used to secure etcd communication
#   ** Defaults to none
#
# [*apisrv_etcd_certfile*]
#   SSL certification file used to secure etcd communication
#   ** Defaults to none
#
# [*apisrv_etcd_keyfile*]
#   SSL key file used to secure etcd communication
#   ** Defaults to none
#
# [*apisrv_etcd_prefix*]
#   The prefix for all resource paths in etcd.
#   ** Defaults to "/registry"
#
# [*apisrv_etcd_quorum_read*]
#   If true, enable quorum read
#   ** Defaults to false
#
# [*apisrv_etcd_servers*]
#   List of etcd servers to watch (http://ip:port),
#   comma separated. Mutually exclusive with -etcd-config
#   ** Defaults to none
#
# [*apisrv_etcd_servers_overrides*]
#   Per-resource etcd servers overrides, comma separated.
#   The individual override format: group/resource#servers,
#   where servers are http://ip:port, semicolon separated.
#   ** Defaults to none
#
# [*apisrv_event_ttl*]
#   Amount of time to retain events. Default 1 hour.
#   ** Defaults to 1h0m0s
#
# [*apisrv_experimental_keystone_url*]
#   If passed, activates the keystone authentication plugin.
#   ** Defaults to none
#
# [*apisrv_external_hostname*]
#   The hostname to use when generating externalized URLs for this
#   master (e.g. Swagger API Docs.)
#   ** Defaults to none
#
# [*apisrv_httptest_serve*]
#   If non-empty, httptest.NewServer serves on this address and blocks
#   ** Defaults to none
#
# [*apisrv_insecure_bind_address*]
#   The IP address on which to serve the --insecure-port
#   (set to 0.0.0.0 for all interfaces). Defaults to localhost.
#   ** Defaults to 127.0.0.1
#
# [*apisrv_insecure_port*]
#   The port on which to serve unsecured, unauthenticated access.
#   Default 8080. It is assumed that firewall rules are set up such
#   that this port is not reachable from outside of the cluster and
#   that port 443 on the cluster's public address is proxied to this port.
#   This is performed by nginx in the default setup.
#   ** Defaults to 8080
#
# [*apisrv_ir_data_source*]
#   Data source used by InitialResources. Supported options: influxdb, gcm.
#   ** Defaults to "influxdb"
#
# [*apisrv_ir_dbname*]
#   InfluxDB database name which contains metrics requred by InitialResources
#   ** Defaults to "k8s"
#
# [*apisrv_ir_hawkular*]
#   Hawkular configuration URL
#   ** Defaults to none
#
# [*apisrv_ir_influxdb_host*]
#   Address of InfluxDB which contains metrics requred by InitialResources
#   ** Defaults to "localhost:8080/api/v1/proxy/namespaces/kube-system/services/monitoring-influxdb:api"
#
# [*apisrv_ir_namespace_only*]
#   Whether the estimation should be made only based on data from the same namespace.
#   ** Defaults to false
#
# [*apisrv_ir_password*]
#   Password used for connecting to InfluxDB
#   ** Defaults to "root"
#
# [*apisrv_ir_percentile*]
#   Which percentile of samples should InitialResources use when
#   estimating resources. For experiment purposes.
#   ** Defaults to 90
#
# [*apisrv_ir_user*]
#   User used for connecting to InfluxDB
#   ** Defaults to "root"
#
# [*apisrv_kubelet_certificate_authority*]
#   Path to a cert. file for the certificate authority.
#   ** Defaults to none
#
# [*apisrv_kubelet_client_certificate*]
#   Path to a client cert file for TLS.
#   ** Defaults to none
#
# [*apisrv_kubelet_client_key*]
#   Path to a client key file for TLS.
#   ** Defaults to none
#
# [*apisrv_kubelet_https*]
#   Use https for kubelet connections
#   ** Defaults to true
#
# [*apisrv_kubelet_timeout*]
#   Timeout for kubelet operations
#   ** Defaults to 5s
#
# [*apisrv_kubernetes_service_node_port*]
#   If non-zero, the Kubernetes master service (which apiserver
#   creates/maintains) will be of type NodePort, using this as
#   the value of the port. If zero, the Kubernetes master service will be of type ClusterIP.
#   ** Defaults to 0
#
# [*apisrv_log_backtrace_at*]
#   When logging hits line file:N, emit a stack trace
#   ** Defaults to 0
#
# [*apisrv_log_dir*]
#   If non-empty, write log files in this directory
#   ** Defaults to none
#
# [*apisrv_log_flush_frequency*]
#   Maximum number of seconds between log flushes
#   ** Defaults to 5s
#
# [*apisrv_logtostderr*]
#   Log to standard error instead of files
#   ** Defaults to true
#
# [*apisrv_long_running_request_regexp*]
#   A regular expression matching long running requests which should
#   be excluded from maximum inflight request handling.
#   ** Defaults to "(/|^)((watch|proxy)(/|$)|(logs?|portforward|exec|attach)/?$)"
#
# [*apisrv_master_service_namespace*]
#   The namespace from which the kubernetes master
#   services should be injected into pods
#   ** Defaults to "default"
#
# [*apisrv_max_connection_bytes_per_sec*]
#   If non-zero, throttle each user connection to this number of bytes/sec.
#   Currently only applies to long-running requests
#   ** Defaults to 0
#
# [*apisrv_max_requests_inflight*]
#   The maximum number of requests in flight at a given time.
#   When the server exceeds this, it rejects requests. Zero for no limit.
#   ** Defaults to 400
#
# [*apisrv_min_reques_timeout*]
#   An optional field indicating the minimum number of seconds a
#   handler must keep a request open before timing it out.
#   Currently only honored by the watch request handler, which
#   picks a randomized value above this number as the connection timeout, to spread out load.
#   ** Defaults to 1800
#
# [*apisrv_oidc_ca_file*]
#   If set, the OpenID server's certificate will be verified by one of the
#   authorities in the oidc-ca-file, otherwise the host's root CA set will be used
#   ** Defaults to none
#
# [*apisrv_oidc_client_id*]
#   The client ID for the OpenID Connect client,
#   must be set if oidc-issuer-url is set
#   ** Defaults to none
#
# [*apisrv_oidc_groups_claim*]
#   If provided, the name of a custom OpenID Connect claim for
#   specifying user groups. The claim value is expected to be an
#   array of strings. This flag is experimental, please see the
#   authentication documentation for further details.
#   ** Defaults to none
#
# [*apisrv_oidc_issuer_url*]
#   The URL of the OpenID issuer, only HTTPS scheme will be accepted.
#   If set, it will be used to verify the OIDC JSON Web Token (JWT)
#   ** Defaults to none
#
# [*apisrv_oidc_username_claim*]
#   The OpenID claim to use as the user name. Note that claims other
#   than the default ('sub') is not guaranteed to be unique and immutable.
#   This flag is experimental, please see the authentication documentation for further details.
#   ** Defaults to "sub"
#
# [*apisrv_profiling*]
#   Enable profiling via web interface host:port/debug/pprof/
#   ** Defaults to true
#
# [*apisrv_repair_malformed_updates*]
#   If true, server will do its best to fix the update request to pass the
#   validation, e.g., setting empty UID in update request to its existing value.
#   This flag can be turned off after we fix all the clients that send malformed updates.
#   ** Defaults to true
#
# [*apisrv_runtime_config*]
#   A set of key=value pairs that describe runtime configuration
#   that may be passed to apiserver. apis/<groupVersion> key can be
#   used to turn on/off specific api versions. apis/<groupVersion>/<resource>
#   can be used to turn on/off specific resources. api/all and api/legacy
#   are special keys to control all and legacy api versions respectively.
#   ** Defaults to none
#
# [*apisrv_secure_port*]
#   The port on which to serve HTTPS with authentication and authorization.
#   If 0, don't serve HTTPS at all.
#   ** Defaults to 6443
#
# [*apisrv_service_account_key_file*]
#   File containing PEM-encoded x509 RSA private or public key,
#   used to verify ServiceAccount tokens. If unspecified,
#   --tls-private-key-file is used.
#   ** Defaults to none
#
# [*apisrv_service_account_lookup*]
#   If true, validate ServiceAccount tokens exist in etcd as part of authentication.
#   ** Defaults to false
#
# [*apisrv_service_cluster_ip_range*]
#   A CIDR notation IP range from which to assign service cluster IPs.
#   This must not overlap with any IP ranges assigned to nodes for pods.
#   ** Defaults to none
#
# [*apisrv_service_node_port_range*]
#   A port range to reserve for services with NodePort visibility.
#   Example: '30000-32767'. Inclusive at both ends of the range.
#   ** Defaults to none
#
# [*apisrv_ssh_keyfile*]
#   If non-empty, use secure SSH proxy to the nodes, using this user keyfile
#   ** Defaults to none
#
# [*apisrv_ssh_user*]
#   If non-empty, use secure SSH proxy to the nodes, using this user name
#   ** Defaults to none
#
# [*apisrv_stderrthreshold*]
#   Logs at or above this threshold go to stderr
#   ** Defaults to 2
#
# [*apisrv_storage_versions*]
#   You only need to pass the groups you wish to change from the defaults.
#   It defaults to a list of preferred versions of all registered groups,
#   which is derived from the KUBE_API_VERSIONS environment variable.
#   The per-group version to store resources in. Specified in the format
#   "group1/version1,group2/version2,...". In the case where objects are
#   moved from one group to the other, you may specify the format
#   "group1=group2/v1beta1,group3/v1beta1,...".
#   ** Defaults to "authorization.k8s.io/v1beta1,autoscaling/v1,batch/v1,componentconfig/v1alpha1,extensions/v1beta1,metrics/v1alpha1,v1"
#
# [*apisrv_tls_cert_file*]
#   File containing x509 Certificate for HTTPS. (CA cert, if any,
#   concatenated after server cert). If HTTPS serving is enabled,
#   and --tls-cert-file and --tls-private-key-file are not provided,
#   a self-signed certificate and key are generated for the
#   public address and saved to /var/run/kubernetes.
#   ** Defaults to none
#
# [*apisrv_tls_private_key_file*]
#   File containing x509 private key matching --tls-cert-file.
#   ** Defaults to none
#
# [*apisrv_token_auth_file*]
#   If set, the file that will be used to secure the secure port
#   of the API server via token authentication.
#   ** Defaults to none
#
# [*apisrv_v*]
#   Log level for V logs
#   ** Defaults to 0
#
# [*apisrv_vmodule*]
#   Comma-separated list of pattern=N settings for file-filtered logging
#   ** Defaults to none
#
# [*apisrv_watch_cache*]
#   Enable watch caching in the apiserver
#   ** Defaults to true
#
# [*apisrv_watch_cache_sizes*]
#   List of watch cache sizes for every resource (pods, nodes, etc.),
#   comma separated. The individual override format: resource#size, where
#   size is a number. It takes effect when watch-cache is enabled.
#   ** Defaults to none
#
# [*apisrv_extra_args*]
#   Extra arguments for kubelet daemon.
#   ** Defaults to non
#
class kubernetes::master::apiserver (
  $apisrv_service_ensure                    = $kubernetes::master::params::apisrv_service_ensure,
  $apisrv_service_enable                    = $kubernetes::master::params::apisrv_service_enable,
  $apisrv_admission_control                 = $kubernetes::master::params::apisrv_admission_control,
  $apisrv_admission_control_config_file     = $kubernetes::master::params::apisrv_admission_control_config_file,
  $apisrv_advertise_address                 = $kubernetes::master::params::apisrv_advertise_address,
  $apisrv_allow_privileged                  = $kubernetes::master::params::apisrv_allow_privileged,
  $apisrv_alsologtostderr                   = $kubernetes::master::params::apisrv_alsologtostderr,
  $apisrv_authorization_mode                = $kubernetes::master::params::apisrv_authorization_mode,
  $apisrv_count                             = $kubernetes::master::params::apisrv_count,
  $apisrv_authorization_policy_file         = $kubernetes::master::params::apisrv_authorization_policy_file,
  $apisrv_authorization_webhook_config_file = $kubernetes::master::params::apisrv_authorization_webhook_config_file,
  $apisrv_basic_auth_file                   = $kubernetes::master::params::apisrv_basic_auth_file,
  $apisrv_bind_address                      = $kubernetes::master::params::apisrv_bind_address,
  $apisrv_cert_dir                          = $kubernetes::master::params::apisrv_cert_dir,
  $apisrv_client_ca_file                    = $kubernetes::master::params::apisrv_client_ca_file,
  $apisrv_cloud_config                      = $kubernetes::master::params::apisrv_cloud_config,
  $apisrv_cloud_provider                    = $kubernetes::master::params::apisrv_cloud_provider,
  $apisrv_cors_allowed_origins              = $kubernetes::master::params::apisrv_cors_allowed_origins,
  $apisrv_delete_collection_workers         = $kubernetes::master::params::apisrv_delete_collection_workers,
  $apisrv_etcd_cafile                       = $kubernetes::master::params::apisrv_etcd_cafile,
  $apisrv_etcd_certfile                     = $kubernetes::master::params::apisrv_etcd_certfile,
  $apisrv_etcd_keyfile                      = $kubernetes::master::params::apisrv_etcd_keyfile,
  $apisrv_etcd_prefix                       = $kubernetes::master::params::apisrv_etcd_prefix,
  $apisrv_etcd_quorum_read                  = $kubernetes::master::params::apisrv_etcd_quorum_read,
  $apisrv_etcd_servers                      = $kubernetes::master::params::apisrv_etcd_servers,
  $apisrv_etcd_servers_overrides            = $kubernetes::master::params::apisrv_etcd_servers_overrides,
  $apisrv_event_ttl                         = $kubernetes::master::params::apisrv_event_ttl,
  $apisrv_experimental_keystone_url         = $kubernetes::master::params::apisrv_experimental_keystone_url,
  $apisrv_external_hostname                 = $kubernetes::master::params::apisrv_external_hostname,
  $apisrv_httptest_serve                    = $kubernetes::master::params::apisrv_httptest_serve,
  $apisrv_insecure_bind_address             = $kubernetes::master::params::apisrv_insecure_bind_address,
  $apisrv_insecure_port                     = $kubernetes::master::params::apisrv_insecure_port,
  $apisrv_ir_data_source                    = $kubernetes::master::params::apisrv_ir_data_source,
  $apisrv_ir_dbname                         = $kubernetes::master::params::apisrv_ir_dbname,
  $apisrv_ir_hawkular                       = $kubernetes::master::params::apisrv_ir_hawkular,
  $apisrv_ir_influxdb_host                  = $kubernetes::master::params::apisrv_ir_influxdb_host,
  $apisrv_ir_namespace_only                 = $kubernetes::master::params::apisrv_ir_namespace_only,
  $apisrv_ir_password                       = $kubernetes::master::params::apisrv_ir_password,
  $apisrv_ir_percentile                     = $kubernetes::master::params::apisrv_ir_percentile,
  $apisrv_ir_user                           = $kubernetes::master::params::apisrv_ir_user,
  $apisrv_kubelet_certificate_authority     = $kubernetes::master::params::apisrv_kubelet_certificate_authority,
  $apisrv_kubelet_client_certificate        = $kubernetes::master::params::apisrv_kubelet_client_certificate,
  $apisrv_kubelet_client_key                = $kubernetes::master::params::apisrv_kubelet_client_key,
  $apisrv_kubelet_https                     = $kubernetes::master::params::apisrv_kubelet_https,
  $apisrv_kubelet_timeout                   = $kubernetes::master::params::apisrv_kubelet_timeout,
  $apisrv_kubernetes_service_node_port      = $kubernetes::master::params::apisrv_kubernetes_service_node_port,
  $apisrv_log_backtrace_at                  = $kubernetes::master::params::apisrv_log_backtrace_at,
  $apisrv_log_dir                           = $kubernetes::master::params::apisrv_log_dir,
  $apisrv_log_flush_frequency               = $kubernetes::master::params::apisrv_log_flush_frequency,
  $apisrv_logtostderr                       = $kubernetes::master::params::apisrv_logtostderr,
  $apisrv_long_running_request_regexp       = $kubernetes::master::params::apisrv_long_running_request_regexp,
  $apisrv_master_service_namespace          = $kubernetes::master::params::apisrv_master_service_namespace,
  $apisrv_max_connection_bytes_per_sec      = $kubernetes::master::params::apisrv_max_connection_bytes_per_sec,
  $apisrv_max_requests_inflight             = $kubernetes::master::params::apisrv_max_requests_inflight,
  $apisrv_min_reques_timeout                = $kubernetes::master::params::apisrv_min_reques_timeout,
  $apisrv_oidc_ca_file                      = $kubernetes::master::params::apisrv_oidc_ca_file,
  $apisrv_oidc_client_id                    = $kubernetes::master::params::apisrv_oidc_client_id,
  $apisrv_oidc_groups_claim                 = $kubernetes::master::params::apisrv_oidc_groups_claim,
  $apisrv_oidc_issuer_url                   = $kubernetes::master::params::apisrv_oidc_issuer_url,
  $apisrv_oidc_username_claim               = $kubernetes::master::params::apisrv_oidc_username_claim,
  $apisrv_profiling                         = $kubernetes::master::params::apisrv_profiling,
  $apisrv_repair_malformed_updates          = $kubernetes::master::params::apisrv_repair_malformed_updates,
  $apisrv_runtime_config                    = $kubernetes::master::params::apisrv_runtime_config,
  $apisrv_secure_port                       = $kubernetes::master::params::apisrv_secure_port,
  $apisrv_service_account_key_file          = $kubernetes::master::params::apisrv_service_account_key_file,
  $apisrv_service_account_lookup            = $kubernetes::master::params::apisrv_service_account_lookup,
  $apisrv_service_cluster_ip_range          = $kubernetes::master::params::apisrv_service_cluster_ip_range,
  $apisrv_service_node_port_range           = $kubernetes::master::params::apisrv_service_node_port_range,
  $apisrv_ssh_keyfile                       = $kubernetes::master::params::apisrv_ssh_keyfile,
  $apisrv_ssh_user                          = $kubernetes::master::params::apisrv_ssh_user,
  $apisrv_stderrthreshold                   = $kubernetes::master::params::apisrv_stderrthreshold,
  $apisrv_storage_versions                  = $kubernetes::master::params::apisrv_storage_versions,
  $apisrv_tls_cert_file                     = $kubernetes::master::params::apisrv_tls_cert_file,
  $apisrv_tls_private_key_file              = $kubernetes::master::params::apisrv_tls_private_key_file,
  $apisrv_token_auth_file                   = $kubernetes::master::params::apisrv_token_auth_file,
  $apisrv_v                                 = $kubernetes::master::params::apisrv_v,
  $apisrv_vmodule                           = $kubernetes::master::params::apisrv_vmodule,
  $apisrv_watch_cache                       = $kubernetes::master::params::apisrv_watch_cache,
  $apisrv_watch_cache_sizes                 = $kubernetes::master::params::apisrv_watch_cache_sizes,
  $apisrv_extra_args                        = $kubernetes::master::params::apisrv_extra_args,
) inherits kubernetes::master::params {

  file { '/etc/kubernetes/apiserver':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/kubernetes/master/apiserver.erb"),
  } ~> Service['kube-apiserver']

}
