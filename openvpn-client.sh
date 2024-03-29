docker run -it -d \
  --name vpn \
  -p 8090:8090 \
  -p 5000:5000 \
  -p 51413:51413 \
  -p 6881:6881/udp \
  -p 8112:8112 \
  --dns 1.1.1.1 \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -v /redundant/internal/vpn:/vpn \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart unless-stopped \
  dperson/openvpn-client
