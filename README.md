- port to open

```sh

firewall-cmd --add-port=53/tcp --zone=internal --permanent
firewall-cmd --add-port=53/udp --zone=internal --permanent

firewall-cmd --add-port=22/tcp --zone=internal --permanent

firewall-cmd --add-port=1936/tcp --zone=internal --permanent
firewall-cmd --add-port=1936/tcp --zone=external --permanent

firewall-cmd --add-port=10256/tcp --zone=internal --permanent
firewall-cmd --add-port=10256/tcp --zone=external --permanent

firewall-cmd --add-port=9000-9999/tcp --zone=internal --permanent
firewall-cmd --add-port=9000-9999/udp --zone=internal --permanent

firewall-cmd --add-port=9000-9999/tcp --zone=external --permanent
firewall-cmd --add-port=9000-9999/udp --zone=external --permanent

firewall-cmd --add-port=10250-10259/tcp --zone=internal --permanent
firewall-cmd --add-port=10250-10259/tcp --zone=external --permanent

firewall-cmd --add-port=30000-32767/tcp --zone=internal --permanent
firewall-cmd --add-port=30000-32767/tcp --zone=external --permanent


firewall-cmd --add-port=4789/udp --zone=internal --permanent
firewall-cmd --add-port=6081/udp --zone=internal --permanent
firewall-cmd --add-port=500/udp --zone=internal --permanent
firewall-cmd --add-port=4500/udp --zone=internal --permanent
firewall-cmd --add-port=30000-32767/udp --zone=internal --permanent

# firewall-cmd --add-port=9000/tcp --zone=external --permanent

firewall-cmd --add-port=2379-2380/tcp --zone=internal --permanent
firewall-cmd --add-port=2379-2380/tcp --zone=external --permanent

firewall-cmd --reload
```
