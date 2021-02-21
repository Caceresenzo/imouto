docker run -d \
  --name=plex \
  --net=host \
  -e VERSION=docker \
  -v /redundant/internal/config/plex:/config \
  -v /storage/media/shared/:/storage-shared \
  -v /storage/media/sync/:/storage-sync \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex
