docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 1120:80 \
    -v "/storage/internal/config/pihole/etc-pihole/:/etc/pihole/" \
    -v "/storage/internal/config/pihole/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    pihole/pihole:latest
#    -e ServerIP="127.0.0.1" \
#    -p 443:443 \

