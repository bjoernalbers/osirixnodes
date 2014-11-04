## How to build the SSL cert from Comodo:

### Concat the certificate

    neo:www_osirixnodes_com bjoern$ ls -1
    AddTrustExternalCARoot.crt
    COMODORSAAddTrustCA.crt
    COMODORSADomainValidationSecureServerCA.crt
    www_osirixnodes_com.crt
    neo:www_osirixnodes_com bjoern$ cat www_osirixnodes_com.crt \
    > COMODORSADomainValidationSecureServerCA.crt \
    > COMODORSAAddTrustCA.crt \
    > AddTrustExternalCARoot.crt > ssl_cert.crt

### copy the private key from dnsimple

    neo:www_osirixnodes_com bjoern$ mv ~/Downloads/www_osirixnodes_com.key \
    > ssl_private_key.key

Move both files to config dir.

Then upload both files to server:

    bundle exec cap production setup:ssl

See also:
https://support.comodo.com/index.php?/Default/Knowledgebase/Article/View/789/37/certificate-installation-nginx
