#!/usr/bin/env bash

# SEE: https://gist.github.com/scriptingosx/670991d7ec2661605f4e3a40da0e37aa
os_ver=${1:-$(sw_vers -productVersion)}

# SEE: https://help.dreamhost.com/hc/en-us/articles/214981288-Flushing-your-DNS-cache-in-Mac-OS-X-and-Linux
# SEE: https://macpaw.com/how-to/clear-dns-cache-on-mac
if [[ "$os_ver" == 10.14.* || "$os_ver" == 10.15.* ]]; then
  sudo killall -HUP mDNSResponder;
  sudo killall mDNSResponderHelper;
  sudo dscacheutil -flushcache;
  sleep 2;
fi
