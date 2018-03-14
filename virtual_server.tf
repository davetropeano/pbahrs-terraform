#Create multiple virtual servers on public/private network

resource "ibm_compute_vm_instance" "burst_vm_instances1" {
  count = "${var.vm_count}"
  os_reference_code = "${var.osrefcode}"
  hostname = "${var.userids}-${format("THINKpublicprivate-%02d", count.index + 1)}"
  domain = "${var.domain}"
  datacenter = "${var.datacenter}"
  file_storage_ids = ["${ibm_storage_file.Think_burst.id}"]
  network_speed = 10
  cores = 1
  memory = 1024
  disks = [25, 10]
  ssh_key_ids = ["${ibm_compute_ssh_key.ssh_key.id}"]
  local_disk = false
  private_vlan_id = "${var.privatevlanid}"
  public_vlan_id = "${var.publicvlanid}"
}

#Create multiple VMs in second data center on private network

resource "ibm_compute_vm_instance" "burst_vm_instances2" {
  count = "${var.vm_count}"
  os_reference_code = "${var.osrefcode}"
  hostname = "${var.userids}-${format("THINKprivateonly-%02d", count.index + 1)}"
  domain = "${var.domain}"
  datacenter = "${var.datacenter}"
  file_storage_ids = ["${ibm_storage_file.Think_burst.id}"]
  network_speed = 10
  cores = 1
  memory = 1024
  disks = [25, 10]
  ssh_key_ids = ["${ibm_compute_ssh_key.ssh_key.id}"]
  local_disk = false
  private_vlan_id = "${var.privatevlanid}"
}
