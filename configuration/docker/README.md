# docker

Simple docker puppet module

### install puppet

Master:
```
sudo apt update
curl -O https://apt.puppet.com/puppet-release-focal.deb
sudo apt install ./puppet-release-focal.deb
sudo apt install puppetserver

sudo nano /etc/hosts
	[master-ip] puppetmaster puppet
	[client1-ip] puppetclient1 puppet
	[client2-ip] puppetclient2 puppet

sudo ufw allow 8140/tcp

sudo systemctl start puppetserver.service
sudo systemctl enable puppetserver.service
```

Agent
```
sudo apt update
curl -O https://apt.puppet.com/puppet-release-focal.deb
sudo apt install ./puppet-release-focal.deb
sudo apt update
sudo apt install  puppet-agent

sudo ufw allow 8140/tcp

sudo nano /etc/hosts
	[master-ip] puppetmaster puppet
	[client1-ip] puppetclient1 puppet
	[client2-ip] puppetclient2 puppet

sudo systemctl start puppet
sudo systemctl enable puppet
```

Master
```
sudo /opt/puppetlabs/bin/puppetserver ca list --all
sudo /opt/puppetlabs/bin/puppetserver ca sign --all
```

Agent
for confirming that there is a conection
```
sudo /opt/puppetlabs/bin/puppet agent --test
```

