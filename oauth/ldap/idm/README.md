[root@idm ~]# dnf install ipa-server -y
[root@idm ~]# ipa-server-install

# The log file for this installation can be found in /var/log/ipaserver-install.log

This program will set up the IPA Server.
Version 4.12.2

This includes:

- Configure a stand-alone CA (dogtag) for certificate management
- Configure the NTP client (chronyd)
- Create and configure an instance of Directory Server
- Create and configure a Kerberos Key Distribution Center (KDC)
- Configure Apache (httpd)
- Configure SID generation
- Configure the KDC to enable PKINIT

To accept the default shown in brackets, press the Enter key.

Do you want to configure integrated DNS (BIND)? [no]: no

Enter the fully qualified domain name of the computer
on which you're setting up server software. Using the form
<hostname>.<domainname>
Example: master.example.com

Server host name [idm.fajjjar.my.id]:

The domain name has been determined based on the host name.

Please confirm the domain name [fajjjar.my.id]:

The kerberos protocol requires a Realm name to be defined.
This is typically the domain name converted to uppercase.

Please provide a realm name [FAJJJAR.MY.ID]:
Certain directory server operations require an administrative user.
This user is referred to as the Directory Manager and has full access
to the Directory for system management tasks and will be added to the
instance of directory server created for IPA.
The password must be at least 8 characters long.

Directory Manager password:
Password (confirm):

The IPA server requires an administrative user, named 'admin'.
This user is a regular system account used for IPA server administration.

IPA admin password:
Password (confirm):

No network interface matches the IP address 47.128.153.232
WARNING: No network interface matches the IP address 47.128.153.232
Trust is configured but no NetBIOS domain name found, setting it now.
Enter the NetBIOS name for the IPA domain.
Only up to 15 uppercase ASCII letters, digits and dashes are allowed.
Example: EXAMPLE.

NetBIOS domain name [FAJJJAR]:

Do you want to configure chrony with NTP server or pool address? [no]: no

The IPA Master Server will be configured with:
Hostname: idm.fajjjar.my.id
IP address(es): 47.128.153.232
Domain name: fajjjar.my.id
Realm name: FAJJJAR.MY.ID

The CA will be configured with:
Subject DN: CN=Certificate Authority,O=FAJJJAR.MY.ID
Subject base: O=FAJJJAR.MY.ID
Chaining: self-signed

Continue to configure the system with these values? [no]: yes

The following operations may take some minutes to complete.
Please wait until the prompt is returned.

Disabled p11-kit-proxy
Synchronizing time
No SRV records of NTP servers found and no NTP server or pool address was provided.
Using default chrony configuration.
Attempting to sync time with chronyc.
Time synchronization was successful.
Configuring directory server (dirsrv). Estimated time: 30 seconds
[1/43]: creating directory server instance
Validate installation settings ...
Create file system structures ...
Perform SELinux labeling ...
Create database backend: dc=fajjjar,dc=my,dc=id ...
Perform post-installation tasks ...

---

This step may take considerable amount of time, please wait..
Done.
Configuring client side components
This program will set up IPA client.
Version 4.12.2

Using existing certificate '/etc/ipa/ca.crt'.
Client hostname: idm.fajjjar.my.id
Realm: FAJJJAR.MY.ID
DNS Domain: fajjjar.my.id
IPA Server: idm.fajjjar.my.id
BaseDN: dc=fajjjar,dc=my,dc=id

Configured /etc/sssd/sssd.conf
Systemwide CA database updated.
Adding SSH public key from /etc/ssh/ssh_host_rsa_key.pub
Adding SSH public key from /etc/ssh/ssh_host_ecdsa_key.pub
Adding SSH public key from /etc/ssh/ssh_host_ed25519_key.pub
Could not update DNS SSHFP records.
SSSD enabled
Configured /etc/openldap/ldap.conf
Configured /etc/ssh/ssh_config
Configured /etc/ssh/sshd_config.d/04-ipa.conf
Configuring fajjjar.my.id as NIS domain.
Client configuration complete.
The ipa-client-install command was successful

# Please add records in this file to your DNS system: /tmp/ipa.system.records.djbegu1o.db

Setup complete

Next steps: 1. You must make sure these network ports are open:
TCP Ports:
_80, 443: HTTP/HTTPS
_ 389, 636: LDAP/LDAPS
_88, 464: kerberos
_ 53: bind
UDP Ports:
_88, 464: kerberos
_ 53: bind \* 123: ntp

        2. You can now obtain a kerberos ticket using the command: 'kinit admin'
           This ticket will allow you to use the IPA tools (e.g., ipa user-add)
           and the web user interface.

Be sure to back up the CA certificates stored in /root/cacert.p12
These files are required to create replicas. The password for these
files is the Directory Manager password
The ipa-server-install command was successful

```sh
ldapsearch -h 47.128.229.28 -b 'dc=ocp,dc=fajjjar,dc=my,dc=id' -D 'uid=admin,cn=users,cn=accounts,dc=ocp,dc=fajjjar,dc=my,dc=id' -w P@ssw0rd123 uid=admin

ldapsearch -h idm.ocp.fajjjar.my.id -b 'dc=ocp,dc=fajjjar,dc=my,dc=id' -D 'uid=admin,cn=users,cn=accounts,dc=ocp,dc=fajjjar,dc=my,dc=id' -w P@ssw0rd123 uid=fahrur

ldapsearch -D "cn=Directory Manager" -w P@ssw0rd123 -H ldaps://idm.ocp.fajjjar.my.id
```
