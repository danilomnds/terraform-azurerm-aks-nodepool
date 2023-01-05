# Module - AKS node pool
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the AKS node pool creation.

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0       | v1.3.6 | 3.37.0         |

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
  source = "git::https://github.com/danilomnds/terraform-azurerm-aks-nodepool?ref=v1.0.0"
  subnet_id = <subnet id>
  poolname     = "<node pool name>"
  # here you can reffer a cluster created using the module https://github.com/danilomnds/terraform-azurerm-aks. Ex: module.<cluster-name>.id
  cluster_id = "<cluster_id>"
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

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| poolname | node pool name | `string` | n/a | `Yes` |
| cluster_id | AKS cluster id where the node pool will be added | `string` | n/a | `Yes` |
| vm_size | node pool shape | `string` | n/a | `Yes` |
| auto_scaling | enables the node pool autoscaling | `bool` | `true` | No |
| node_count | minimum number of nodes when auto_scaling=true and total number of nodes when autoscaling=false | `string` | `1` | No |
| enable_node_public_ip | should each node have a public IP address? | `bool` | `False` | No |
| host_encryption | should the nodes in this node pool have host encryption enabled? | `bool` | `false` | No |
| eviction_policy | vmss eviction policy delete or dealocatte | `string` | `null` | No |
| mode | node pool mode user or system | `string` | `User` | No |
| fips_enabled | should the nodes in this node pool have federal information processing standard enabled | `bool` | `false` | No |
| zones | define which zones will be used | `list()` | `["1","2","3"]` | No |
| kubelet_disk_type | type of disk used by kubelet | `string` | `OS` | No |
| max_count | maximum number of nodes when autoscaling=true | `number` | `null` | No |
| min_count | minimum number of nodes when autoscaling=true | `number` | `null` | No |
| max_pods | maximum number of pods of a node | `number` | `110` | No |
| labels | define node pool labels | `map(string)` | `{}` | No |
| taints | list of Kubernetes taints which should be applied to nodes in the agent pool | `list(string)` | `[]` | No |
| orchestrator_version | kubernetes version | `string` | `latest recommended version` | No |
| os_disk_type | type of the operating system disk | `string` | `Managed` | No |
| os_disk_size_gb | sizing of the operating system disk | `number` | n/a | `Yes` |
| os_sku | node pool operating system | `String` | `Ubuntu` | No |
| os_type | node pool OS type | `String` | `Linux` | No |
| scale_down_mode | specifies how the node pool should deal with scaled-down nodes | `String` | `Delete` | No |
| ultra_ssd_enabled | used to specify whether the UltraSSD is enabled in the node pool. | `bool` | `false` | No |
| subnet_id | subnet id where the nodes will be placed | `string` | n/a | `Yes` |
| upgrade_settings | node pool upgrade settings | `map(string)` | `null` | No |
| kubelet_config | kubelet custom config | `any` | `{}` | No |
| linux_os_config | custom kernel parameters | `any` | `{}` | No |
| tags | tags for the node pool | `map(string)` | `{}` | No |

## Output variables

| Name | Description |
|------|-------------|
| id | node pool id |

## Documentation

Terraform AKS Node Pool: [https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) <br>
Eviction Policy: [https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/use-spot#eviction-policy](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/use-spot#eviction-policy)