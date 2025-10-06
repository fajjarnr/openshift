```sh
ls -l /dev/disk/by-path
ls -l /dev/disk/by-id
```

```yaml
apiVersion: lvm.topolvm.io/v1alpha1
kind: LVMCluster
metadata:
  name: lvmcluster
  namespace: openshift-storage
spec:
  storage:
    deviceClasses:
      - name: vg-data
        fstype: xfs
        deviceSelector:
          paths:
            - /dev/disk/by-path/pci-0000:00:1e.0-nvme-1
            - /dev/disk/by-path/pci-0000:00:1d.0-nvme-1
            - /dev/disk/by-path/pci-0000:00:1f.0-nvme-1
          forceWipeDevicesAndDestroyAllData: true
        thinPoolConfig:
          name: thin-pool-1
          sizePercent: 90
          overprovisionRatio: 10
          chunkSizeCalculationPolicy: Static
          metadataSizeCalculationPolicy: Host
```

```sh
pvs -S vgname=vg-data
```
