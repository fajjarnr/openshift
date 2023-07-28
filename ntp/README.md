example documentation

<https://examples.openshift.pub/cluster-configuration/ntp/>

solution for network time protocol on master or worker

<https://access.redhat.com/solutions/5487331>

to change timezone on pods

<https://access.redhat.com/solutions/2567961>

open bastion and run

```sh
# create config map with name tz-jakarta with key is localtime from file /usr/share/zoneinfo/Asia/Jakarta
oc create configmap tz-jakarta --from-file=localtime=/usr/share/zoneinfo/Asia/Jakarta
```

```sh
# add new volume to deployment with type configmap
oc set volumes deployments/httpd --add \
        --type=configmap --name=tz --configmap-name=tz-jakarta \
        --mount-path=/etc/localtime --sub-path=localtime
```
