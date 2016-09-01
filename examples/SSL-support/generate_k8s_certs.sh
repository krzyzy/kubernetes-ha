#!/bin/bash
###################
### Configuration:
###################
# FQDN for loadbalancer?
MASTER_DNS_NAME="k8s1.example.com"
# IP address k8s master in flanneld network
K8S_SERVICE_IP="10.1.0.1"
# FQDN for k8s master
MASTER_HOST="192.168.0.10"
# IP for k8s master
MASTER_IP="192.168.0.10"
# LB IP address
MASTER_LOADBALANCER_IP="192.168.0.15"
# Kubernetes nodes:
WORKERS="k8s-node1.example.com k8s-node2.example.com"

# Create dirs:
/bin/mkdir -p /root/certs/{apiserver-keys,worker-keys}
/bin/mkdir -p /etc/kubernetes/ssl

######################################
# Create a new certificate authority #
######################################
/bin/openssl genrsa -out /root/certs/ca-key.pem 2048
/bin/openssl req -x509 -new -nodes -key /root/certs/ca-key.pem -days 10000 -out /root/certs/ca.pem -subj "/CN=kube-ca"

###################################
# Generate the API Server Keypair #
###################################
# Create OpenSSL conf file
/bin/cat > /root/certs/apiserver-keys/openssl.cnf <<EOF
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = kubernetes
DNS.2 = kubernetes.default
DNS.3 = kubernetes.default.svc
DNS.4 = kubernetes.default.svc.cluster.local
DNS.5 = ${MASTER_DNS_NAME}
IP.1 = ${K8S_SERVICE_IP}
IP.2 = ${MASTER_HOST}
IP.3 = ${MASTER_IP}
IP.4 = ${MASTER_LOADBALANCER_IP}
EOF

/bin/openssl genrsa -out /root/certs/apiserver-keys/apiserver-key.pem 2048

/bin/openssl req -new -key /root/certs/apiserver-keys/apiserver-key.pem \
  -out /root/certs/apiserver-keys/apiserver.csr -subj "/CN=kube-apiserver" \
  -config /root/certs/apiserver-keys/openssl.cnf

/bin/openssl x509 -req -in /root/certs/apiserver-keys/apiserver.csr \
  -CA /root/certs/ca.pem -CAkey /root/certs/ca-key.pem -CAcreateserial \
  -out /root/certs/apiserver-keys/apiserver.pem -days 365 -extensions v3_req \
  -extfile /root/certs/apiserver-keys/openssl.cnf

###########################################
# Generate the Kubernetes Worker Keypairs #
###########################################
/bin/cat > /root/certs/worker-keys/worker-openssl.cnf <<EOF
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
[req_distinguished_name]
[ v3_req ]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
subjectAltName = @alt_names
[alt_names]
IP.1 = \$ENV::WORKER_IP
EOF


for i in $WORKERS;
 do
    WORKER_IP=`getent hosts $i | awk '{ print $1 }'`
    WORKER_FQDN="$i"
    /bin/openssl genrsa -out /root/certs/worker-keys/${WORKER_FQDN}-worker-key.pem 2048
    WORKER_IP=${WORKER_IP} /bin/openssl req -new -key /root/certs/worker-keys/${WORKER_FQDN}-worker-key.pem -out /root/certs/worker-keys/${WORKER_FQDN}-worker.csr -subj "/CN=${WORKER_FQDN}" -config /root/certs/worker-keys/worker-openssl.cnf
    WORKER_IP=${WORKER_IP} /bin/openssl x509 -req -in /root/certs/worker-keys/${WORKER_FQDN}-worker.csr -CA /root/certs/ca.pem -CAkey /root/certs/ca-key.pem -CAcreateserial -out /root/certs/worker-keys/${WORKER_FQDN}-worker.pem -days 365 -extensions v3_req -extfile /root/certs/worker-keys/worker-openssl.cnf
 done

cp /root/certs/ca-key.pem /etc/kubernetes/ssl/
cp /root/certs/ca.pem /etc/kubernetes/ssl/
cp /root/certs/apiserver-keys/apiserver.csr /etc/kubernetes/ssl/
cp /root/certs/apiserver-keys/apiserver-key.pem /etc/kubernetes/ssl/
cp /root/certs/apiserver-keys/apiserver.pem /etc/kubernetes/ssl/
