#Define the providers to use
provider "ibm" {
  softlayer_username = "${var.slusername}"
  softlayer_api_key = "${var.slapikey}"
}
