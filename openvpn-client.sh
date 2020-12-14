docker run -it -d \
  --name vpn \
  -p 1160:80 \
  -p 5000:5000 \
  -p 51413:51413 \
  -p 6881:6881/udp \
  -p 8112:8112 \
  --dns 1.1.1.1 \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -v /storage/internal/vpn:/vpn \
  --restart unless-stopped \
  dperson/openvpn-client
