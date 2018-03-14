#Create ssh keys for virtual guests
resource "ibm_compute_ssh_key" "ssh_key" {
  label = "${var.user}+"."+${var.ssh_label}"
  notes = "${var.ssh_notes}"
  public_key = "${var.ssh_key}"
}
