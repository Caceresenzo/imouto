docker run -d \
  --name=syncthing \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  -v /redundant/internal/config/syncthing:/config \
  -v /storage/media/sync/:/storage-sync \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart unless-stopped \
  ghcr.io/linuxserver/syncthing
