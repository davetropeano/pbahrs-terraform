#Define the providers to use
provider "ibm" {
  softlayer_username = "${var.classicIaaS_username}"
  softlayer_api_key = "${var.classicIaaS_apikey}"
}
