CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]
then
	echo "client name not specified"
	exit 1
fi

docker run --rm -it \
  -v /storage/internal/config/openvpn-server:/etc/openvpn \
  kylemanna/openvpn \
  easyrsa build-client-full "$CLIENT_NAME" nopass
