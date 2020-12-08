docker run -d \
  --name=plex \
  --net=host \
  -e VERSION=docker \
  -v /storage/internal/config/plex:/config \
  -v /storage/media/shared/:/storage-shared \
  -v /storage/media/private/:/storage-private \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex
