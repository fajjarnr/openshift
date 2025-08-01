# To login to your Red Hat account, get an offline access token at

# https://console.redhat.com/openshift/token/rosa

```sh
rosa login

rosa whoami

rosa create account-roles --classic --mode auto -y

rosa create oidc-config --mode auto -y

rosa create operator-roles --prefix rosalina --oidc-config-id 2kk9f2a4u0lvtp5lfdvdfgs0rl6i17ef --mode auto -y
```

```sh
CLUSTER_NAME="rosalina"
MACHINE_TYPE="m5.2xlarge"
CLUSTER_VERSION="4.16.45"
REGION="ap-southeast-1"
SUBNETS="subnet-01fd2a1a76ca2c817,subnet-0eef2b132beb8fcab,subnet-067265e67e89edb6d,subnet-0e440477d751e28f0,subnet-0265888023f36805a,subnet-04ad198c53ace5171"
MACHINE_CIDR="10.0.0.0/16"
SERVICE_CIDR="172.30.0.0/16"
POD_CIDR="10.128.0.0/16"
HOST_PREFIX=23
REPLICAS=3
DISK_SIZE="128GiB"
IMDSV2="required"
TAGS="mycluster:rosalina"
OIDC_ID="2kk9f2a4u0lvtp5lfdvdfgs0rl6i17ef"
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
