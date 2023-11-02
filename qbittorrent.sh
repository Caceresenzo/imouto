docker run -d \
  --name=qbittorrent \
  -v /redundant/internal/configuration/qbittorrent:/config \
  -v /storage/downloads:/downloads \
  -v /storage:/storage \
  -e WEBUI_PORT=8090 \
  -e DOCKER_MODS=linuxserver/mods:universal-stdout-logs \
  -e LOGS_TO_STDOUT=/config/qBittorrent/logs/qbittorrent.log \
  --net=container:vpn \
  --restart unless-stopped \
  ghcr.io/linuxserver/qbittorrent
