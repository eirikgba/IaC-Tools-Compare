# k3s



**"DNS"**

sudo nano /etc/hosts

```bash
10.0.0.50 k3s-master
10.0.0.51 k3s-worker0
10.0.0.52 k3s-worker1
```

**ssh**

```bash
ssh-keygen
ssh-copy-id username@<server_IP>
```



**Docker**

```bash
sudo apt update

sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt update
sudo apt install docker-ce -y

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker ${USER}
newgrp docker

sudo systemctl status docker
```



**Master**

```
curl -sfL https://get.k3s.io | sh -s - --docker

sudo systemctl status k3s

sudo kubectl get nodes -o wide
```

**Firewall, all servers**

```bash
sudo ufw allow 6443/tcp
sudo ufw allow 443/tcp
```

**Get token from master**

```
sudo cat /var/lib/rancher/k3s/server/node-token
```

K10a62e3c1e91a340d14c2eeaabf4d3c59aed376c604a2833b30824818e2540cb5d::server:f5e1b7b8b5ff93a155e16e227dee78e2



**Workers**

```
curl -sfL http://get.k3s.io | K3S_URL=https://<master_IP>:6443 K3S_TOKEN=<join_token> sh -s - --docker

curl -sfL http://get.k3s.io | K3S_URL=https://k3s-master:6443 K3S_TOKEN=K10a62e3c1e91a340d14c2eeaabf4d3c59aed376c604a2833b30824818e2540cb5d::server:f5e1b7b8b5ff93a155e16e227dee78e2 sh -s - --docker
```

**(Terraform)**

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt install terraform

terraform init
```



**Deploy nginx with .yaml**

*nginx-deployment.yaml*

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

**NodePort**

Expose the website outside the kubernetes cluster

*nginx-nodeport.yaml*

```
apiVersion: v1
kind: Service
metadata:
  name: nginx-nodeport
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
      # Optional field
      # By default and for convenience, the Kubernetes control plane will allocate a port from a range (default: 30000-32767)
      nodePort: 30007
```

Nginx is now exposed on oneOfTheNodesIP:30007









k9s ?



































