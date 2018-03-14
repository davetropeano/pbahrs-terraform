#Create multiple VMs
resource "ibm_compute_vm_instance" "burst_vm_instances" {
  count = "${var.vm_count}"
  os_reference_code = "${var.osrefcode}"
  hostname = "${format("THINKburst-%02d", count.index + 1)}"
  domain = "${var.domain}"
  datacenter = "${var.datacenter}"
#  file_storage_ids = ["${ibm_storage_file.Think_burst.id}"]
  network_speed = 10
  cores = 1
  memory = 1024
  disks = [25, 10]
#  ssh_key_ids = ["${ibm_compute_ssh_key.ssh_key.id}"]
  local_disk = false
  private_vlan_id = "${var.privatevlanid}"
  public_vlan_id = "${var.publicvlanid}"
}
