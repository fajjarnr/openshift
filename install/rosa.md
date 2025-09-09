# To login to your Red Hat account, get an offline access token at

# https://console.redhat.com/openshift/token/rosa

```sh
rosa login

rosa whoami

rosa create account-roles --classic --mode auto -y

rosa create oidc-config --mode auto -y

rosa create operator-roles --prefix rosalina --oidc-config-id 2l3flmulnfpe1a4sji2p9rco1bt6jktr --mode auto -y
```

```sh
CLUSTER_NAME="rosalina"
MACHINE_TYPE="m5.2xlarge"
CLUSTER_VERSION="4.16.45"
REGION="ap-southeast-1"
SUBNETS="subnet-0dbbbd062071ba6ea,subnet-0e5c568211de3add3,subnet-0bfd159f00c53c4e0,subnet-08ef8123c195b7e91,subnet-05a3e252d79a8acc2,subnet-007f64e57d7ea9388"
MACHINE_CIDR="10.0.0.0/16"
SERVICE_CIDR="172.30.0.0/16"
POD_CIDR="10.128.0.0/16"
HOST_PREFIX=23
REPLICAS=3
DISK_SIZE="128GiB"
IMDSV2="required"
TAGS="mycluster:rosalina"
OIDC_ID="2l3flmulnfpe1a4sji2p9rco1bt6jktr"
PASSWORD="#11RahasiaBangetSekali12345!"
```

```sh
rosa create cluster \
    --multi-az \
    --oidc-config-id=$OIDC_ID \
    --domain-prefix=$CLUSTER_NAME \
    --cluster-name=$CLUSTER_NAME \
    --version=$CLUSTER_VERSION \
    --compute-machine-type=$MACHINE_TYPE \
    --region=$REGION \
    --subnet-ids=$SUBNETS \
    --machine-cidr=$MACHINE_CIDR \
    --service-cidr=$SERVICE_CIDR \
    --pod-cidr=$POD_CIDR \
    --host-prefix=$HOST_PREFIX \
    --replicas=$REPLICAS \
    --worker-disk-size=$DISK_SIZE \
    --ec2-metadata-http-tokens=$IMDSV2 \
    --operator-roles-prefix=$CLUSTER_NAME \
    --create-admin-user \
    --cluster-admin-password=$PASSWORD \
    --tags=$TAGS \
    --sts \
    --mode auto -y
```

```sh
rosa describe cluster -c rosalina

rosa logs install -c rosalina --watch
```
