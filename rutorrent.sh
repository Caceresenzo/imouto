docker run -d \
  --name=rutorrent \
  -v /storage/internal/config/rutorrent:/config \
  -v /storage:/storage \
  --net=container:vpn \
  --restart unless-stopped \
  ghcr.io/linuxserver/rutorrent

#  -p 1160:80 \
#  -p 5000:5000 \
#  -p 51413:51413 \
#  -p 6881:6881/udp \
