#Define variables

variable privatevlanid {
  description = "private VLAN"
  default = "2260653"
}
variable publicvlanid {
  description = "public VLAN"
  default = "2279135"
}
variable slusername {
  description = "sl user name"
  default = "bluecloudint@gmail.com"
}
variable slapikey {
  description = "sl api key"
  default = ""
}
variable ssh_label {
  description = "ssh label"
  default = "testkey"
}
variable ssh_key {
  description = "ssh public key"
  default = ""
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
  default = "mybluemix.com"
}
variable vm_count {
  description = "number of VMs"
  default = "2"
}
