CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]
then
	echo "client name not specified"
	exit 1
fi

docker run --rm -it \
  -v /redundant/internal/config/openvpn-server:/etc/openvpn \
  kylemanna/openvpn \
  ovpn_getclient "$CLIENT_NAME" > "$CLIENT_NAME".ovpn
