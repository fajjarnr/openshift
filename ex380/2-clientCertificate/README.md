```sh
openssl req -new -nodes -newkey rsa:4096 -keyout my.key -subj "/O=devops/O=cicd/CN=fajar" -out my.csr
```

```sh
base64 -w0 my.csr
```

```sh
oc apply -f csr.yaml
oc get csr
oc adm certificate approve my-client-csr

oc describe csr my-client-csr
oc get csr my-client-csr -o jsonpath='{.status.certificate}' | base64 -d > my.crt
```

```sh
oc config set-credentials fajar --client-certificate mycert.crt --client-key my.key --embed-certs --kubeconfig fajar.kubeconfig

oc config set-cluster ocp-cluster --server https://api.cluster-c9vs9.sandbox3266.opentlc.com:6443 --kubeconfig fajar.config

oc config set-context fajar-ocp --cluster ocp-cluster --user fajar --kubeconfig fajar.config

oc config use-context fajar-ocp --kubeconfig fajar.config

oc whoami --kubeconfig fajar.config
#  if get error
#  Unable to connect to the server: tls: failed to verify certificate: x509: certificate signed by unknown authority
# add insecure-skip-tls-verify: true
```

add cluster role

```sh
oc get co --kubeconfig fajar.config # default cluster-admin
oc create clusterrolebinding cluster-reader-fajar --clusterrole cluster-reader --user fajar
oc project online-boutiques --kubeconfig fajar.config
oc get pod -n online-boutiques --kubeconfig fajar.config
oc delete pod adservice-5687f8757c-8bjgt --kubeconfig fajar.config
```
