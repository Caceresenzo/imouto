docker run --rm \
  -v /storage/internal/config/openvpn-server:/etc/openvpn \
  kylemanna/openvpn \
  ovpn_genconfig -u udp://imouto.oniichan.app

docker run --rm -it \
  -v /storage/internal/config/openvpn-server:/etc/openvpn \
  kylemanna/openvpn \
  ovpn_initpki
