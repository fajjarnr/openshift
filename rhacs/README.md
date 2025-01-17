# Advanced Cluster Security for Kubernetes

to create custom password for rhacs

```sh
oc create secret generic htpasswd-stackrox --from-file=htpasswd=htpasswd --from-literal=password=PASSWORD
```
