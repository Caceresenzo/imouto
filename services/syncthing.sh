docker run -d \
  --name=syncthing \
  -p 8384:8384 \
  -p 22001:22001 \
  -p 21028:21028/udp \
  -v /redundant/internal/configuration/syncthing:/config \
  -v /redundant/:/redundant \
  -v /storage/media/sync/:/storage-sync \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart unless-stopped \
  ghcr.io/linuxserver/syncthing
