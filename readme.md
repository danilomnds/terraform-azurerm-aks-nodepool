# Module - AKS node pool
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the AKS node pool creation.

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.3.6            | 3.37.0          |
| v2.0.0         | v1.12.2           | 4.40.0          |
| v2.1.0         | v1.15.8           | 4.81.0          |

## Release Notes

| Module Version | Note | 
|----------------|------|
| v1.0.0         | Initial Version |
| v2.0.0         | update to support azurerm 4.40.0, rename of variables for standardization |
| v2.1.0         | update to support azurerm 4.81.0 and Terraform 1.15.8; removed deprecated kubelet setting and fixed nodepool mappings |

## Specifying a version

To avoid that your code get updates automatically, is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can define the version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Important considerations

### [locals.tf](locals.tf)

You can update the locals.tf following this consideration:

- You can define your own default tags

### [variables.tf](variables.tf)

You can edit this file in order to reflect your patterns. 

## Use case
```hcl
module "npuser1" {
  source = "git::https://github.com/danilomnds/terraform-azurerm-aks-nodepool?ref=v2.1.0"
  name     = "<node pool name>"  
  kubernetes_cluster_id = "<kubernetes_cluster_id>"
  vnet_subnet_id = <subnet id>
  vm_size  = "<node pool shape>"
  min_count = 2
  max_count = 6
  os_disk_size_gb = 64  
  tags     = {
    area = "infrastructure"
  }
}
output "node_id" {
  value = module.npuser1.id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | node pool name | `string` | n/a | `Yes` |
| kubernetes_cluster_id | AKS cluster id where the node pool will be added | `string` | n/a | `Yes` |
| vm_size | node pool shape | `string` | n/a | `Yes` |
| capacity_reservation_group_id |  specifies the id of the capacity reservation group where this node pool should exist | `string` | n/a | No |
| auto_scaling_enabled | enables the node pool autoscaling | `bool` | `true` | No |
| node_count | minimum number of nodes when auto_scaling=true and total number of nodes when autoscaling=false | `number` | `1` | No |
| max_count | maximum number of nodes when autoscaling=true | `number` | `null` | No |
| min_count | minimum number of nodes when autoscaling=true | `number` | `null` | No |
| host_encryption_enabled | should the nodes in this node pool have host encryption enabled | `bool` | `false` | No |
| node_public_ip_enabled | should each node have a public IP address? | `bool` | `false` | No |
| eviction_policy | vmss eviction policy delete or dealocatte | `string` | `null` | No |
| host_group_id | The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from | `string` | `null` | No |
| kubelet_config | block as defined in the official documentation | `object(map(string))` | n/a | No |
| linux_os_config | block as defined in the official documentation | `object(map(string))` | n/a | No |
| fips_enabled | should the nodes in this node pool have federal information processing standard enabled | `bool` | `false` | No |
| gpu_instance | specifies the gpu mig instance profile for supported gpu vm sku | `string` | n/a | No |
| gpu_driver | Specifies whether to install the GPU Driver for the nodes | `string` | n/a | No |
| kubelet_disk_type | type of disk used by kubelet | `string` | `OS` | No |
| max_pods | maximum number of pods of a node | `number` | `110` | No |
| mode | node pool mode user or system | `string` | `User` | No |
| node_network_profile | block as defined in the official documentation | `object(map(string))` | n/a | No |
| node_labels | define node pool labels | `map(string)` | `{}` | No |
| node_public_ip_prefix_id | resource id for the public ip addresses prefix for the nodes in this node pool | `string` | n/a | No |
| node_taints | list of Kubernetes taints which should be applied to nodes in the agent pool | `list(string)` | `[]` | No |
| orchestrator_version | kubernetes version | `string` | `latest recommended version` | No |
| os_disk_size_gb | sizing of the operating system disk | `number` | n/a | `Yes` |
| os_disk_type | type of the operating system disk | `string` | `Managed` | No |
| pod_subnet_id | the id of the subnet where the pods in the node pool should exist | `string` | n/a | No |
| os_sku | node pool operating system | `String` | `Ubuntu` | No |
| os_type | node pool OS type | `String` | `Linux` | No |
| priority | the priority for virtual machines within the virtual machine scale set that powers this node pool | `string` | n/a | No |
| proximity_placement_group_id | the id of the proximity placement group where the virtual machine scale set that powers this node pool will be placed | `string` | n/a | No |
| spot_max_price | the maximum price you're willing to pay in usd per virtual machine | `string` | n/a | No |
| snapshot_id | the id of the snapshot which should be used to create this node pool | `string` | n/a | No |
| tags | tags for the node pool | `map(string)` | `{}` | No |
| scale_down_mode | specifies how the node pool should deal with scaled-down nodes | `String` | `Delete` | No |
| temporary_name_for_rotation | specifies the name of the temporary node pool used to cycle the node pool when one of the relevant properties are updated | `string` | n/a | No |
| ultra_ssd_enabled | used to specify whether the UltraSSD is enabled in the node pool. | `bool` | `false` | No |
| upgrade_settings | block as defined in the official documentation | `object(map(string))` | n/a | No |
| vnet_subnet_id | the id of the subnet where this node pool should exist | `string` | n/a | No |
| windows_profile | block as defined in the official documentation | `object(map(string))` | n/a | No |
| workload_runtime | used to specify the workload runtime | `string` | n/a | No |
| zones | define which zones will be used | `list()` | `["1","2","3"]` | No |

## Output variables

| Name | Description |
|------|-------------|
| id | node pool id |

## Documentation

Terraform AKS Node Pool: [https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) <br>
Eviction Policy: [https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/use-spot#eviction-policy](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/use-spot#eviction-policy)