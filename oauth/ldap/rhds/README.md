```sh
ldapsearch -H ldap://idm.sandbox2151.opentlc.com -b 'dc=sandbox2151,dc=opentlc,dc=com' -D 'uid=admin,cn=users,cn=accounts,dc=sandbox2151,dc=opentlc,dc=com' -w P@ssw0rd123 uid=fajar
```

# extended LDIF

#

# LDAPv3

# base <dc=sandbox2151,dc=opentlc,dc=com> with scope subtree

# filter: uid=fajar

# requesting: ALL

#

# fajar, users, compat, sandbox2151.opentlc.com

dn: uid=fajar,cn=users,cn=compat,dc=sandbox2151,dc=opentlc,dc=com
objectClass: posixAccount
objectClass: ipaOverrideTarget
objectClass: top
gecos: Fajar Nur Rohman
cn: Fajar Nur Rohman
uidNumber: 1256800003
gidNumber: 1256800000
loginShell: /bin/sh
homeDirectory: /home/fajar
ipaAnchorUUID:: OklQQTpzYW5kYm94MjE1MS5vcGVudGxjLmNvbTpmN2QyYmE2MC00YjdkLTExZj
 AtODExNC0wNjgwZjUwNDQyMWQ=
uid: fajar

# fajar, users, accounts, sandbox2151.opentlc.com

dn: uid=fajar,cn=users,cn=accounts,dc=sandbox2151,dc=opentlc,dc=com
uid: fajar
displayName: Fajar Nur Rohman
initials: fn
gecos: fajar nur rohman
krbPrincipalName: <fajar@SANDBOX2151.OPENTLC.COM>
gidNumber: 1256800000
objectClass: top
objectClass: person
objectClass: organizationalperson
objectClass: inetorgperson
objectClass: inetuser
objectClass: posixaccount
objectClass: krbprincipalaux
objectClass: krbticketpolicyaux
objectClass: ipaobject
objectClass: ipasshuser
objectClass: ipaSshGroupOfPubKeys
objectClass: mepOriginEntry
objectClass: ipantuserattrs
loginShell: /bin/sh
homeDirectory: /home/fajar
mail: <fajar@sandbox2151.opentlc.com>
krbCanonicalName: <fajar@SANDBOX2151.OPENTLC.COM>
ipaUniqueID: f7d2ba60-4b7d-11f0-8114-0680f504421d
uidNumber: 1256800003
krbPasswordExpiration: 20250915132234Z
krbLastPwdChange: 20250617132234Z
krbExtraData:: AAIabFFoZmFqYXJAU0FOREJPWDIxNTEuT1BFTlRMQy5DT00A
mepManagedEntry: cn=fajar,cn=groups,cn=accounts,dc=sandbox2151,dc=opentlc,dc=c
 om
ipaNTSecurityIdentifier: S-1-5-21-1773232751-669587228-3413529376-1003
memberOf: cn=admins,cn=groups,cn=accounts,dc=sandbox2151,dc=opentlc,dc=com
memberOf: cn=Replication Administrators,cn=privileges,cn=pbac,dc=sandbox2151,d
 c=opentlc,dc=com
memberOf: cn=Add Replication Agreements,cn=permissions,cn=pbac,dc=sandbox2151,
 dc=opentlc,dc=com
memberOf: cn=Modify Replication Agreements,cn=permissions,cn=pbac,dc=sandbox21
 51,dc=opentlc,dc=com
memberOf: cn=Read Replication Agreements,cn=permissions,cn=pbac,dc=sandbox2151
 ,dc=opentlc,dc=com
memberOf: cn=Remove Replication Agreements,cn=permissions,cn=pbac,dc=sandbox21
 51,dc=opentlc,dc=com
memberOf: cn=Modify DNA Range,cn=permissions,cn=pbac,dc=sandbox2151,dc=opentlc
 ,dc=com
memberOf: cn=Read PassSync Managers Configuration,cn=permissions,cn=pbac,dc=sa
 ndbox2151,dc=opentlc,dc=com
memberOf: cn=Read Replication Changelog Configuration,cn=permissions,cn=pbac,d
 c=sandbox2151,dc=opentlc,dc=com
memberOf: cn=Write Replication Changelog Configuration,cn=permissions,cn=pbac,
 dc=sandbox2151,dc=opentlc,dc=com
memberOf: cn=Modify PassSync Managers Configuration,cn=permissions,cn=pbac,dc=
 sandbox2151,dc=opentlc,dc=com
memberOf: cn=Read LDBM Database Configuration,cn=permissions,cn=pbac,dc=sandbo
 x2151,dc=opentlc,dc=com
memberOf: cn=Add Configuration Sub-Entries,cn=permissions,cn=pbac,dc=sandbox21
 51,dc=opentlc,dc=com
memberOf: cn=Read DNA Range,cn=permissions,cn=pbac,dc=sandbox2151,dc=opentlc,d
 c=com
memberOf: cn=Read domain level,cn=permissions,cn=pbac,dc=sandbox2151,dc=opentl
 c,dc=com
memberOf: cn=System: Add Topology Segments,cn=permissions,cn=pbac,dc=sandbox21
 51,dc=opentlc,dc=com
memberOf: cn=System: Modify Topology Segments,cn=permissions,cn=pbac,dc=sandbo
 x2151,dc=opentlc,dc=com
memberOf: cn=System: Read Topology Segments,cn=permissions,cn=pbac,dc=sandbox2
 151,dc=opentlc,dc=com
memberOf: cn=System: Remove Topology Segments,cn=permissions,cn=pbac,dc=sandbo
 x2151,dc=opentlc,dc=com
memberOf: cn=Host Enrollment,cn=privileges,cn=pbac,dc=sandbox2151,dc=opentlc,d
 c=com
memberOf: cn=System: Add krbPrincipalName to a Host,cn=permissions,cn=pbac,dc=
 sandbox2151,dc=opentlc,dc=com
memberOf: cn=System: Enroll a Host,cn=permissions,cn=pbac,dc=sandbox2151,dc=op
 entlc,dc=com
memberOf: cn=System: Manage Host Certificates,cn=permissions,cn=pbac,dc=sandbo
 x2151,dc=opentlc,dc=com
memberOf: cn=System: Manage Host Enrollment Password,cn=permissions,cn=pbac,dc
 =sandbox2151,dc=opentlc,dc=com
memberOf: cn=System: Manage Host Keytab,cn=permissions,cn=pbac,dc=sandbox2151,
 dc=opentlc,dc=com
memberOf: cn=System: Manage Host Principals,cn=permissions,cn=pbac,dc=sandbox2
 151,dc=opentlc,dc=com
memberOf: cn=ipausers,cn=groups,cn=accounts,dc=sandbox2151,dc=opentlc,dc=com
title: DevOps
street: Pegiringan, Bantarbolang
st: Jawa Tengah
postalCode: 52352
l: Pemalang
sn: Nur Rohman
cn: Fajar Nur Rohman
givenName: Fajar
krbLoginFailedCount: 0
krbLastFailedAuth: 20250617151339Z

# search result

search: 2
result: 0 Success

# numResponses: 3

# numEntries: 2
