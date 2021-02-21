docker run -d \
  --name=radarr \
  -p 7878:7878 \
  -v /redundant/internal/config/radarr/:/config \
  -v /storage:/storage \
  -v /storage/downloads:/downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/radarr
