View the certs in nssdb
```
sudo certutil -d /etc/pki/nssdb/ -L
```

View the keys in nssdb
```
sudo certutil -d /etc/pki/nssdb/ -K
```

Import keys into nssdb
```
sudo pk12util -i /tmp/msg-client-errata-dev.p12 -d /etc/pki/nssdb
```

Import certs into nssdb
```
sudo certutil -d /etc/pki/nssdb/ -A -i <cert path> -n <name> -t C
```

Mard cert trusted
```
sudo certutil -A -t "${trust_type:-TC,Tw,Tw}" -n "<nickname>" -d "/etc/pki/nssdb" -i "<cert path>"
```
