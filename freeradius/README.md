# Dockerfile
https://github.com/fzinfz/docker-images/tree/master/freeradius

# Sample outputs
```
# docker run --rm -it fzinfz/freeradius  freeradius -v
radiusd: FreeRADIUS Version 3.0.12, for host x86_64-pc-linux-gnu, built on Dec  3 2016 at 15:55:32

radclient     radeapclient  radsniff      radwho        
radcrypt      radlast       radsqlrelay   radzap        
raddebug      radmin        radtest       

# docker run --rm -it fzinfz/freeradius:dev radiusd -v
Info  : radiusd: DEVELOPER BUILD - FreeRADIUS version 4.0.0 (git #d4e9cc7), for host x86_64-unknown-linux-gnu, built on May  8 2017 at 16:09:43

radclient             radiusd               radtest
radcrypt              radlast               radwho
raddebug              radmin                radzap
radius1_test          radsnmp               
radius_schedule_test  radsqlrelay           

root@FreeRADIUS Version 3.0.12:/etc/freeradius# ls -l
total 144
-rw-r--r-- 1 root    root    20808 Dec  3 15:56 README.rst
drwxr-s--x 2 freerad freerad  4096 May  9 05:44 certs
-rw-r----- 1 root    freerad  7476 Dec  3 15:56 clients.conf
-rw-r--r-- 1 root    freerad  1440 Dec  3 15:56 dictionary
-rw-r----- 1 root    freerad  2661 Dec  3 15:56 experimental.conf
lrwxrwxrwx 1 root    root       28 Dec  3 15:56 hints -> mods-config/preprocess/hints
lrwxrwxrwx 1 root    root       33 Dec  3 15:56 huntgroups -> mods-config/preprocess/huntgroups
drwxr-xr-x 2 root    root     4096 May  9 05:40 mods-available
drwxr-xr-x 9 root    root     4096 May  9 05:40 mods-config
drwxr-xr-x 2 root    root     4096 May  9 05:40 mods-enabled
-rw-r--r-- 1 root    root       52 Dec  3 15:56 panic.gdb
drwxr-s--x 2 freerad freerad  4096 May  9 05:40 policy.d
-rw-r----- 1 root    freerad 28361 Dec  3 15:56 proxy.conf
-rw-r----- 1 root    freerad 28651 Dec  3 15:56 radiusd.conf
drwxr-s--x 2 freerad freerad  4096 May  9 05:40 sites-available
drwxr-s--x 2 freerad freerad  4096 May  9 05:40 sites-enabled
-rw-r--r-- 1 root    root     3470 Dec  3 15:56 templates.conf
-rw-r--r-- 1 root    root     8536 Dec  3 15:56 trigger.conf
lrwxrwxrwx 1 root    root       27 Dec  3 15:56 users -> mods-config/files/authorize
```
