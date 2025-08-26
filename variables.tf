variable "name" {
  type = string
}

variable "kubernetes_cluster_id" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "capacity_reservation_group_id" {
  type    = string
  default = null
}

variable "auto_scaling_enabled" {
  type    = bool
  default = true
}

variable "host_encryption_enabled" {
  type    = bool
  default = null
}

variable "node_public_ip_enabled" {
  type    = bool
  default = false
}

variable "eviction_policy" {
  type    = string
  default = null
}

variable "host_group_id" {
  type    = string
  default = null
}

variable "kubelet_config" {
  type = object({
    allowed_unsafe_sysctls    = optional(list(string))
    container_log_max_line    = optional(number)
    container_log_max_size_mb = optional(number)
    cpu_cfs_quota_enabled     = optional(bool)
    cpu_cfs_quota_period      = optional(string)
    cpu_manager_policy        = optional(string)
    image_gc_high_threshold   = optional(number)
    image_gc_low_threshold    = optional(number)
    pod_max_pid               = optional(number)
    topology_manager_policy   = optional(string)
  })
  default = null
}

variable "linux_os_config" {
  type = object({
    swap_file_size_mb             = optional(number)
    transparent_huge_page_defrag  = optional(string)
    transparent_huge_page_enabled = optional(string)
    sysctl_config = optional(object({
      fs_aio_max_nr                      = optional(number)
      fs_file_max                        = optional(number)
      fs_inotify_max_user_watches        = optional(number)
      fs_nr_open                         = optional(number)
      kernel_threads_max                 = optional(number)
      net_core_netdev_max_backlog        = optional(number)
      net_core_optmem_max                = optional(number)
      net_core_rmem_default              = optional(number)
      net_core_rmem_max                  = optional(number)
      net_core_somaxconn                 = optional(number)
      net_core_wmem_default              = optional(number)
      net_core_wmem_max                  = optional(number)
      net_ipv4_ip_local_port_range_max   = optional(number)
      net_ipv4_ip_local_port_range_min   = optional(number)
      net_ipv4_neigh_default_gc_thresh1  = optional(number)
      net_ipv4_neigh_default_gc_thresh2  = optional(number)
      net_ipv4_neigh_default_gc_thresh3  = optional(number)
      net_ipv4_tcp_fin_timeout           = optional(number)
      net_ipv4_tcp_keepalive_intvl       = optional(number)
      net_ipv4_tcp_keepalive_probes      = optional(number)
      net_ipv4_tcp_keepalive_time        = optional(number)
      net_ipv4_tcp_max_syn_backlog       = optional(number)
      net_ipv4_tcp_max_tw_buckets        = optional(number)
      net_ipv4_tcp_tw_reuse              = optional(bool)
      net_netfilter_nf_conntrack_buckets = optional(number)
      net_netfilter_nf_conntrack_max     = optional(number)
      vm_max_map_count                   = optional(number)
      vm_swappiness                      = optional(number)
      vm_vfs_cache_pressure              = optional(number)
    }))
  })
  default = null
}

variable "fips_enabled" {
  type    = bool
  default = false
}

variable "gpu_instance" {
  type    = string
  default = null
}

variable "gpu_driver" {
  type    = string
  default = null
}

variable "kubelet_disk_type" {
  type    = string
  default = null
}

variable "max_pods" {
  type    = number
  default = 110
}

variable "mode" {
  type    = string
  default = "User"
}

variable "node_network_profile" {
  type = object({
    allowed_host_ports = optional(object({
      port_start = optional(number)
      port_end   = optional(number)
      protocol   = optional(string)
    }))
    application_security_group_ids = optional(list(string))
    node_public_ip_tags            = optional(map(string))
  })
  default = null
}

variable "node_labels" {
  type    = map(string)
  default = {}
}

variable "node_public_ip_prefix_id" {
  type    = string
  default = null
}

variable "node_taints" {
  type    = list(string)
  default = null
}

variable "orchestrator_version" {
  type    = string
  default = null
}

variable "os_disk_size_gb" {
  type    = number
  default = null
}

variable "os_disk_type" {
  type    = string
  default = "Managed"
}

variable "pod_subnet_id" {
  type    = string
  default = null
}

variable "os_sku" {
  type    = string
  default = "Ubuntu"
}

variable "os_type" {
  type    = string
  default = "Linux"
}

variable "priority" {
  type    = string
  default = "Regular"
}

variable "proximity_placement_group_id" {
  type    = string
  default = null
}

variable "spot_max_price" {
  type    = string
  default = null
}

variable "snapshot_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "scale_down_mode" {
  type    = string
  default = "Delete"
}

variable "temporary_name_for_rotation" {
  type    = string
  default = null
}

variable "ultra_ssd_enabled" {
  type    = bool
  default = false
}

variable "upgrade_settings" {
  type = object({
    drain_timeout_in_minutes      = optional(number)
    node_soak_duration_in_minutes = optional(number)
    max_surge                     = string
  })
  default = null
}

variable "vnet_subnet_id" {
  type    = string
  default = null
}

variable "windows_profile" {
  type = object({
    outbound_nat_enabled = optional(bool)
  })
  default = null
}

variable "workload_runtime" {
  type    = string
  default = null
}

variable "zones" {
  type    = list(any)
  default = [1, 2, 3]
}

variable "node_count" {
  type    = string
  default = 1
}

variable "max_count" {
  type    = number
  default = null
}

variable "min_count" {
  type    = number
  default = null
}