# Provisioning 



## **OpenStack Heat**

The Heat template assumes a key pair with the name *id_rsa*

To provision the infrastructure:

```
openstack stack create -t infrastructure.yaml heat
```









## **Terraform**

Add your credentials in a file *terraform/backend.tf:*
This file should be in .gitignore.

```terraform
# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = ""              # Your OpenStack Service Username 
  tenant_name = ""              # The project name 
  password    = ""              # Service user password
  auth_url    = "https://api.skyhigh.iik.ntnu.no:5000"
  region      = "SkyHiGh"
}

```



To provision the infrastructure:

```
# Initialize the OpenStack provider plugin
terraform init

# Plan: See the outcome without actually doing anything 
terraform plan

# Build the infrastructure 
terraform apply
```







