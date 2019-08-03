variable "softlayer_username" {
    description="IaaS username"
}

variable "softlayer_api_key" {
    description="IaaS API Key"
}

provider "ibm" {
    softlayer_username = "${var.softlayer_username}"	
    softlayer_api_key  = "${var.softlayer_api_key}"
}
