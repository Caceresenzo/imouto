docker run -d \
  --name=deluge \
  -e DELUGE_LOGLEVEL=error \
  -v /storage/internal/config/deluge/config:/config \
  -v /storage:/storage \
  -v /storage/downloads:/downloads \
  --net=container:vpn \
  --restart unless-stopped \
  ghcr.io/linuxserver/deluge
