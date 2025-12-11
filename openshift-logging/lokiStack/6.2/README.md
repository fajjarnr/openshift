```sh
oc adm policy add-cluster-role-to-user logging-collector-logs-writer -z logging-collector -n openshift-logging

oc adm policy add-cluster-role-to-user collect-application-logs -z logging-collector -n openshift-logging

oc adm policy add-cluster-role-to-user collect-infrastructure-logs -z logging-collector -n openshift-logging
```