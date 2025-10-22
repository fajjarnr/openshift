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
            - /dev/disk/by-path/pci-0000:00:1d.0-nvme-1
            - /dev/disk/by-path/pci-0000:00:1e.0-nvme-1
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

```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: mysql
  namespace: database
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 20Gi
  storageClassName: lvms-vg-data
  volumeMode: Filesystem
```

```yaml
kind: StatefulSet
apiVersion: apps/v1
metadata:
  name: mysql
  namespace: database
spec:
  replicas: 0
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      volumes:
        - name: mysql
          persistentVolumeClaim:
            claimName: mysql
      containers:
        - name: mysql
          image: 'image-registry.openshift-image-registry.svc:5000/openshift/mysql:latest'
          ports:
            - name: mysql
              containerPort: 3306
              protocol: TCP
          env:
            - name: MYSQL_USER
              value: admin
            - name: MYSQL_PASSWORD
              value: pass
            - name: MYSQL_DATABASE
              value: mydb
          volumeMounts:
            - name: mysql
              mountPath: /var/lib/mysql
```

```sql
mysql -u admin -p
use mydb;

show tables;

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO Persons (PersonID, LastName, FirstName, Address, City)
VALUES
(1, 'Smith', 'John', '123 Main St', 'New York'),
(2, 'Johnson', 'Emily', '456 Oak Ave', 'Los Angeles'),
(3, 'Williams', 'Michael', '789 Pine Rd', 'Chicago'),
(4, 'Brown', 'Sarah', '321 Maple Dr', 'Houston'),
(5, 'Jones', 'David', '654 Cedar Ln', 'Phoenix'),
(6, 'Garcia', 'Maria', '987 Birch St', 'Philadelphia'),
(7, 'Miller', 'James', '147 Walnut St', 'San Antonio'),
(8, 'Davis', 'Linda', '258 Spruce Ct', 'San Diego'),
(9, 'Rodriguez', 'Robert', '369 Aspen Blvd', 'Dallas'),
(10, 'Martinez', 'Laura', '159 Cherry Pl', 'San Jose');

select * from Persons;
```
