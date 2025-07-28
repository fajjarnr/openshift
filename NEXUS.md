<https://www.hafifbilgiler.com/hafif-bilgiler/how-can-we-integrate-the-nexus-with-openshift-for-image-registry/>

buat nginx.conf dan copy kan ke /etc/nginx/conf.d/default.conf

```sh
server {
    listen 8443 ssl;

    server_name nexus.fajar-project.site;
    ssl_certificate /opt/server.crt;
    ssl_certificate_key /opt/server.key;
    client_max_body_size 640M;

    location / {
        proxy_pass http://nexus.fajar-project.site:8081;
    }
}
```

buat ssl.conf

```sh
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
C = ID
ST = Jakarta
L = Jakarta
O = Mastersystem
OU = DevOps
CN = Nexus

[v3_req]
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = IP:108.137.10.198, DNS:nexus.fajar-project.site
```

buat crt dan key dari ssl.conf

```sh
openssl genpkey -algorithm RSA -out server.key
openssl req -new -key server.key -out server.csr -config ssl.conf
openssl x509 -req -in server.csr -signkey server.key -out server.crt -days 365
```

```sh
openssl genpkey -algorithm RSA -out root_ca.key
openssl req -new -x509 -key root_ca.key -out root_ca.crt -days 3650 -config ssl.conf
```

```sh
systemctl enable --now nginx
systemctl restart nexus
```

```sh
oc create secret docker-registry nexus-docker-registry --docker-server=108.137.10.198:8443 --docker-username=admin --docker-password=P@ssw0rd123

oc create configmap nexus-docker-repo -n openshift-config --from-file=108.137.10.198:8443=root_ca.crt
```

akses nexus {IP_ADDRESS}:8443
