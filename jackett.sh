docker run -d \
  --name=jackett \
  -p 9117:9117 \
  -v /redundant/internal/config/jackett:/config \
  -v /storage/downloads/jackett:/downloads \
  --restart unless-stopped \
  ghcr.io/linuxserver/jackett
