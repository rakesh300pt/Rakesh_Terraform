variable "rg_name" {
  default = "Rakesh_terraform_rg"
}

variable "location" {
  default = "centralindia"
}

variable "address_space" {
  default = ["10.1.0.0/16"]
  type    = list(string)
}
variable "vnet_name" {
  default = "R_terraform_VM"
}

variable "subnet_name" {
  default = "R_terraform_snet"
}

variable "subnet_space" {
  default = ["10.1.0.0/24", "10.1.10.0/24"]
  type    = list(string)
}

variable "key" {
  default = "ssh_key"
}

variable "nic_name" {
  default = "nic2"
}
variable "nic3_name" {
  default = "nic3"
}

variable "ip_name" {
  default = "ip"
}
variable "pip_name" {
  default = "pip"
}
variable "pip1_name" {
  default = "pip1"
}


variable "vm_name" {
  default = "LinuxVM"

}
variable "winvm_name" {
  default = "WindowsVM"

}

variable "admin" {
  default = "azureuser"

}

variable "size" {
  default = "Standard_B1s"
}
variable "user" {
  default = "azureuser"
}

variable "nsg" {
  default = "nsg"
}

