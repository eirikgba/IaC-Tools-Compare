variable "instance_name" {
    description = "The Instance Name to be used."
    default  = "terraform"
}

variable "instance_num" {
    description = "The Number of instances to be created."
    default  = "4"
}

variable "image_name" {
    default = "Ubuntu Server 20.04 LTS (Focal Fossa) amd64"
}

variable "flavor_name" {
    default = "m1.small"
}

variable "security_groups" {
    default = ["default"]
}

