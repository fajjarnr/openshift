untuk MachineConfigPool infra dan router basic nya dari MachineConfigPool worker

```yaml
apiVersion: machineconfiguration.openshift.io/v1
kind: MachineConfigPool
metadata:
  labels:
    machineconfiguration.openshift.io/mco-built-in: ''
    pools.operator.machineconfiguration.openshift.io/worker: ''
  name: infra # disesuaikan
spec:
  configuration:
    name: rendered-infra-d69a24735dbe7e9a5e85a06e607ae408 # name auto generate (tidak perlu dibuat)
    source: # custom sesuai kebutuhan (dibawah default 3)
      - apiVersion: machineconfiguration.openshift.io/v1
        kind: MachineConfig
        name: 00-worker
      - apiVersion: machineconfiguration.openshift.io/v1
        kind: MachineConfig
        name: 01-worker-container-runtime
      - apiVersion: machineconfiguration.openshift.io/v1
        kind: MachineConfig
        name: 01-worker-kubelet
    #   - apiVersion: machineconfiguration.openshift.io/v1
    #     kind: MachineConfig
    #     name: 99-worker-generated-crio-seccomp-use-default
    #   - apiVersion: machineconfiguration.openshift.io/v1
    #     kind: MachineConfig
    #     name: 99-worker-generated-registries
    #   - apiVersion: machineconfiguration.openshift.io/v1
    #     kind: MachineConfig
    #     name: 99-worker-ssh
  machineConfigSelector:
    matchLabels:
      machineconfiguration.openshift.io/role: worker
  nodeSelector:
    matchLabels:
      node-role.kubernetes.io/infra: '' # disesuiakan
  paused: false

```