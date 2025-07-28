# Install Openshift

Cara Generate SSH Key ED25519

```sh
ssh-keygen -t ed25519 -f ~/.ssh/openshift_ed25519
```

SSH ke Node Setelah Cluster Jadi

```sh
ssh -i ~/.ssh/openshift_ed25519 core@<ip-node>
```

Tips : Jika kamu pakai SSH agent (agar tidak ketik path terus), tambahkan:

```sh
ssh-add ~/.ssh/openshift_ed25519
```