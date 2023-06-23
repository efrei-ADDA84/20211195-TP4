variable "resource_group" {
  type        = string
  default     = "ADDA84-CTP"
  description = "Ressource group"
}

variable "id" {
  type        = string
  default     = "765266c6-9a23-4638-af32-dd1e32613047"
  description = "Subscription ID"
}

variable "network" {
  type        = string
  default     = "network-tp4"
  description = "Network"
}

variable "subnet" {
  type        = string
  default     = "internal"
  description = "Subnet"
}

variable "location" {
  type        = string
  default     = "france central"
  description = "Ressource group location"
}

variable "vm_name" {
  type        = string
  default     = "devops-20211195"
  description = "Virtual machine name"
}

variable "vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
  description = "Virtual machine size"
}

variable "user_admin" {
  type        = string
  default     = "devops"
  description = "User administrator of the VM"
}

variable "os" {
  type        = string
  default     = "16.04-LTS"
  description = "Os of the VM"
}


