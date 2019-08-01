#Define variables
variable userids {
  description = "unique student id"
  default = "student1"
}

variable "softlayer_username" {
}

variable "softlayer_api_key" {
}

variable "ibmcloud_api_key" {
}

variable ssh_key {
  default = ""
}
################################
# Do not change the variables below
################################
variable privatevlanid {
  description = "private VLAN"
  default = "2259665"
}
variable publicvlanid {
  description = "public VLAN"
  default = "2279413"
}


variable ssh_label {
  description = "ssh label"
  default = "testkey"
}

variable ssh_notes {
  description = "ssh public key notes"
  default = "This is an ssh public key"
}
variable osrefcode {
  description = "operating system reference code for VMs"
  default = "DEBIAN_8_64"
}
variable datacenter {
  description = "location to deploy"
  default = "dal09"
}
variable domain {
  description = "domain of the VMs"
  default = "domain goes herem"
}
variable vm_count {
  description = "number of VMs"
  default = "1"
}
