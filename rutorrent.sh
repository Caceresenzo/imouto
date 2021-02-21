docker run -d \
  --name=rutorrent \
  -v /redundant/internal/config/rutorrent:/config \
  -v /storage:/storage \
  --net=container:vpn \
  --restart unless-stopped \
  ghcr.io/linuxserver/rutorrent
