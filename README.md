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


## How to deploy a fresh server (with blank database)


Bei DigitalOcean den Server neu aufsetzen (oder destroy > rebuild)
...dauert ein paar Sekunden / Minütchen

Die lokalen Host-Fingerabdrücke löschen (haben sich durch den neuen Server ja geändert)
und zwar für osirixnodes.com und 192.241.222.25:

    sed -i '' '/osirixnodes\.com/d' ~/.ssh/known_hosts

Nach dem provisioning einloggen und schauen, ob der Server oben ist (dann wird auch der
neue SSH-Fingerabdruck gespeichert):

    ssh root@osirixnodes.com uptime

In den Branch "provisioning" wechseln und dann den Server bootstrappen:

**Achtung: Unter Ruby 2.1 gab es Probleme, d.h. bitte Ruby 2.0 verwenden!**

    bundle exec knife solo bootstrap root@osirixnodes.com


Dann das erste Deployment mit Capistrano...


Vorher ausführen:

    bundle exec cap production setup:all # Mein Task (etwas doppelt gemoppelt
    bundle exec cap production deploy:setup_config # task von capistrano/cookbook (Deploying-Rails buch)

Bei jedem Deployment ausführen:

    bundle exec cap production deploy
