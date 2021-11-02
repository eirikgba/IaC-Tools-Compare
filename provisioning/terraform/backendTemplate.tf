# This is a template.
# Users must fill in their credentials.


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
  user_name   = "" #Service brukernavn
  tenant_name = "" #prosjekt navn
  password    = ""                            
  auth_url    = "https://api.skyhigh.iik.ntnu.no:5000"
  region      = "SkyHiGh"
}



