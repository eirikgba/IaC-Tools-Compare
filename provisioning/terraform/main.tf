

resource "openstack_networking_router_v2" "router_1" {
  name                = "my_router"
  admin_state_up      = true
  external_network_id = "730cb16e-a460-4a87-8c73-50a2cb2293f9"
}

resource "openstack_networking_network_v2" "network_1" {
  name           = "network_1"
  admin_state_up = "true"
}


resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = "${openstack_networking_network_v2.network_1.id}"
  cidr       = "192.168.10.0/24"
  ip_version = 4
}


resource "openstack_compute_keypair_v2" "id_rsa" {
    name = "id_rsa"
    public_key = "${file("/mnt/c/Users/korg/.ssh/id_rsa.pub")}"
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = "${openstack_networking_router_v2.router_1.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"
}

resource "openstack_compute_instance_v2" "Instance" {
    depends_on = [openstack_networking_subnet_v2.subnet_1]
    count = var.instance_num
    name = format("%s-%02d", var.instance_name, count.index+1)
    image_name = "Ubuntu Server 20.04 LTS (Focal Fossa) amd64"
    flavor_name = "m1.small"
    security_groups = ["default"]
    key_pair = "${openstack_compute_keypair_v2.id_rsa.name}"
#    user_data = file("init.sh")
    network {
      name = "network_1"
  }
}

resource "openstack_compute_floatingip_v2" "fip" {
  count = var.instance_num
  pool = "ntnu-internal"
}

resource "openstack_compute_floatingip_associate_v2" "fip" {
  count = var.instance_num
  floating_ip = element(openstack_compute_floatingip_v2.fip.*.address, count.index)
  instance_id = element(openstack_compute_instance_v2.Instance.*.id, count.index)
}
