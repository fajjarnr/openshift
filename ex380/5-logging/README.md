```sh
sudo apt update
sudo apt install -y rsyslog
sudo systemctl enable --now rsyslog
sudo systemctl status rsyslog
```

```sh
sudo nano /etc/rsyslog.d/10-openshift.conf
```

```sh
# ============================================================
# OpenShift log receiver (non-TLS, TCP 514)
# ============================================================

# Load module untuk TCP
module(load="imtcp")

# Izinkan pembuatan direktori & file log
$CreateDirs on
$DirCreateMode 0755
$FileCreateMode 0640

# Queue settings (biar aman kalau banyak log)
main_queue(
  queue.type="LinkedList"
  queue.size="100000"
  queue.workerThreads="2"
  queue.maxdiskspace="2g"
  queue.filename="mainq"
  queue.saveonshutdown="on"
)

# Template log — tulis pesan mentah
template(name="plain_msg" type="string" string="%msg%\n")

# Pisahkan ruleset per kategori log
ruleset(name="rs_app"){
  action(type="omfile" file="/var/log/openshift/app.logs" template="plain_msg")
}

ruleset(name="rs_infra"){
  action(type="omfile" file="/var/log/openshift/infra.logs" template="plain_msg")
}

ruleset(name="rs_audit"){
  action(type="omfile" file="/var/log/openshift/audit.logs" template="plain_msg")
}

# Listener TCP 514 (non-TLS)
# Gunakan port berbeda agar CLF bisa mapping jelas
input(type="imtcp" port="514"  ruleset="rs_app"   name="tcp-app")
input(type="imtcp" port="515"  ruleset="rs_infra" name="tcp-infra")
input(type="imtcp" port="516"  ruleset="rs_audit" name="tcp-audit")
```

```sh
sudo systemctl restart rsyslog
sudo ss -lntp | grep rsyslog
```
