```sh
scp lab@utility:/var/www/html/openshift4/images/fedora34.qcow2 .
scp lab@utility:/var/www/html/openshift4/images/helloworld.qcow2 .
scp lab@utility:/var/www/html/openshift4/images/mariadb-client.qcow2 .
scp lab@utility:/var/www/html/openshift4/images/mariadb-server.qcow2 .
scp lab@utility:/var/www/html/openshift4/images/rhel9-helloworld.qcow2 .
scp lab@utility:/var/www/html/openshift4/images/rhel9-mariadb.qcow2 .
scp lab@utility:/var/www/html/openshift4/images/rhel9-web.ova .
scp lab@utility:/var/www/html/openshift4/images/rhel9.qcow2 .

aws s3 ls

aws s3 cp dev-dbaccess.qcow2 s3://bucket_name
aws s3 cp fedora34.qcow2 s3://bucket_name
aws s3 cp helloworld.qcow2 s3://bucket_name
aws s3 cp mariadb-client.qcow2 s3://bucket_name
aws s3 cp mariadb-server.qcow2 s3://bucket_name
aws s3 cp rhel9-helloworld.qcow2 s3://bucket_name
aws s3 cp rhel9-mariadb.qcow2 s3://bucket_name
aws s3 cp rhel9-web.ova s3://bucket_name
aws s3 cp rhel9.qcow2 s3://bucket_name
```
