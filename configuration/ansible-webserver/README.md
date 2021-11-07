# Setup NGINX with ansible

install ansible:
```
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

clone repo

first change the ip under /env/hosts

Run the playbok in this directory:
ansible-playbook -i env/hosts site.yaml
