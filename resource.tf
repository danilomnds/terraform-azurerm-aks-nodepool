resource "azurerm_kubernetes_cluster_node_pool" "nodepool" {
  name                   = var.poolname
  kubernetes_cluster_id  = var.cluster_id
  vm_size                = var.vm_size
  node_count             = var.auto_scaling == true ? null : var.node_count
  enable_node_public_ip  = var.enable_node_public_ip
  enable_auto_scaling    = var.auto_scaling
  enable_host_encryption = var.host_encryption
  eviction_policy        = var.eviction_policy
  fips_enabled           = var.fips_enabled
  zones                  = var.zones
  kubelet_disk_type      = var.kubelet_disk_type
  max_count              = var.max_count
  min_count              = var.min_count
  max_pods               = var.max_pods
  mode                   = var.mode
  node_labels            = var.labels
  node_taints            = var.taints
  orchestrator_version   = var.orchestrator_version
  os_disk_size_gb        = var.os_disk_size_gb
  os_disk_type           = var.os_disk_type
  os_sku                 = var.os_sku
  os_type                = var.os_type
  scale_down_mode        = var.scale_down_mode
  ultra_ssd_enabled      = var.ultra_ssd_enabled
  vnet_subnet_id         = var.subnet_id
  dynamic "upgrade_settings" {
    for_each = var.upgrade_settings
    iterator = updgrade
    content {
      max_surge = updgrade.value
    }
  }
  dynamic "kubelet_config" {
    for_each = var.kubelet_config
    iterator = kubelet
    content {
      allowed_unsafe_sysctls    = lookup(kubelet.value, "allowed_unsafe_sysctls", [])
      container_log_max_line    = lookup(kubelet.value, "container_log_max_line", null)
      container_log_max_size_mb = lookup(kubelet.value, "container_log_max_size_mb", null)
      cpu_cfs_quota_enabled     = lookup(kubelet.value, "cpu_cfs_quota_enabled", null)
      cpu_cfs_quota_period      = lookup(kubelet.value, "cpu_cfs_quota_period", null)
      cpu_manager_policy        = lookup(kubelet.value, "cpu_manager_policy", null)
      image_gc_high_threshold   = lookup(kubelet.value, "image_gc_high_threshold", null)
      image_gc_low_threshold    = lookup(kubelet.value, "image_gc_low_threshold", null)
      pod_max_pid               = lookup(kubelet.value, "pod_max_pid", null)
      topology_manager_policy   = lookup(kubelet.value, "topology_manager_policy", null)
    }
  }
  dynamic "linux_os_config" {
    for_each = var.kubelet_config
    iterator = os_config
    content {
      swap_file_size_mb             = lookup(os_config.value, "swap_file_size_mb", null)
      transparent_huge_page_defrag  = lookup(os_config.value, "transparent_huge_page_defrag", null)
      transparent_huge_page_enabled = lookup(os_config.value, "transparent_huge_page_enabled", null)
      sysctl_config {
        fs_aio_max_nr                      = lookup(os_config.value, "fs_aio_max_nr", null)
        fs_file_max                        = lookup(os_config.value, "fs_file_max", null)
        fs_inotify_max_user_watches        = lookup(os_config.value, "fs_inotify_max_user_watches", null)
        fs_nr_open                         = lookup(os_config.value, "fs_nr_open", null)
        kernel_threads_max                 = lookup(os_config.value, "kernel_threads_max", null)
        net_core_netdev_max_backlog        = lookup(os_config.value, "net_core_netdev_max_backlog", null)
        net_core_optmem_max                = lookup(os_config.value, "net_core_optmem_max", null)
        net_core_rmem_default              = lookup(os_config.value, "net_core_rmem_default", null)
        net_core_rmem_max                  = lookup(os_config.value, "net_core_rmem_max", null)
        net_core_somaxconn                 = lookup(os_config.value, "net_core_somaxconn", null)
        net_core_wmem_default              = lookup(os_config.value, "net_core_wmem_default", null)
        net_core_wmem_max                  = lookup(os_config.value, "net_core_wmem_max", null)
        net_ipv4_ip_local_port_range_max   = lookup(os_config.value, "net_ipv4_ip_local_port_range_max", null)
        net_ipv4_ip_local_port_range_min   = lookup(os_config.value, "net_ipv4_ip_local_port_range_min", null)
        net_ipv4_neigh_default_gc_thresh1  = lookup(os_config.value, "net_ipv4_neigh_default_gc_thresh1", null)
        net_ipv4_neigh_default_gc_thresh2  = lookup(os_config.value, "net_ipv4_neigh_default_gc_thresh2", null)
        net_ipv4_neigh_default_gc_thresh3  = lookup(os_config.value, "net_ipv4_neigh_default_gc_thresh3", null)
        net_ipv4_tcp_fin_timeout           = lookup(os_config.value, "net_ipv4_tcp_fin_timeout", null)
        net_ipv4_tcp_keepalive_intvl       = lookup(os_config.value, "net_ipv4_tcp_keepalive_intvl", null)
        net_ipv4_tcp_keepalive_probes      = lookup(os_config.value, "net_ipv4_tcp_keepalive_probes", null)
        net_ipv4_tcp_keepalive_time        = lookup(os_config.value, "net_ipv4_tcp_keepalive_time", null)
        net_ipv4_tcp_max_syn_backlog       = lookup(os_config.value, "net_ipv4_tcp_max_syn_backlog", null)
        net_ipv4_tcp_max_tw_buckets        = lookup(os_config.value, "net_ipv4_tcp_max_tw_buckets", null)
        net_ipv4_tcp_tw_reuse              = lookup(os_config.value, "net_ipv4_tcp_tw_reuse", null)
        net_netfilter_nf_conntrack_buckets = lookup(os_config.value, "net_netfilter_nf_conntrack_buckets", null)
        net_netfilter_nf_conntrack_max     = lookup(os_config.value, "net_netfilter_nf_conntrack_max", null)
        vm_max_map_count                   = lookup(os_config.value, "vm_max_map_count", null)
        vm_swappiness                      = lookup(os_config.value, "vm_swappiness", null)
        vm_vfs_cache_pressure              = lookup(os_config.value, "vm_vfs_cache_pressure", null)
      }
    }
  }
  tags = merge(local.tags, var.tags)
  lifecycle {
    ignore_changes = [
      tags["create_date"], node_count
    ]
  }
}