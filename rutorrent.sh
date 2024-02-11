docker run -d \
  --name=rutorrent \
  -v /redundant/internal/configuration/rutorrent:/config \
  -v /storage/downloads:/downloads \
  -v /storage:/storage \
  --net=container:vpn \
  --restart unless-stopped \
  ghcr.io/linuxserver/rutorrent
