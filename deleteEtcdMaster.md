How to remove extra master nodes from an OpenShift 4 cluster

<https://access.redhat.com/solutions/6976637>

```sh
oc debug node/<master_to_delete> -- chroot /host shutdown now

oc debug node/ip-10-0-134-111.us-east-2.compute.internal -- chroot /host shutdown now
```

```sh
oc -n openshift-etcd exec etcd-<master_to_delete> -c etcdctl -- etcdctl member list -w table

oc -n openshift-etcd exec etcd-ip-10-0-134-111.us-east-2.compute.internal  -c etcdctl -- etcdctl member list -w table
```

```sh
oc -n openshift-etcd exec etcd-<master_to_delete> -c etcdctl -- etcdctl member remove <MEMBER_ID>

oc -n openshift-etcd exec etcd-ip-10-0-134-111.us-east-2.compute.internal -c etcdctl -- etcdctl member remove by4324dfdbf72131b2131ev
```

```sh
oc delete node <master_to_delete>

oc delete node ip-10-0-134-111.us-east-2.compute.internal
```

```sh
oc -n openshift-etcd get secrets | grep <master_to_delete>

oc -n openshift-etcd get secrets | grep etcd-ip-10-0-134-111.us-east-2.compute.internal
```

```sh
oc -n openshift-etcd delete secrets etcd-peer-<master_to_delete> \
                                      etcd-serving-<master_to_delete> \
                                      etcd-serving-metrics-<master_to_delete>

oc -n openshift-etcd delete secrets etcd-peer-ip-10-0-134-111.us-east-2.compute.internal \
                                      etcd-serving-ip-10-0-134-111.us-east-2.compute.internal \
                                      etcd-serving-metrics-ip-10-0-134-111.us-east-2.compute.internal
```

```sh
oc -n openshift-etcd exec etcd-ocp-<any_other_master> -c etcdctl -- etcdctl get --keys-only --prefix / | grep <master_to_delete>  > keys-to-delete.txt

oc exec etcd-ip-10-0-224-37.us-east-2.compute.internal -c etcdctl -- etcdctl get --keys-only --prefix / | grep 10-0-134-111 > keys-to-delete.txt
```

```sh
xargs -a keys-to-delete.txt -I % oc -n openshift-etcd exec etcd-<any_other_master> -c etcdctl -- etcdctl del %


xargs -a keys-to-delete.txt -I % oc -n openshift-etcd exec etcd-ip-10-0-224-37.us-east-2.compute.internal -c etcdctl -- etcdctl del %
```

```sh
oc edit cm -n kube-system cluster-config-v1 # 1 to 3
```
