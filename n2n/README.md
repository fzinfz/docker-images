# Guide
https://aosekai.net/2012/09/how-to-setup-a-decentralized-overlay-network-using-n2n/

# Supernode
```
#docker run --rm fzinfz/n2n supernode -h
supernode usage
-l <lport> Set UDP main listen port to <lport>
-s <snm_port> Set SNM listen port to <snm_port>
-i <ip:port> Set running SNM supernode to <ip:port>
-f Run in foreground.
-v Increase verbosity. Can be used multiple times.
-h This help message.
```

# Edge
```
#docker run --rm fzinfz/n2n edge -h
Welcome to n2n v.2.1.0 for unknown
Built on Apr 30 2017 19:04:24
Copyright 2007-09 - http://www.ntop.org

edge -d <tun device> -a [static:|dhcp:]<tun IP address> -c <community> [-k <encrypt key> | -K <key file>] [-s <netmask>] [-u <uid> -g <gid>][-f][-m <MAC address>]
-l <supernode host:port> [-p <local port>] [-M <mtu>] [-r] [-E] [-v] [-t <mgmt port>] [-b] [-h]

-d <tun device> | tun device name
-a <mode:address> | Set interface address. For DHCP use '-r -a dhcp:0.0.0.0'
-c <community> | n2n community name the edge belongs to.
-k <encrypt key> | Encryption key (ASCII) - also N2N_KEY=<encrypt key>. Not with -K.
-K <key file> | Specify a key schedule file to load. Not with -k.
-s <netmask> | Edge interface netmask in dotted decimal notation (255.255.255.0).
-l <supernode host:port> | Supernode IP:port
-b | Periodically resolve supernode IP
: (when supernodes are running on dynamic IPs)
-p <local port> | Fixed local UDP port.
-u <UID> | User ID (numeric) to use when privileges are dropped.
-g <GID> | Group ID (numeric) to use when privileges are dropped.
-f | Do not fork and run as a daemon; rather run in foreground.
-m <MAC address> | Fix MAC address for the TAP interface (otherwise it may be random)
: eg. -m 01:02:03:04:05:06
-M <mtu> | Specify n2n MTU of edge interface (default 1400).
-r | Enable packet forwarding through n2n community.
-E | Accept multicast MAC addresses (default=drop).
-v | Make more verbose. Repeat as required.
-t | Management UDP Port (for multiple edges on a machine).
-x <SNM port> | SNM port.

Environment variables:
N2N_KEY | Encryption key (ASCII). Not with -K or -k.
```
