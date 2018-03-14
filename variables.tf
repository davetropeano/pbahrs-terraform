#Define variables
variable userids {
  description = "unique student id"
  default = "student1"
}
variable slapikey {
  description = "sl api key"
  default = ""
}
variable ssh_key {
  description = "ssh public key"
  default = ""
}
variable privatevlanid {
  description = "private VLAN"
  default = "2259665"
}
variable publicvlanid {
  description = "public VLAN"
  default = "2279413"
}
variable slusername {
  description = "sl user name"
  default = "bluecloudint@gmail.com"
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
  default = "mybluemix.com"
}
variable vm_count {
  description = "number of VMs"
  default = "2"
}
