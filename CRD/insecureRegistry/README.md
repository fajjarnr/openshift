# Configuring image registry settings

<https://docs.openshift.com/container-platform/4.10/openshift_images/image-configuration.html>

untuk menambahkan insecure registry dari nexus agar bisa pull image oleh openshift harus edit

```sh
oc edit image.config.openshift.io/cluster
```

nexus url

```md
108.137.80.76:8082
```

```yaml
apiVersion: config.openshift.io/v1
kind: Image
metadata:
  name: cluster
spec:
  registrySources:
    insecureRegistries:
      - '108.137.80.76:8082'
```

buat secret copy value dari $HOME/.docker/config.json

<https://docs.openshift.com/container-platform/4.10/openshift_images/managing_images/using-image-pull-secrets.html>

```json
{
  "auths": {
    "108.137.80.76:8082": {
      "username": "fajjarnr",
      "password": "P@ssw0rd123",
      "auth": "ZmFqamFybnI6UEBzc3cwcmQxMjM=",
      "email": "fajjarnr@gmail.com"
    }
  }
}
```

jika membuat .dockercfg file secara manual

```sh
oc create secret generic <pull_secret_name> --from-file=.dockerconfigjson=.dockercfg --type=kubernetes.io/dockercfg
```

jika sudah mempunyai $HOME/.docker/config.json

```sh
oc create secret generic <pull_secret_name> --from-file=.dockerconfigjson=<path/to/.docker/config.json> --type=kubernetes.io/dockerconfigjson
```
