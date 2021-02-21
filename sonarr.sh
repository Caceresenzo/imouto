docker run -d \
  --name=sonarr \
  -p 8989:8989 \
  -v /redundant/internal/config/sonarr/:/config \
  -v /storage:/storage \
  -v /storage/downloads:/downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/sonarr
