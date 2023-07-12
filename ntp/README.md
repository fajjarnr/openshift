solution for network on master or worker

<https://access.redhat.com/solutions/5487331>

to change timezone on pods

<https://access.redhat.com/solutions/2567961>

open bastion and run

```sh
oc create configmap tz-jakarta --from-file=localtime=/usr/share/zoneinfo/Asia/Jakarta
```

```sh
oc set volumes deployments/httpd --add \
        --type=configmap --name=tz --configmap-name=tz-jakarta \
        --mount-path=/etc/localtime --sub-path=localtime
```
