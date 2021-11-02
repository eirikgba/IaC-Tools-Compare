resource "openstack_compute_keypair_v2" "id_rsa" {
    name = "id_rsa"
    public_key = "${file("/mnt/c/Users/korg/.ssh/id_rsa.pub")}"
}

resource "openstack_compute_instance_v2" "Instance" {
    count = var.instance_num
    name = format("%s-%02d", var.instance_name, count.index+1)
    image_name = "Ubuntu Server 20.04 LTS (Focal Fossa) amd64"
    flavor_name = "m1.small"
    security_groups = ["default"]
    key_pair = "${openstack_compute_keypair_v2.id_rsa.name}"
#    user_data = file("init.sh")
}

resource "openstack_compute_floatingip_v2" "fip" {
  count = var.instance_num
  pool = "ntnu-internal"
}

resource "openstack_compute_floatingip_associate_v2" "fip" {
  count = var.instance_num
  floating_ip = element(openstack_compute_floatingip_v2.fip.*.address, count.index)
  instance_id = element(openstack_compute_instance_v2.Instance.*.id, count.index)
  depends_on  = [openstack_compute_instance_v2.Instance]
}

output "instance_ips" {
    value = {
        for instance in openstack_compute_instance_v2.Instance:
         instance.name => instance.access_ip_v4
    }
}

output "float_ips" {
    value = {
        for fip in openstack_compute_floatingip_v2.fip:
            fip.fixed_ip => fip.address
    }
}
