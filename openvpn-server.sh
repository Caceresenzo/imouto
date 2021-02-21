docker run -d \
  --name=openvpn-server \
  -v /redundant/internal/config/openvpn-server:/etc/openvpn \
  -p 1194:1194/udp \
  --cap-add=NET_ADMIN \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart=unless-stopped \
  kylemanna/openvpn
