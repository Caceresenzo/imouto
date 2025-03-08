docker run -d \
  --name=plex \
  -p 32400:32400 \
  -e VERSION=docker \
  -v /redundant/internal/configuration/plex:/config \
  -v /storage/media/:/storage-media \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex
