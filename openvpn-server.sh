docker run -d \
  --name=openvpn-server \
  -v /storage/internal/config/openvpn-server:/etc/openvpn \
  -p 1194:1194/udp \
  --cap-add=NET_ADMIN \
  --restart=unless-stopped \
  kylemanna/openvpn
