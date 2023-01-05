variable "poolname" {
  type = string
}
variable "cluster_id" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "auto_scaling" {
  type    = bool
  default = true
}
variable "node_count" {
  type    = string
  default = 1
}
variable "enable_node_public_ip" {
  type    = bool
  default = false
}
variable "host_encryption" {
  type    = bool
  default = false
}
variable "eviction_policy" {
  type    = string
  default = null
}
variable "mode" {
  type    = string
  default = "User"
}
variable "fips_enabled" {
  type    = bool
  default = false
}
variable "zones" {
  type    = list(string)
  default = ["1", "2", "3"]
}
variable "kubelet_disk_type" {
  type    = string
  default = "OS"
}
variable "max_count" {
  type    = number
  default = null
}
variable "min_count" {
  type    = number
  default = null
}
variable "max_pods" {
  type    = number
  default = 110
}
variable "labels" {
  type    = map(string)
  default = {}
}
variable "taints" {
  type    = list(string)
  default = []
}
variable "orchestrator_version" {
  type    = string
  default = null
}
variable "os_disk_type" {
  type    = string
  default = "Managed"
}
variable "os_disk_size_gb" {
  type = string
}
variable "os_sku" {
  type    = string
  default = "Ubuntu"
}
variable "os_type" {
  type    = string
  default = "Linux"
}
variable "scale_down_mode" {
  type    = string
  default = "Delete"
}
variable "ultra_ssd_enabled" {
  type    = string
  default = null
}
variable "subnet_id" {
  type = string
}
variable "upgrade_settings" {
  type    = map(string)
  default = {}
}
variable "kubelet_config" {
  type    = any
  default = {}
}
variable "linux_os_config" {
  type    = any
  default = {}
}
variable "tags" {
  type    = map(string)
  default = {}
}