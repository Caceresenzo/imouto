docker run -d \
  --name=resilio-sync \
  -p 8888:8888 \
  -p 55555:55555 \
  -v /redundant/internal/config/resilio-sync/config:/config \
  -v /storage/downloads:/downloads \
  -v /storage:/storage \
  -v /storage:/sync \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart unless-stopped \
  ghcr.io/linuxserver/resilio-sync
