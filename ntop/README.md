# License
Invalid nProbe license (/etc/nprobe.license) [Missing license file]  
NOTE: This is a DEMO version limited to 25000 flows export.

ntopng will now run in enterprise edition for 10 minutes before returning to community mode

# Examples
```
# docker run --rm -it fzinfz/ntop nprobe -v
# docker run --rm -it fzinfz/ntop ntopng --version
```
## Push Mode
```
docker run  --name ntop-push-ntopng --net host --privileged -d --restart unless-stopped fzinfz/ntop \
    ntopng -i "tcp://*:1235c"  --zmq-encrypt-pwd pwd -r "$REDIS_IP:6379" -m "192.168.0.0/16,172.16.0.0/12,10.0.0.0/8" 

docker run --name ntop-push_nprobe-coll --net=host -d  --restart unless-stopped  fzinfz/ntop \
    nprobe  -n none -3 2055 --zmq "tcp://127.0.0.1:1235"  --zmq-probe-mode --zmq-encrypt-pwd pwd

docker run --name ntop-push-nprobe --net=host --privileged -d  --restart unless-stopped  fzinfz/ntop \
    nprobe -i eth0 -n none  --zmq "tcp://127.0.0.1:1235" --zmq-probe-mode --zmq-encrypt-pwd pwd
```

### Official Guide
http://www.ntop.org/nprobe/advanced-flow-collection-with-ntopng-and-nprobe/
http://www.ntop.org/support/documentation/documentation/

## Poll Mode
```
nprobe --zmq "tcp://*:5556" -i eth1 -n none (probe mode)
nprobe --zmq "tcp://*:5556" -i none -n none --collector-port 2055 (sFlow/NetFlow collector mode)

ntopng -i tcp://<nprobe ip>:5556
```

# Misc
```
nprobe -n <host:port|none> [-i <interface|dump file>] [-t <lifetime timeout>]
 [-d <idle timeout>] [-l <queue timeout>] [-s <snaplen>]
 [-p <aggregation>] [-f <filter>] [-a] [-b <level>] [-G] [-O <# threads>]
 [-P <path>] [-F <dump timeout>] [-D <format>]
 [-u <in dev idx>] [-Q <out dev idx>]
 [-I <probe name>] [-v] [-w <hash size>] [-e <flow delay>] [-B <packet count>]
 [-z <min flow size>] [-M <max num flows>]
 [-x <payload policy>] [-E <engine>] [-C <flow lock file>]
 [-m <min # flows>] [-R <cmd>]
 [-S <sample rate>] [-A <AS list>] [-g <PID file>]
 [-T <flow template>] [-U <flow template id>]
 [-o <v9 templ. export policy>] [-L <local nets>] [-c] [-r]
 [-1 <interface nets>] [-2 <number>] [-3 <port>] [-4] [-5 <port>] [-6]
 [-9 <path>] [--black-list <networks>] [--pcap-file-list <filename>]
 [-N <biflows export policy>] [--dont-drop-privileges] 

-n: collector addresses
    if on a collector address the destination port is omitted, flows are sent to 2055 port and whereas if all the option is not specified, by default, flows are sent to the loop back interface (127.0.0.1) on port 2055.  
    If you specify none as value, no flow will be export; in this case the -P parameter is mandatory. 
[--collector-port|-3]:  NetFlow/IPFIX/sFlow collector flows port 
-i: interface name
```
