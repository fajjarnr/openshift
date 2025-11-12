- <https://stephennimmo.com/2024/05/15/generating-lets-encrypt-certificates-with-red-hat-openshift-cert-manager-operator-using-the-cloudflare-dns-solver/>


# Buat user khusus cert-manager
aws iam create-user --user-name cert-manager-route53

# Attach policy
aws iam attach-user-policy --user-name cert-manager-route53 --policy-arn arn:aws:iam::YOUR_ACCOUNT:policy/CertManagerRoute53PublicOnly

# Buat access key
aws iam create-access-key --user-name cert-manager-route53