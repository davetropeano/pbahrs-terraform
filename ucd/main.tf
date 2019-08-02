#identfy the ucd provider to use for configuring and deploying content
provider "ucd" {
     username = "${var.ucd_userid}"
     password = "${var.ucd_password}"
     ucd_server_url = "${var.ucd_url}"
 }
 
 #install a UCD agent on each virtual server instance
 #this is a block for the instance #1. Do same for instance #2
 #again count determines the number for each
 #agent naming is similar to hostname convention
 
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
  private_security_group_ids = ["${ibm_security_group.sg2.id}"]
  public_security_group_ids = ["${ibm_security_group.sg1.id}"]
  private_vlan_id = "${var.privatevlanid}"
  public_vlan_id = "${var.publicvlanid}"
  
     connection {
         user = "${var_ssh_key_user}"
         private_key = "${var.private_ssh_key}"
     }

     provisioner "urbancode-deploy" {
         agent_name      = "${var.userids}-${format("THINKpublicprivate-%02d", count.index + 1)}-agent"
         ucd_server_url  = "${var.ucd_url}"
         ucd_user        = "${var.ucd_userid}"
         ucd_password    = "${var.ucd_password}"
     }
 }
 
 #identify the list of agent IDs for all of the installations
 #note you will need to do this for each of the two server types 1,2
 
 output "agent1_ids" {
  value = ["${ucd_agent.agent1.*.id}"]
}
 output "agent2_ids" {
  value = ["${ucd_agent.agent2.*.id}"]
}
 
#create a reouce tree to use in the lab environment. for this lab we will use one resource tree

resource "ucd_resource_tree" "lab_tree" {
    base_resource_group_name = "lab_tree"
 }
 

#add ucd agent to resource tree for this lab we will use one agent for all targets
 
 resource "ucd_agent_mapping" "agent1_resource" {
     count = "${var.vm_count}"
     agent_name = "${var.userids}-${format("THINKpublicprivate-%02d", count.index + 1)}-agent"
     description = "agent to deploy content to the specific server1 vsis"
     parent_id = "${ucd_resource_tree.lab_tree.id}"
 }
 
  resource "ucd_agent_mapping" "agent2_resource" {
     count = "${var.vm_count}"
     agent_name = "${var.userids}-${format("THINKprivate-%02d", count.index + 1)}-agent"
     description = "agent to deploy content to the specific server2 vsis"
     parent_id = "${ucd_resource_tree.lab_tree.id}"
 }
 
 # add a component to the agent in the lab resource tree for content deployed to server 1.
 
 resource "ucd_component_mapping" "server1_resource" {
     count = "${var.vmcount}"
     component = "${var.userids}-${format("THINKpublicprivate-%02d", count.index + 1)}-component"
     description = "app or media deployed to server 1 instances"
     parent_id = "${format("${ucd_agent.agent1.", count.index+1,".id}")}"
 }
 
 resource "ucd_component_mapping" "server2_resource" {
     count = "${var.vmcount}"
     component = "${var.userids}-${format("THINKprivate-%02d", count.index + 1)}-component"
     description = "app or media deployed to server 2 instances"
     parent_id = "${format("${ucd_agent.agent2.", count.index+1,".id}")}"
 }
 
 #add the new environment deployed by the other terraform files
 #notes: the lab_application is pre-existing and you should use the lab resource tree
 
 resource "ucd_environment" "lab_environment" {
    name = "lab_environment"
    application = "lab_application"
    base_resource_group ="${ucd_resource_tree.lab_tree.id}"
 }

 
 #Now deploy the content to each of the servers in the new environment based on the 
 #configuration above. This example deploys a single component to each server
 
 resource "ucd_application_process_request" "application_process_request" {
     application = "lab_application"
     application_process = "install"
     environment = "${ucd_environment.environment.name}"
     snapshot = "snapshot_v1"
 }
